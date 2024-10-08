cap program drop rmaccents
program define rmaccents
    version 13.0

    // Syntax for specifying variable(s) and options
    syntax varlist(string) [, NEWvar(name) REPLACE]

    // Define local macros for accented characters and their replacements
    local accents "á é í ó ú Á É Í Ó Ú ñ Ñ ä ö ü Ä Ö Ü ß ő ű Ő Ű"
    local replacements "a e i o u A E I O U n N a o u A O U ss o u O U"

    // Loop through each variable in the varlist
    foreach var in `varlist' {

        // Check if newvar already exists and throw an error
        if "`newvar'" != "" {
            capture confirm variable `newvar'
            if !_rc {
                display as error "The variable `newvar' already exists. Please choose a different name or drop the variable."
                exit 198
            }
        }

        // If 'replace' option is specified, replace accented characters in the original variable
        if "`replace'" != "" {
            forval i = 1/`=wordcount("`accents'")' {
                local accent = word("`accents'", `i')
                local replacement = word("`replacements'", `i')
                replace `var' = subinstr(`var', "`accent'", "`replacement'", .)
            }
        }
        // If 'newvar' option is specified, create a new variable with unaccented characters
        else if "`newvar'" != "" {
            gen `newvar' = `var'
            forval i = 1/`=wordcount("`accents'")' {
                local accent = word("`accents'", `i')
                local replacement = word("`replacements'", `i')
                replace `newvar' = subinstr(`newvar', "`accent'", "`replacement'", .)
            }
        }
        else {
            // Error if neither replace nor newvar options are provided
            display as error "You must specify either a new variable name or use the replace option."
            exit 198
        }
    }
end
