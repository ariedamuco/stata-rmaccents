// Remove accents from text variables program
cap program drop rmaccents
program define rmaccents
    version 13.0

    // Syntax for specifying the list of variables and options
    syntax varlist(string) [, NEWvar(name) REPLACE]

    // Define local macros for accented characters and their corresponding replacements
	local accents "á é í ó ú Á É Í Ó Ú ñ Ñ ä ö ü Ä Ö Ü ß ő ű Ő Ű ø Ø æ Æ å Å å Å ä Ä ö Ö ë Ë"
    local replacements "a e i o u A E I O U n N a o u A O U ss o u O U o O ae AE a A a A a A o O e E"

    // Loop through each variable in the provided varlist
    foreach var in `varlist' {

        // Handle the case when a new variable is specified
        if "`newvar'" != "" {
            // Check if the new variable already exists
            capture confirm variable `newvar'
            if !_rc {
                display as error "The variable `newvar' already exists. Please choose a different name or drop the variable."
                exit 198
            }
        }

        // Handle the 'replace' option: Replace accented characters in the original variable
        if "`replace'" != "" {
            forval i = 1/`=wordcount("`accents'")' {
                local accent = word("`accents'", `i')
                local replacement = word("`replacements'", `i')
                replace `var' = subinstr(`var', "`accent'", "`replacement'", .)
            }
        }
        // Handle the 'newvar' option: Create a new variable with unaccented characters
        else if "`newvar'" != "" {
            gen `newvar' = `var'
            forval i = 1/`=wordcount("`accents'")' {
                local accent = word("`accents'", `i')
                local replacement = word("`replacements'", `i')
                replace `newvar' = subinstr(`newvar', "`accent'", "`replacement'", .)
            }
        }
        // If neither 'replace' nor 'newvar' is specified, throw an error
        else {
            display as error "You must specify either a new variable name or use the replace option."
            exit 198
        }
    }
end
