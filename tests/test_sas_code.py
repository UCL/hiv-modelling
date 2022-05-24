"""Static tests for the code in hiv_synthesis.py"""
import math
import re
import sys


def get_length(argument):
    """Get the number of values in a list of arguments.
    
    The argument string should be a space-separated list of values.
    """
    values = re.split("\s+", argument)
    return len(values)


def validate_expression(values, probabilities):
    # Ensure that the arguments to sample_macro have matching lengths.
    assert get_length(values) == get_length(probabilities), \
        f"Values and probabilities don't have matching lengths"
    try:
        # TODO This won't work if probabilities are given as fractions e.g. 1/8
        probability_values = [float(p) for p in re.split("\s+", probabilities)]
    except ValueError:
        raise ValueError(f"Some values are not numbers.")
    # Ensure that values in probability lists are non-negative and sum to 1
    assert (all(p >= 0 for p in probability_values)), \
        f"Some probabilities are not positive"
    assert math.isclose(sum(probability_values), 1.0), \
        f"Probabilities should sum to 1"


def validate_text(text):
    """Check the validity of all instances of the %sample macro."""
    errors = {}
    # We need re.DOTALL because some expressions extend across multiple lines,
    # and we must also use match non-greedily with *?
    exp = re.compile("%sample\((.*?),(.*?),(.*?)\)", re.DOTALL)
    all_matches = exp.finditer(text)
    next(all_matches)  # skip the usage example, which has no numbers
    for match in all_matches:
        name, values, probabilities = match.groups()
        try:
            validate_expression(values.strip(), probabilities.strip())
        except (AssertionError, ValueError) as e:
            errors[name] = e.args[0]
    return errors


if __name__ == "__main__":
    with open('hiv_synthesis.sas', encoding='latin1') as model_file:
        model_text = model_file.read()
    errors = validate_text(model_text)
    if errors:
        for variable, error in errors.items():
            print(f"{variable}: {error}")
        sys.exit(1)
