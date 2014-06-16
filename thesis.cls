% thesis.cls
%
% Used for writing nice looking theses.
%
% 2013-November-07 Andrew Hills (a.hills (at) sheffield.ac.uk)

% Standard class structure
\ProvidesClass{thesis}[2013/11/07 version 0.2.3 Thesis class]
\NeedsTeXFormat{LaTeX2e}

% Read all declarations and pass onto article class
% \makeatletter
\newif\if@garamond
\@garamondfalse
\DeclareOption{garamond}{\@garamondtrue}
\newif\if@palatino
\@palatinofalse
\DeclareOption{palatino}{\@palatinotrue}
\newif\if@libertine
\@libertinefalse
\DeclareOption{libertine}{\@libertinetrue}
\newif\if@helvetica
\@helveticafalse
\DeclareOption{helvetica}{\@helveticatrue}
\newif\if@times
\@timesfalse
\DeclareOption{times}{\@timestrue}
\newif\if@sourcesanspro
\@sourcesansprofalse
\DeclareOption{sourcesanspro}{\@sourcesansprotrue}
\newif\if@didot
\@didotfalse
\DeclareOption{didot}{\@didottrue}
\newif\if@latinmodern
\@latinmodernfalse
\DeclareOption{latinmodern}{\@latinmoderntrue}
\newif\if@lineno
\@linenofalse
\DeclareOption{lineno}{\@linenotrue}
\newif\if@authoryear
\@authoryearfalse
\DeclareOption{authoryear}{\@authoryeartrue}
\newif\if@draftfigs
\@draftfigsfalse
\DeclareOption{draftfigs}{\@draftfigstrue}
\newif\if@smallcaptions
\@smallcaptionsfalse
\DeclareOption{smallcaptions}{\@smallcaptionstrue}

% \makeatother
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\university}[1]{\gdef\@university{#1}}
\newcommand*{\dedication}[1]{\gdef\@dedication{#1}}
\dedication{}%
\global\let\@dedication\@empty

\DeclareOption*{
\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions \relax

\LoadClass{report}

\RequirePackage[a4paper,inner=4cm,outer=3cm,top=4cm,bottom=3.5cm,pdftex]{geometry}
\RequirePackage{fixltx2e}


\bibliographystyle{plainnaturl}
\if@authoryear
	\usepackage[authoryear,comma,sort&compress]{natbib}
\else
	\usepackage[square,numbers,comma,sort&compress]{natbib}
\fi
\RequirePackage{url}

\RequirePackage[english]{babel}
\RequirePackage{datetime}
\newdateformat{monthyear}{\monthname[\THEMONTH] \THEYEAR}

\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}

\DeclareMathOperator{\svd}{svd}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\cov}{cov}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\var}{Var}

% Algorithms
\RequirePackage{float}
\floatstyle{ruled}
\newfloat{algorithm}{htbp}{loa}[chapter]
\floatname{algorithm}{Algorithm}
% \makeatletter
\if@garamond
	\IfFileExists{eucal.sty}
	{\IfFileExists{mathdesign.sty}
	{\IfFileExists{mdugm.sty}
	{\usepackage[mathscr]{eucal}
	\usepackage[urw-garamond]{mathdesign}}
	{\message{Package mdugm.sty was not found. You can download this from CTAN.}}}
	{\message{Package mathdesign.sty was not found.}}}
	{\message{Package eucal.sty was not found.}}
\else
	\if@palatino
		\IfFileExists{mathpazo.sty}
		{\usepackage[sc]{mathpazo}
		\linespread{1.05}}
		{\message{Package mathpazo.sty was not found.}}
	\else
		\if@libertine
			\IfFileExists{libertine.sty}
			{\usepackage{libertine}
			\renewcommand*\familydefault{\sfdefault}
			\usepackage{mathastext}}
			{\message{Package libertine.sty was not found.}}
		\else
			\if@helvetica
				\IfFileExists{helvet.sty}
				{\usepackage[scaled]{helvet}
				\renewcommand*\familydefault{\sfdefault}
				\usepackage{mathastext}}
				{\message{Package helvet.sty was not found.}}
			\else
				\if@times
					\IfFileExists{mathptmx.sty}
					{\usepackage{mathptmx}}
					{\message{Package mathptmx.sty was not found.}}
				\else
					\if@sourcesanspro
						\IfFileExists{sourcesanspro.sty}
						{\usepackage[default]{sourcesanspro}
						\usepackage{mathastext}}
						{\message{Package sourcesanspro.sty was not found.}}
					\else
						\if@didot
							\IfFileExists{gfsdidot.sty}
							{\usepackage{gfsdidot}
							\usepackage{mathastext}}
							{\message{Package gfsdidot.sty was not found.}}
						\else
							\if@latinmodern
								\IfFileExists{lmodern.sty}
								{\usepackage{lmodern}
								\renewcommand*\familydefault{\sfdefault}
								\usepackage{mathastext}}
								{\message{Package lmodern.sty was not found.}}
							\fi
						\fi
					\fi
				\fi
			\fi
		\fi
	\fi
\fi

\if@lineno
	\IfFileExists{lineno.sty}
	{\usepackage[pagewise]{lineno}}
	{\message{Package lineno.sty was not found.}}
\fi

% \makeatother
\RequirePackage[T1]{fontenc}

% Spacing
\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{sectsty}

\if@draftfigs
	\RequirePackage[draft]{graphicx}
\else
	\RequirePackage{graphicx}
\fi
\RequirePackage{caption}
\RequirePackage{subcaption}

\RequirePackage{longtable}
\RequirePackage{color}
\RequirePackage{colortbl}

\RequirePackage{fancyhdr}

\RequirePackage[perpage,symbol]{footmisc}

\RequirePackage{fancyvrb}

\RequirePackage{rotating}

\RequirePackage{xifthen}

\RequirePackage{appendix}

\newcommand{\R}[1]{\ensuremath{\mathbb{R}^{#1}}}
\newcommand{\E}[1]{\ensuremath{\mathbb{E}\left({#1}\right)}}
\renewcommand{\vec}[1]{{\boldsymbol{\mathbf{#1}}}}
\newcommand{\p}[2][]{\ifthenelse{\isempty{#2}}{\ifthenelse{\isempty{#1}{}{\ensuremath{\text{P\hspace{-0.15em}}\left({#1}\right)}}}}{\ifthenelse{\isempty{#1}}{\ensuremath{\text{P\hspace{-0.15em}}\left( {#2} \right)}}{\ensuremath{\text{P\hspace{-0.15em}}\left( {#1} \, | \, {#2} \right)}}}}
\newcommand{\N}[2]{\ensuremath{\mathcal{N}\hspace{-0.15em}\left( {#1}, \; {#2} \right)}}

% Table of Contents redefine
\let\stdtoc\tableofcontents
\renewcommand*\tableofcontents{{%
\renewcommand*\MakeUppercase[1]{##1}\stdtoc}}

% List of Figures redefine
\let\stdlof\listoffigures
\renewcommand*\listoffigures{{%
\renewcommand*\MakeUppercase[1]{##1}\stdlof}}

% List of Tables redefine
\let\stdlot\listoftables
\renewcommand*\listoftables{{%
\renewcommand*\MakeUppercase[1]{##1}\stdlot}}

% List of algorithms
\makeatletter
\newcommand\listofalgorithms{%
    \if@twocolumn\@empty
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{List of Algorithms}%
      \@mkboth{%
          List of Algorithms}%
         {List of Algorithms}%
    \@starttoc{loa}%
    \if@restonecol\twocolumn\fi
    }

\@addtoreset {algorithm}{chapter}
\renewcommand \thealgorithm
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@algorithm}
\def\fps@algorithm{tbp}
\def\ftype@algorithm{2}
\def\ext@algorithm{loa}
% Bold float captions
\def\fnum@algorithm{\textbf{Algorithm}\nobreakspace\textbf{\thealgorithm}}
\def\fnum@table{\textbf{\tablename}\nobreakspace\textbf{\thetable}}
\def\fnum@figure{\textbf{\figurename}\nobreakspace\textbf{\thefigure}}

% Change the default captions font
\if@smallcaptions
	\def\captionfont{\small}
\fi

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
					\addtocontents{loa}{\protect\addvspace{10\p@}}% Algorithm added
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\let\l@algorithm\l@figure % We want to take the style from the figure one
\makeatother

% Renew the bibliography enviroment
\makeatletter
\renewcommand\bibsection{%
  \chapter*{\bibname\@mkboth{{\bibname}}{{\bibname}}}\addcontentsline{toc}{chapter}{\bibname}}
\makeatother

\RequirePackage{boxedminipage}
\RequirePackage{listings}
\RequirePackage{minitoc}
\RequirePackage{ifpdf}
\RequirePackage{nomencl}

\makenomenclature

\IfFileExists{\jobname.acr}{
	\def\nompreamble{\addcontentsline{toc}{chapter}{Nomenclature}A list of the variables and notation used in this thesis is defined below. The definitions and conventions set here will be observed throughout unless otherwise stated. For a list of acronyms, please consult page~\pageref{gl:acronym}.\\}
}{
	\def\nompreamble{\addcontentsline{toc}{chapter}{Nomenclature}A list of the variables and notation used in this thesis is defined below. The definitions and conventions set here will be observed throughout unless otherwise stated.\\}
}

\RequirePackage[breaklinks]{hyperref}
\makeatletter
\hypersetup{colorlinks,linkcolor=black,filecolor=black,urlcolor=black,citecolor=black,pdftitle={PhD Thesis}}
\makeatother

\RequirePackage{makeidx}
\makeindex

\RequirePackage[acronym,nomain,toc,numberedsection=autolabel]{glossaries}
\renewcommand*{\glsautoprefix}{gl:}
\makeatletter
	\renewcommand*{\@@glossarysecstar}{*}
\makeatother
\makeglossaries

\makeatletter

\renewenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}%
                        {\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \footnotesize\let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}

\makeatother

\pagestyle{fancy}
\fancyfoot{}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername\ \thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\fancyhead[RO,LE]{\bfseries\thepage}
\fancyhead[LO]{\bfseries\leftmark}
\fancyhead[RE]{\bfseries\rightmark}
\renewcommand{\headrulewidth}{0.3pt}

% Clear Header Style on the last empty odd page
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{empty}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% Redefine chapters
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#2}%
                    \else
                      \addcontentsline{toc}{chapter}{#2}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
					\addtocontents{loa}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
% Section:
\def\@sect#1#2#3#4#5#6[#7]#8{%
					  \ifnum #2>\c@secnumdepth
					    \let\@svsec\@empty
					  \else
					    \refstepcounter{#1}%
					    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
					  \fi
					  \@tempskipa #5\relax
					  \ifdim \@tempskipa>\z@
					    \begingroup
					      #6{%
					        \@hangfrom{\hskip #3\relax\@svsec}%
					          \interlinepenalty \@M #8\@@par}%
					    \endgroup
					    \csname #1mark\endcsname{#7}%
					    \addcontentsline{toc}{#1}{%
					      \ifnum #2>\c@secnumdepth \else
					        \protect\numberline{\csname the#1\endcsname}%
					      \fi
					      #8}%
					  \else
					    \def\@svsechd{%
					      #6{\hskip #3\relax
					      \@svsec #8}%
					      \csname #1mark\endcsname{#7}%
					      \addcontentsline{toc}{#1}{%
					        \ifnum #2>\c@secnumdepth \else
					          \protect\numberline{\csname the#1\endcsname}%
					        \fi
					        #8}}%
					  \fi
					  \@xsect{#5}}
\renewcommand{\maketitle}{
	\begin{titlepage}
		% \setcounter{page}{2}
		%\vspace*{\stretch{1}}
		\begin{center}
			\Huge \bf \@title
		\end{center}
		\vspace*{\stretch{1}}
		\begin{center}
			A thesis submitted to \@university{} for the degree of Doctor of Philosophy
		\end{center}
		\vspace*{\stretch{1}}
		\begin{center}
			\Large \bf \@author
		\end{center}
		\vspace*{\stretch{1}}
		\begin{center}
			\@department
		\end{center}
		\vspace*{\stretch{1}}
		\begin{center}
			\monthyear\today
		\end{center}
		\vspace*{\stretch{2}}
	\end{titlepage}
}
\newcommand{\startpreamble}[1]
	{\pagenumbering{alph}
	\setcounter{page}{0}
	\maketitle
	\newpage
	\mbox{}
	\thispagestyle{empty}
	\ifx\@dedication\@empty
		\relax
	\else
		\clearpage
		\thispagestyle{empty}
		\vspace*{\stretch{1}}
		\begin{center}
			\huge{\@dedication}
		\end{center}
		\vspace*{\stretch{2}}
	\fi
	\cleardoublepage
	\pagenumbering{roman} \setcounter{page}{1}
	\if@lineno
		\linenumbers
	\fi
	}
\def\stoppreamble
	{\cleardoublepage
	\pagenumbering{arabic}
	\setcounter{page}{1}}
\makeatother
