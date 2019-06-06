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
     title(" a Stata module to convert Markdown syntax in coumpound double-string") ///
     description("")                                                         ///
     install("datadoc.ado;datadoc.sthlp;md2smcl.ado;md2smcl.sthlp")          ///
     iancillary("")                                                         

// generating the documentation
markdoc "datadoc.ado", export(sthlp) replace
markdoc "md2smcl.ado", export(sthlp) replace