# rmaccents - Stata Package for Removing Accents

`rmaccents` is a Stata package designed to remove accented characters from text variables by replacing them with their unaccented equivalents. It is particularly useful for cleaning datasets with accented names, city names, or country names, especially for users working with international data where accents need to be standardized or removed.

## Features

- **Replace Accents**: Replace accented characters directly in the original variable.
- **Create New Variables**: Create new variables with unaccented text while keeping the original variable(s) intact.
- **Supports Multiple Variables**: Works on multiple variables simultaneously, making it highly efficient for large datasets.

## Installation

You can install the `rmaccents` package directly from this GitHub repository using the following Stata command:

```
net install rmaccents, from("https://raw.githubusercontent.com/ariedamuco/stata-rmaccents/main/")
```

This command will install the package and make it available for use in your Stata session.

## Syntax

rmaccents varlist [, newvar(name) replace]

##  Options:
newvar(name): Creates a new variable with unaccented text. You can specify a new variable name for each variable in the varlist. If the new variable name already exists, an error will be thrown.
replace: Replaces the original variable with the unaccented version.

## Examples
Example 1: Replace Accents in the Original Variable
You can replace accented characters directly in the original variable using the  `replace` option:

``` stata
rmaccents name, replace
```

Example 2: Create a New Variable Without Accents
To create a new variable (while keeping the original variable intact), use the  `newvar` option:
