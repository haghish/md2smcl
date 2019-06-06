/***
_v. 1.0.1_

datadoc
=======

generates data documentation template based on CRAN's layout.

Syntax
------

> __datadoc__ [, replace]

### Options

| Option       | Description                                        |
|--------------|----------------------------------------------------|
| _replace_    | replaces the existing file                         |

Description
-----------

the output oncludes a markdown file and a stata help file. 
the command requires a data to be loaded in the memory. 
If not, a template is generated. 

Example
-------

generate a data documentation template for __auto.dta__

     . sysuse auto, clear
     . datadoc 

Author
------

E. F. Haghish  
_haghish@med.uni-goesttingen.de_  
[https://github.com/haghish/echo](https://github.com/haghish/echo)  

License
-------

MIT License

- - -

This help file was dynamically produced by 
[MarkDoc Literate Programming package](http://www.haghish.com/markdoc/) 

***/



*cap prog drop datadoc
program define datadoc

	version 14
	
	syntax [anything]					/// 
	[, 				 ///
	replace 	 	 /// replaces the current sthlp file, if it already exists
	]
	
	if "`c(filedate)'" == "" {
	  di as err "no data is loaded in the memory, an empty template is generated called {bf:example.do}"
		local name "example"
	  local script example.do
	}
	else {
		qui abspath "`c(filename)'"
    local name "`r(fname)'"
    local name : subinstr local name ".dta" ""
	  local script `name'.do
	}

	
	// -------------------------------------------------------------------------
	// Part 1: Adding the template 
	// =========================================================================
	tempfile tmp 
	tempname knot 
	qui file open `knot' using `"`tmp'"', write replace


	capture abspath "`c(filename)'"
	local dataname "`r(fname)'"
	if "`dataname'" == "" local dataname "YYY"
	local nvar "`c(k)'"
	if "`nvar'" == "" local nvar "???"
	local nobs "`c(N)'"
	if "`nobs'" == "" local nobs "???"
	
	local len = length("`dataname'") + 8
	
	file write `knot' 														          ///
		"/***" _n 																            ///
		"__dataset from the XXX package_ " _n(2)              ///
		"`dataname' dataset" _n                               ///
		_dup(`len') "=" _n(2)                                 ///
		"Description" _n                                      ///
		"----------- " _n(2)                                  ///
		"The __`dataname'__ dataset is about ..." _n(2)       ///
		"Format" _n                                           ///
		"------ " _n(2)                              ///
		"__`dataname'__ data set includes _`nobs'_ observations and _`nvar'_ variables." _n(2) /// 
		"### Summary of the variables" _n(2)                     
		
	if "`c(filedate)'" == "" {
		file write `knot'                                     ///
		"| _Variable_  |  _Type_  | _Description_          |" _n ///
		"|:------------|:---------|:-----------------------|" _n ///
		"| __var1__    | numeric  | explain var1           |" _n ///
		"| __var2__    | string   | explain var2           |" _n(2) 
	}
	else {
		// 15 character for varname, 5 character for type, 60 for description
		
		// get the longest label
		local maxlength 0
		foreach var of varlist _all {
			local lab: variable label `var'
			local lablen = length("`lab'")
			if `lablen' > `maxlength' local maxlength `lablen'
		}
		
		file write `knot'                                     ///
		"| Variable      | Type | Description "                                             
		
		if `maxlength' > 58 {
			file write `knot' _dup(45) " " "|" _n
		}
		else if `maxlength' > 25  {
			local endpoint1 = `maxlength'-12 
			file write `knot' _dup(`endpoint1') " " "|" _n
		}
		else {
			 file write `knot' _dup(13) " " "|" _n
		}
		
		
		file write `knot' "|:--------------|:-----|:" 
		
		if `maxlength' > 58 {
			file write `knot' "---------------------------------------------------------|" _n 
		}
		else if `maxlength' > 25  {
			file write `knot' _dup(`maxlength') "-" "|" _n
		}
		else {
			 file write `knot' _dup(25) "-" "|" _n
		}
		
		
		
		foreach var of varlist _all {
			local vartype: type `var'
			local lab: variable label `var'
			local lab = substr("`lab'",1,57) 
			if substr("`vartype'",1,3)=="str" local vartype "str"
			else if substr("`vartype'",1,5)=="float" local vartype "flt"
			else if substr("`vartype'",1,4)=="byte" local vartype "byt"
			local varname = abbrev("`var'",12) 
			file write `knot' "| `varname'" _col(16) " | `vartype'" _col(23) " | `lab'" //_col(83) "|" _n
			if `maxlength' > 58 {
				file write `knot' _col(83) "|" _n
			}
			else if `maxlength' > 25  {
				local endpoint = `maxlength'+26
				file write `knot' _col(`endpoint') "|" _n
			}
			else {
				 file write `knot' _col(51) "|" _n
			}
		}
		file write `knot' _n
	}
	
	file write `knot' 														          ///
		"Source" _n                                           ///
		"--------------- " _n(2)                              ///
		"cite the source ..." _n(2)                           ///
		"References" _n                                       ///
		"--------------- " _n(2)                              ///
		"cite the references ..." _n                          ///
		"***/" _n(2)
		
	file close `knot'
	capture copy "`tmp'" "`script'", replace public
	
	confirm file "`script'"
	qui sthlp `script', export(sthlp) `replace'
	
	if _rc == 0 {
		di as txt "{p}(MarkDoc created "`"{bf:{browse "`script'"}} and {bf:{browse "`name'.sthlp"}})"' 
	}

		
end


