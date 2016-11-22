# `markdown`: a Stata module that converts Markdown to SMCL language


`markdown` was originally a sub-engine of [MarkDoc](http://github.com/haghish/markdoc) package, which was used for converting 
Markdown to SMCL for generating dynamic help files. However, since [GitHub package](http://github.com/haghish/package) allows 
installing package dependencies automatically, it was a time for this engine to be in a separate repository so that other 
users can use it independent of [MarkDoc](http://github.com/haghish/markdoc). 

### Installation

If you have [GitHub package](http://github.com/haghish/package) installed, simply type:

```{js}
github install haghish/markdown
```

### Examples

`markdown` takes compound double-string and it displays the SMCL text in Stata. In addition, it returns a `r(md)` macro which 
holds the SMCL markup code. 

```{js}
markdown `"_italic_ and __bold__"'
markdown `"[Markdown Homepage](http://www.github.com/haghish/markdown)"'
```
_italic_ and __bold__  
[Markdown Homepage](http://www.github.com/haghish/markdown)

Author
------
  **E. F. Haghish**  
  Center for Medical Biometry and Medical Informatics
  University of Freiburg, Germany      
  _haghish@imbi.uni-freiburg.de_     
  _http://www.haghish.com/weaver_  
  _[@Haghish](https://twitter.com/Haghish)_   
  

    





