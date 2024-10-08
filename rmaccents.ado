cap program define rmaccents
    version 13.0

    // Syntax for specifying variable(s) and options
    syntax varlist(string) [, NEWvar(name) REPLACE]

    // Define local macros for accents and replacements
    local accents = "áéíóúÁÉÍÓÚñÑäöüÄÖÜßőűŐŰ"
    local replacements = "aeiouAEIOUnNaeuAEUBouOU"

    // Loop through each variable in the varlist
    foreach var in `varlist' {

        // If the replace option is specified
        if "`replace'" != "" {
            // Replace accented characters in the original variable
            forvalues i = 1/strlen("`accents'") {
                local accent = substr("`accents'", `i', 1)
                local replacement = substr("`replacements'", `i', 1)
                replace `var' = subinstr(`var', "`accent'", "`replacement'", .)
            }
        }
        else if "`newvar'" != "" {
            // Create a new variable with unaccented characters
            gen `newvar' = `var'
            forvalues i = 1/strlen("`accents'") {
                local accent = substr("`accents'", `i', 1)
                local replacement = substr("`replacements'", `i', 1)
                replace `newvar' = subinstr(`newvar', "`accent'", "`replacement'", .)
            }
        }
        else {
            display as error "Specify a new variable name or use the option replace."
            exit 198
        }
    }
end
