"""Static tests for the code in hiv_synthesis.py"""
import re
import sys

import pytest


def get_values(range):
    """Get the values indicated by a range expression.

    :raises: ValueError if the range limits are not integers.
    """
    tokens = range.split(":")
    assert len(tokens) == 2, "Range expression should only have one :"
    low, high = [int(token.strip()) for token in tokens]
    return list(range(low, high + 1))


def get_length(argument):
    """Get the number of values in a list of arguments.
    
    The argument string is either a space-separated list of values,
    or a range of consecutive integer values indicated by a colon ":".
    Returns None if any errors occurred.
    """
    if ":" in argument:  # if this is a range
        try:
            values = get_values(argument)
        except ValueError:
            return None
    else:  # if the values are explicitly given
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
    assert pytest.approx(sum(probability_values)) == 1.0, \
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
    with open('hiv_synthesis.sas') as model_file:
        model_text = model_file.read()
    errors = validate_text(model_text)
    if errors:
        for variable, error in errors.items():
            print(f"{variable}: {error}")
        sys.exit(1)
