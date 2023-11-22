*! 1.4 TCP 22 Nov 2023
// set  paths

cap prog drop setpaths
program setpaths
	version 16.1
	syntax [anything] [, Keepexisting]
	
	if `"`keepexisting'"' == "" | "$dopath" == "" | "$datapath" == "" {
		if `"`anything'"' == "" {
			db ajicpath
			di as text "Showing dialog box..."
			di as error "Rerun do-file after paths are set."
			error 1
		}
			
			else {
				
				tokenize `"`anything'"'
				global dopath = `"`1'"'
				global datapath = `"`2'"'
				
				// error check: correct number of paths? 
				if `"`1'"' == "" | `"`2'"' == "" {
					di as error "Must supply two paths."
					global dopath
					global datapath
					error 1
				}
				if `"`3'"' != "" {
					di as error "Must supply only two paths"
					global dopath 
					global datapath
					error 1
				}
				
				// error check: paths exist?
				
				local cwd `"`c(pwd)'"'
				
				quietly {
					capture cd "$dopath/"
					if _rc {
						di as error _continue "Do-file path " 
						noi di as result _continue "$dopath" 
						di as error " not found"
						cd `"`cwd'"'
						global dopath
						global datapath
						error 601
					}
				}
				
				quietly {
					capture cd "$datapath/"
					if _rc {
						di as error _continue "Data file path " 
						noi di as result _continue "$datapath" 
						di as error " not found"
						cd `"`cwd'"'
						global dopath
						global datapath
						error 601
					}
				}
				
				
				di as text _newline "Data file path is " 
				di as result _continue "$datapath"
				di as text ", use in code as " as result "\$datapath"
				
				di as text  _newline "Do-file path is " 
				di as result _continue "$dopath" 
				di as text ", use in code as " as result "\$dopath"
				
				di as text _newline "Changing present working directory to dopath..."

				di as text "present working directory is "
				
				
				cd "$dopath"
			
				di _newline as text `"Remember to enclose paths in "double quotes" in your code,"'
				di as text `"and use forward slashes, / to delimt folders to ensure"'
				di as text `"cross-platform compatibility, e.g., "'
				di as result _continue `"cd "\$dopath/foo""'
				di as text _newline "     or"
				di as result `"use "\$datapath/bar.dta""'
				di as error "If you invoked setpaths from a do-file, rerun do-file now that paths are set."
				
			}
	
	}
	

end

//eof
