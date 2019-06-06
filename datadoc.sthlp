{smcl}
{it:v. 1.0.1}


{title:datadoc}

{p 4 4 2}
generates data documentation template based on CRAN{c 39}s layout.


{title:Syntax}

{p 8 8 2} {bf:datadoc} [, replace]

{p 4 4 2}{bf:Options}

{col 5}Option{col 19}Description
{space 4}{hline 66}
{col 5}{it:replace}{col 19}replaces the existing file
{space 4}{hline 66}

{title:Description}

{p 4 4 2}
the output oncludes a markdown file and a stata help file. 
the command requires a data to be loaded in the memory. 
If not, a template is generated. 


{title:Example}

{p 4 4 2}
generate a data documentation template for {bf:auto.dta}

     . sysuse auto, clear
     . datadoc 


{title:Author}

{p 4 4 2}
E. F. Haghish    {break}
{it:haghish@med.uni-goesttingen.de}    {break}
{browse "https://github.com/haghish/echo":https://github.com/haghish/echo}    {break}


{title:License}

{p 4 4 2}
MIT License

{space 4}{hline}

{p 4 4 2}
This help file was dynamically produced by 
{browse "http://www.haghish.com/markdoc/":MarkDoc Literate Programming package} 



