# `md2smcl`: a Stata module that converts Markdown to SMCL language


`md2smcl` was originally a sub-engine of [MarkDoc](http://github.com/haghish/markdoc) package, which was used for converting
Markdown to SMCL for generating dynamic help files. However, since [GitHub package](http://github.com/haghish/package) allows
installing package dependencies automatically, it was a time for this engine to be in a separate repository so that other
users can use it independent of [MarkDoc](http://github.com/haghish/markdoc).
The package was originally included with the ado file named `markdown.ado` but
since Stata 15 introduces a command with the same name, the command is renamed to
`md2smcl`

### Installation

If you have [GitHub package](http://github.com/haghish/package) installed, simply type:

```{js}
github install haghish/md2smcl
```

### Examples

`md2smcl` takes Markdown within a compound double-string. It converts the markdown code and
displays the SMCL text in Stata. In addition, it returns a `r(md)` macro which
holds the SMCL markup code.

```{js}
md2smcl `"_italic_ and __bold__"'
md2smcl `"[md2smcl Homepage](http://www.github.com/haghish/md2smcl)"'
```

the results would be:

> _italic_ and __bold__  
> [md2smcl Homepage](http://www.github.com/haghish/md2smcl)

Author
------
  **E. F. Haghish**  
  Center for Medical Biometry and Medical Informatics
  University of Freiburg, Germany      
  _haghish@imbi.uni-freiburg.de_     
  _http://www.haghish.com/weaver_  
  _[@Haghish](https://twitter.com/Haghish)_   
