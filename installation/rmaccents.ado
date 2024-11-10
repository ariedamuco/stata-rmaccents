cap program drop rmaccents
program define rmaccents
    version 13.0

    // Syntax for specifying the list of variables and options
    syntax varlist(string) [, NEWvar(name) REPLACE]

    // Check if the variables exist
    foreach var in `varlist' {
        capture confirm variable `var'
        if _rc {
            display as error "Variable `var' not found in the dataset."
            exit 111
        }
    }

    // Define macros for accents and their replacements
    local accents      "á é í ó ú Á É Í Ó Ú ñ Ñ ä ö ü Ä Ö Ü ß ő ű Ő Ű ø Ø ç Ç é è ë Ë å Å â ã Â Ã ô Ô"
    local replacements "a e i o u A E I O U n N a o u A O U ss o u O U o O c C e e e E a A a a A A o O"

    foreach var in `varlist' {
        // Handle new variable creation or replacement
        if "`newvar'" != "" {
            // Check if the new variable already exists
            capture confirm variable `newvar'
            if !_rc {
                if "`replace'" == "" {
                    display as error "The variable `newvar' already exists. Use the 'replace' option to overwrite its values."
                    exit 111
                }
            }
            else {
                // Create a new variable if it does not exist
                gen `newvar' = `var'
            }
            local target `newvar'
        }
        else if "`replace'" != "" {
            local target `var'
        }
        else {
            display as error "You must specify either a new variable name or use the replace option."
            exit 198
        }

        // Perform replacements for all accented characters
        forval i = 1/`=wordcount("`accents'")' {
            local accent = word("`accents'", `i')
            local replacement = word("`replacements'", `i')
            replace `target' = subinstr(`target', "`accent'", "`replacement'", .)
        }
    }
end
