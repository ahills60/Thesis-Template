Thesis Template
===============

A LaTeX thesis template that was tweaked over a few years and condensed to a class file. A BibTeX bibliography class file is also provided

Instructions
------------

On creating a new LaTeX document, start the document with ```\documentclass{thesis}```. Options for the document are specified below. You should also define the macros ```\title{}```, ```\author{}```, ```\department{}``` and ```\university{}``` in the header of your document. The thesis class also provides an optional ```\dedication{}``` macro.

When writing the main body of your document, the macro ```\startpreamble``` can be called to generate the title page and switch page numbering to Roman numerals. You can then create sections with ```\section*{}``` for preamble content such as acknowledgements, abstracts and table of contents.

When declaring an end to the preamble, call the macro ```\stoppreamble``` to change page numbering back to Arabic numerals.

The thesis class creates a new float for algorithms that can be called with:

```latex
\begin{algorithm}[ht]
  \caption{The caption to your algorithm}
  \label{alg:algorithm_label}
  % Content goes here
\end{algorithm}
```

A list of algorithms can generated using the ```\listofalgorithms``` macro.

The thesis class imports the `natbib` package thus giving the option of paragraph citations (```\citep{}```) and text citations (```\citet{}```).

The class also provides shortcuts for declaring real numbers with ```\R{exponent_here}```, expected values with ```\E{value}```, Normal distributions with ```\N{mean}{variance}``` and probabilities with ```\p{value}``` or ```\p[value]{posterior}```.

Optional document parameters
----------------------------

The ```\documentclass[options]{thesis}``` supports a number of `options` including the following:

* `a4paper` for A4 paper mode.
* `11pt` for 11pt size text.
* `twoside` for double sided printing (this will adjust the margins accordingly).
* `palatino` to use the Palatino serif font.
* `garamond` to use the URW Garamond serif font (note that this is not installed by default and is now considered a non-free font).
* `libertine` to use the Libertine sans serif font.
* `lineno` to print line numbers throughout the document.
* `authoryear` to use author-year citations rather than the numbering standard.


Bibliography
------------

This class uses the `natbib` bibliography package and, specifically, the `plainnaturl.bst` bibliography stylesheet. The custom stylesheet displays initials and surname for all authors and removes URL and DOI information from bibliography entries. URL fields are preserved for miscellaneous/Internet bibliographic entries.

Note that the package prefers bibliographic information to be added as a separate `bib` file rather than appended to the bottom of a document.
