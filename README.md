# string-tokenize-egg

`string-tokenize` egg for CHICKEN Scheme.

## Installation

    chicken-install -s

## Usage

    (import string-tokenize)

    (string-tokenize str #!optional (drop " \t\n") (keep ""))

    e.g. (string-tokenize "(lambda (x) x)" " " "()")
      => ("(" "lambda" "(" "x" ")" "x" ")")

## Dependencies

- CHICKEN 5
