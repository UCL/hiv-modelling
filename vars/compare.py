import re
from collections import Counter


def get_var_names(filename):
    comment_expr = r'/\*.*\*/'
    with open(filename) as f:
        text = f.read()
    only_vars = re.sub(comment_expr, '', text)
    var_names = only_vars.split()
    return var_names


def analyse_vars(var_names):
    num_vars = len(var_names)
    num_unique_vars = len(set(var_names))
    print(f"{filename}: Found {num_vars} variables.")
    print(f"{filename}: Found {num_unique_vars} unique variables.")

    if num_vars != num_unique_vars:
        print(f"{filename}: The following are listed multiple times:")
        counter = Counter(var_names)
        for var, count in counter.items():
            if count > 1:
                print(f"{var} (x {count})")
    print()


def report_difference(file1, names1, file2, names2):
    assert isinstance(names1, set)
    assert isinstance(names2, set)
    extra_names = names1 - names2
    if extra_names:
        print(f"Contained in {file1} and not {file2}:")
        for name in sorted(extra_names):
            print(f"{name}")
    else:
        print(f"All names in {file1} are contained in {file2}.")
    print()


def get_sum_variables(filename):
    # For finding all sum variables, regardless of what the second part is
    # e.g. "s_diag80 + registd ;"
    sum_expr = r'(s_[^;]*)\s*\+\s*(\w*)\s*;'
    # For finding sum variables where the right-hand side matches the sum
    # e.g. "s_dead_daly + dead_daly ;"
    # Note that we allow some flexibility with underscores and the _80 suffix
    # e.g. "s_dart_1_cost_80 + _dart_1_cost ;" will match
    exact_sum_expr = r's_(.*)(_80)?\s*\+\s*_?\1\s*;'
    print(f"For {filename}:")
    with open(filename) as f:
        text = f.read()
    # Use finditer to have access to both the whole string and the groups
    all_sums = list(re.finditer(sum_expr, text))
    all_sum_vars = [m[1].strip() for m in all_sums]
    unique_sum_vars = set(all_sum_vars)
    print(f"Found {len(all_sums)} sum expressions ({len(unique_sum_vars)} unique names).")
    non_matching_vars = [
        m[1].strip()
        for m in all_sums
        if m[1].strip() != 's_' + m[2].strip()
    ]
    if non_matching_vars:
        print(f"Found {len(non_matching_vars)} non-matching names.")

    # Search for any misformed expressions:
    expected_number = text.count(';')
    if expected_number != len(all_sum_vars):
        print(f"Some sum variables may not be set correctly: (expected: {expected_number})")
        # find naively the names of sum variables
        tokens = [word for word in text.split() if word.startswith('s_')]
        unique_tokens = set(tokens)
        print(f"There are {len(tokens)} defined ({len(unique_tokens)} unique)")
        print(f"Possibly misformed: {unique_tokens - unique_sum_vars}")
    print()
    return all_sum_vars


if __name__ == "__main__":
    keep_filenames = ['keep1', 'keep2']
    all_vars = []

    for filename in keep_filenames:
        vars = get_var_names(filename)
        analyse_vars(vars)
        all_vars.append(set(vars))

    assert len(all_vars) == len(keep_filenames) == 2
    report_difference(keep_filenames[0], all_vars[0], keep_filenames[1], all_vars[1])
    report_difference(keep_filenames[1], all_vars[1], keep_filenames[0], all_vars[0])
    # keep2 should maybe have a few more (s_hivneg_uncirc_*) but nothing too bad so far

    drop_filenames = ['drop']
    for filename in drop_filenames:
        vars = get_var_names(filename)
        analyse_vars(vars)
        # This doesn't make sense - we can safely drop more variables than we keep.
        # report_difference(filename, set(vars), keep_filenames[0], all_vars[0])

    sum_filenames = ['s_alive_over15', 's_all_over15', 's_alive', 's_alive_1580']
    all_sum_variables = []
    for filename in sum_filenames:
        new_vars = set(get_sum_variables(filename))
        # Check variables are not repeated between different sections
        # this is less convenient for debugging, see alternative below
        # assert all(var not in all_sum_variables for var in new_vars)
        all_sum_variables.extend(new_vars)
    print(f"{len(all_sum_variables)} sum variables created in total")
    print("These variables are defined in multiple sections:")
    c = Counter(all_sum_variables)
    # print(", ".join(name) for name, count in c.items() if count > 1)
    for name, count in c.items():
        if count > 1:
            print(f"{name}")