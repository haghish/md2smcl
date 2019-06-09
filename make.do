// the 'make.do' file is automatically created by 'github' package.
// execute the code below to generate the package installation files.
// DO NOT FORGET to update the version of the package, if changed!
// for more information visit http://github.com/haghish/github

make md2smcl, replace toc pkg  version(1.5)                                  ///
     license("MIT")                                                          ///
     author("E. F. Haghish")                                                 ///
     affiliation("University of Goettingen")                                 ///
     email("haghish@med.uni-goettingen.de")                                  ///
     url("")                                                                 ///
     title("a Stata module to convert Markdown syntax in coumpound double-string") ///
     description("")                                                         ///
     install("md2smcl.ado;md2smcl.sthlp")                                    ///
     ancillary("")                                                         

// generating the documentation
markdoc "md2smcl.ado", mini export(sthlp) replace

// generating the vignette
markdoc "md2smcl.ado", mini export(md) replace

markdoc "vignette.do", export(tex) toc replace master                        ///
     title("MD2SMCL package vignette")                                       ///
		 author("E. F. Haghish")                                                 ///
     affiliation("University of Goettingen")                                 ///
     address("haghish@med.uni-goettingen.de")                                

// clean the directory after typsetting the LaTeX file
capture rm md2smcl.md
capture rm vignette.tex
capture rm vignette.toc
capture rm vignette.synctex.gz
capture rm vignette.out
capture rm vignette.log
