{smcl}
*! version 1.0.0
{title:Title}
{phang}
{cmd:rmaccents} {hline 2} Remove accents from text variables.

{title:Syntax}
{pstd}
{cmd:rmaccents} {varlist} [, {opt NEWvar(name)} {opt REPLACE}]

{title:Description}
{pstd}
{cmd:rmaccents} is a tool that removes accents from text variables by replacing accented characters with their unaccented equivalents. You can either replace the original variable(s) or create a new variable(s) with the unaccented version(s).

{title:Options}
{phang}
{opt NEWvar(name)}: Creates a new variable with unaccented text, leaving the original variable(s) intact. If the new variable name already exists, the program will throw an error.

{phang}
{opt REPLACE}: Replaces the original variable(s) with the unaccented version(s).

{title:Remarks}
{pstd}
This package is particularly useful when dealing with datasets that contain accented characters in names, city names, country names, or other text fields, especially if downstream processes require unaccented text.

{title:Examples}
{pstd}
{phang}
1. Replace accented characters in the original variable:
{pstd}
{cmd:. rmaccents name, replace}
This command will modify the `name` variable in place by replacing accented characters.

{phang}
2. Create a new variable without accents:
{pstd}
{cmd:. rmaccents name, newvar(name_noaccent)}
This will leave the original `name` variable intact and create a new variable called `name_noaccent` with the unaccented version.

{phang}
3. Handle multiple variables (e.g., names of cities and countries):
{pstd}
{cmd:. rmaccents name city country, replace}
This command will replace accented characters in all specified variables.

{phang}
4. Create new variables for multiple variables:
{pstd}
{cmd:. rmaccents name city country, newvar(name_noaccent city_noaccent country_noaccent)}
This will create new variables for all specified variables, leaving the original ones unchanged.

{phang}
5. Using the `REPLACE` option with multiple variables:
{pstd}
{cmd:. rmaccents name city country, replace}
This will replace the accented characters in all specified variables directly.

{title:Author}
{phang}
Written by Arieda Muço.  
Email: arieda.muco@gmail.com

{title:Acknowledgments}
{phang}
This package was developed with feedback from ChatGPT and was inspired by my coauthors.

{title:Also see}
{psee}
Manual: {hi:[D] data management}, {hi:[R] regexm()} 
{psee}
Online: {stata net}, {stata search}, {stata help}
