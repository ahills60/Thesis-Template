# Thesis Template

A LaTeX thesis template that was tweaked over a few years and condensed to a class file. A BibTeX bibliography class file is also provided.

## Instructions

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

## Optional document parameters

The ```\documentclass[options]{thesis}``` supports a number of `options` including the following:

* `11pt` for 11pt size text.
* `a4paper` for A4 paper mode.
* `authoryear` to use author-year citations rather than the numbering standard.
* `draftfigs` to use placeholders for figures for faster compilation (with the `draft` argument for `graphicx`).
* `lineno` to print line numbers throughout the document.
* `smallcaptions` to use ```\small``` font size for captions declared with ```\caption{}```.
* `twoside` for double sided printing (this will adjust the margins accordingly).

### Font support
The following fonts are supported and can be enabled using the corresponding `documentclass` option:

* `didot` to use the [GFS Didot](http://www.tug.dk/FontCatalogue/gfsdidot/) serif font.
* `garamond` to use the [URW Garamond](http://www.tug.dk/FontCatalogue/garamond/) serif font (note that this is not installed by default and is now considered a non-free font).
* `helvetica` to use the [Helvetica](http://www.tug.dk/FontCatalogue/helvetica/) sans serif font.
* `latinmodern` to use the [Latin Modern Sans](http://www.tug.dk/FontCatalogue/lmodernsans/) sans serif font.
* `libertine` to use the [Linux Libertine](http://www.tug.dk/FontCatalogue/libertine/) serif font.
* `palatino` to use the [Palatino](http://www.tug.dk/FontCatalogue/palatino/) serif font.
* `sourcesanspro` to use the [Source Sans Pro](http://www.tug.dk/FontCatalogue/sourcesanspro/) sans serif font.
* `times` to use the [Times](http://www.tug.dk/FontCatalogue/times/) serif font.

## Nomenclature support

Nomenclature is supported with the `nomencl` package ([see CTAN](http://www.ctan.org/pkg/nomencl)). New nomenclature can be defined as follows:

```latex
\nomenclature{symbol}{description}
```

To compile the list of nomenclature, open up a terminal/command prompt session and run:

```bash
makeindex MyThesis.nlo -s nomencl.ist -o MyThesis.nls
```

If the thesis file is something other than `MyThesis`, then `MyThesis` should be replaced in the above with the name of the master thesis file.

Nomenclature will be displayed wherever the macro ```\printnomenclature``` is called. The width of the first column can be defined by including an optional width (e.g. ```\printnomenclature[2cm]```). The nomenclature section contains the following preamble:
> A list of the variables and notation used in this thesis is defined below. The definitions and conventions set here will be observed throughout unless otherwise stated.

Should acronyms be detected (by detecting the presence of `filename.acr`), then the preamble will be appended with:
> For a list of acronyms, please consult page~\pageref{gl:acronym}

## Acronym support

Acronyms are supported with the `glossaries` package ([see CTAN](http://www.ctan.org/pkg/glossaries)). New acronyms can be defined as follows:

```latex
\newacronym{label}{acronym}{lower case, singular expansion of the acronym}
```

Within the document, the commands `\gls{label}`, `\Gls{label}`, `\glspl{label}` and `\Glspl{label}` can be used in place of abbreviated forms. These commands correspond with the lowercase singular, sentence case singular, lowercase plural and sentence case plural forms, respectively. LaTeX will automatically expand the acronym on the first instance and use the abbreviated form thereafter.

To compile the list of acronyms, open up a terminal/command prompt session and run:

```bash
makeglossaries MyThesis
```

If the thesis file is something other than `MyThesis`, then `MyThesis` should be replaced in the above with the name of the master thesis file.

It may be desirable to override the default behaviour in which case, the following commands can be used.

### Acronym form ###
* `\acrshort{label}`: lowercase, singular acronym form.
* `\Acrshort{label}`: sentence case, singular acronym form.
* `\acrshortpl{label}`: lowercase, plural acronym form.
* `\Acrshortpl{label}`: sentence case, plural acronym form.

### Expanded form ###
* `\acrlong{label}`: lowercase, singular expanded form.
* `\Acrlong{label}`: sentence case, singular expanded form.
* `\acrlongpl{label}`: lowercase, plural expanded form.
* `\Acrlongpl{label}`: sentence case, plural expanded form.

### Expanded and acronym form ###
* `\acrfull{label}`: lowercase, singular expanded form proceeded by acronym in parentheses.
* `\Acrfull{label}`: sentence case, singular expanded form proceeded by acronym in parentheses.
* `\acrfullpl{label}`: lowercase, plural expanded form proceeded by acronym in parentheses.
* `\Acrfullpl{label}`: sentence case, plural expanded form proceeded by acronym in parentheses.

Words are made plural by simply appending "s" to the end of an acronym or its expanded form. Some words do not conform to this generalisation and may require the long plural form to be redefined using:

```latex
\newacronym[longplural={lower case, plural expansion of the acronym}]{label}{acronym}{lower case, singular expansion of the acronym}
```

*Note: `\newacronym` definitions need to be defined prior to usage. I recommend placing such definitions within a separate file (e.g. `Acronyms.tex`) and using `\input{Acronyms}` just after opening the `document` environment.*

## Multi-page floats

Floats such as figures and algorithms can span multiple pages with the included `caption` package (for tables, I recommend using the `longtable` environment described below). When wanting to declare the continuation of an algorithm, simply call `\ContinuedFloat` after opening the environment. This should then be followed by the caption macro (which should automatically use the same counter as the previous float).

```latex
\begin{algorithm}[ht]
    \caption{\textbf{My algorithm.}}
    \label{alg:AlgorithmExample}
    \begin{description}
        \item [Step 1.] This is the first step.
        \item [Step 2.] This is the second step.
    \end{description}
\end{algorithm}

\begin{algorithm}[ht]
    \ContinuedFloat
    \caption{\textbf{My algorithm (continued).}}
    \begin{description}
        \item [Step 3.] This is the third step.
        \item [Step 4.] This is the fourth step.
    \end{description}
\end{algorithm}
```

## Bibliography

This class uses the `natbib` bibliography package and, specifically, the `plainnaturl.bst` bibliography stylesheet. The custom stylesheet displays initials and surname for all authors and removes URL and DOI information from bibliography entries. URL fields are preserved for miscellaneous/Internet bibliographic entries.

Note that the package prefers bibliographic information to be added as a separate `bib` file rather than appended to the bottom of a document.
