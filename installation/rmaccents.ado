cap program drop rmaccents
program define rmaccents
    version 13.0

    // Syntax for specifying the list of variables and options
    syntax varlist(string) [, NEWvar(name) REPLACE]

    // Define local macros for accented characters and their replacements
    local accents      "á é í ó ú á Á É Í Ó Ú ñ Ñ ä ö ü Ä Ö Ü ß ő ű Ő Ű ø Ø ç Ç é è ë Ë å Å â ã Â Ã ô Ô"
    local replacements "a e i o u a A E I O U n N a o u A O U ss o u O U o O c C e e e E a A a a A A o O"

    // Loop through each variable in the provided varlist
    foreach var in `varlist' {

        // Handle the case when neither 'replace' nor 'newvar' is specified
        if "`replace'" == "" & "`newvar'" == "" {
            display as error "You must specify either a new variable name or use the replace option."
            exit 198
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
    }
end
