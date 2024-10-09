# rmaccents - Stata Package for Removing Accents from Strings

`rmaccents` is a Stata package designed to remove accented characters from text variables by replacing them with their unaccented equivalents. It is particularly useful for cleaning datasets with accented names, city names, or country names, especially for users working with international data where accents need to be standardized or removed.

## Features

- **Replace Accents**: Replace accented characters directly in the original variable.
- **Create New Variables**: Create new variables with unaccented text while keeping the original variable(s) intact.
- **Supports Multiple Variables**: Works on multiple variables simultaneously, making it highly efficient for large datasets.

## Installation

You can install the `rmaccents` package directly from this GitHub repository using the following Stata command:

``` stata
net install rmaccents, from("https://raw.githubusercontent.com/ariedamuco/stata-rmaccents/main/")
```

This command will install the package and make it available for use in your Stata session.

Alternatively: 

If you prefer, you can use Stata's copy command to download the files directly:

1) Download the `.ado` File:
```
copy "https://raw.githubusercontent.com/ariedamuco/stata-rmaccents/main/rmaccents.ado" ///
"`c(sysdir_personal)'/rmaccents.ado", replace
```

2) Download the Help File:
```
copy "https://raw.githubusercontent.com/ariedamuco/stata-rmaccents/main/rmaccents.sthlp" ///
"`c(sysdir_personal)'/rmaccents.sthlp", replace
```
Verify Installation:

Use `which rmaccents` and `help rmaccents`  to confirm.

## Syntax

rmaccents varlist [, newvar(name) replace]

##  Options:
newvar(name): Creates a new variable with unaccented text. You can specify a new variable name for each variable in the varlist. If the new variable name already exists, an error will be thrown.
replace: Replaces the original variable with the unaccented version.

## Examples
- Example 1: Replace Accents in the original variable.
You can replace accented characters directly in the original variable using the  `replace` option:

``` stata
rmaccents name, replace
```

- Example 2: Create a New Variable Without Accents.
To create a new variable (while keeping the original variable intact), use the  `newvar` option:

``` stata
rmaccents name, newvar(name_noaccent)
```

- Example 3: Replace Accents in Multiple Variables
You can handle multiple variables at once by specifying them in the  `varlist`:

``` stata
rmaccents name city country, replace
```

- Example 4: Create New Variables for Multiple Variables
To create new variables without accents for `name` `city` `country` , use:

``` stata
rmaccents name city country, newvar(name_noaccent city_noaccent country_noaccent)
```

## List of Supported Characters
The rmaccents package supports the following accented characters:

Accents Supported: á, é, í, ó, ú, Á, É, Í, Ó, Ú, ñ, Ñ, ä, ö, ü, Ä, Ö, Ü, ß, ő, ű, Ő, Ű
These characters will be replaced with their unaccented equivalents (e.g., á → a, ß → ss).

## Author
Arieda Muço
Email: arieda.muco@gmail.com

## Acknowledgments
This package was developed with feedback from ChatGPT and was inspired by my Stata users-only colleagues and coauthors.

## License
This package is licensed under the MIT License. See the `LICENSE` file for more details.


