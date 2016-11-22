{smcl}
{right:version 1.0.0}
{title:Title}

{phang}
{cmd:markdown} {hline 2} a Stata module to convert Markdown syntax in coumpound double-string to Stata Control and Markup Language (SMCL).
 

{title:Syntax}

{p 8 16 2}
{cmd: markdown} {it:{c 96}"compound double-string"{c 39}} {p_end}


{title:Description}

{p 4 4 2}
The {bf:markdown} command was originally written for {help markdoc} package to 
generate Stata help files from Markdown code. However, it can be incorporated in 
other user packages that deal with Markdown and SMCL. 

{p 4 4 2}
The package  {browse "https://github.com/haghish/markdown":is hosted on GitHub}, where 
you can read more about the package, see examples, and even contribute to the 
package.    {break}

{p 4 4 2}
The {bf:markdown} command returns a {it:rclass} macro named {bf:r(md)}, which 
includes the SMCL code. 


{title:Example}

{p 4 4 2}
The examples below demonstrate how to use the {bf:markdown} command to style text 
in SMCL. Moreover, the syntax for creating titles and hyperlinks is shown:
	  
        . markdown `"# Title"'
	  {title:Title}
	  
        . markdown `"_italic_, __bold__, and ___underlined___ text"'
	  {it:italic}, {bf:bold}, and {ul:underlined} text

        . markdown `"[Markdown Homepage](http://www.github.com/haghish/markdown)"'
	  {browse "http://www.github.com/haghish/markdown":Markdown Homepage}

{p 4 4 2}
The {bf:markdown} engine can also be used to create a straight line or a tab. 
There are several alternatives for creating a straight line in Markdown but this 
package only supports the "- - -" syntax. Combining "- - -" with a word or 
sentence will result in a tab in SMCL. The latter is not Markdown syntax but is 
made for Stata for further convenience. 

        . markdown `"- - -"'
    {hline}

        . markdown `"- - -TabName"'
{dlgtab:TabName }
	

{title:Author}

{p 4 4 2}
{bf:E. F. Haghish}       {break}
Center for Medical Biometry and Medical Informatics       {break}
University of Freiburg, Germany       {break}
{it:and}          {break}
Department of Mathematics and Computer Science         {break}
University of Southern Denmark       {break}
haghish@imbi.uni-freiburg.de          {break}

    {hline}

{p 4 4 2}
This help file was dynamically produced by 
{browse "http://www.haghish.com/markdoc/":MarkDoc Literate Programming package} 

