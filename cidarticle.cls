%%
%% This is file `cidarticle.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% cidarticle.dtx  (with options: `class')
%% -----------| -----------------------------------------------------------------
%% cidarticle:| A class for submissions to the ``Commentarii informaticae didacticae (CID)''
%%     Author:| Martin Sievers
%%      Email:| martin.sievers@schoenerpublizieren.de
%%    License:| Released under the LaTeX Project Public License v1.3c or later
%%        See:| http://www.latex-project.org/lppl.txt
%% -----------| -----------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{cid}
    [2023/11/25 v1.1 Official class for submissions to the ``Commentarii informaticae didacticae (CID)'']
\def\@clearglobaloption#1{%
  \def\@tempa{#1}%
  \def\@tempb{\@gobble}%
  \@for\next:=\@classoptionslist\do
    {\ifx\next\@tempa
       \message{Cleared  option \next\space from global list}%
     \else
       \edef\@tempb{\@tempb,\next}%
     \fi}%
  \let\@classoptionslist\@tempb
  \expandafter\ifx\@tempb\@gobble
    \let\@classoptionslist\@empty
  \fi}
\DeclareOption{latin1}{\PassOptionsToPackage{latin1}{inputenc}}
\DeclareOption{utf8}{\PassOptionsToPackage{utf8}{inputenc}}
\DeclareOption{ansinew}{\PassOptionsToPackage{ansinew}{inputenc}}
\newif\ifcidenglish
\cidenglishfalse
\DeclareOption{english}{\cidenglishtrue\@clearglobaloption{english}}
\newif\ifusehyperref
\usehyperreftrue
\DeclareOption{nohyperref}{\usehyperreffalse}
\newif\ifusecleveref
\useclevereftrue
\DeclareOption{nocleveref}{\useclevereffalse}
\newif\ifusebiblatex
\usebiblatextrue
\DeclareOption{biblatex}{\usebiblatextrue}
\DeclareOption{nobiblatex}{\usebiblatexfalse}
\newif\ifcrop
\cropfalse
\DeclareOption{crop}{\croptrue}
\newif\ifnorunningheads
\DeclareOption{norunningheads}{\norunningheadstrue}
\ExecuteOptions{utf8}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\RequirePackage{iftex}
\PassOptionsToPackage{dvipsnames}{xcolor}
\PassOptionsToPackage{fleqn}{amsmath}
\LoadClass[10pt,a4paper,twoside]{article}
\ifPDFTeX
   \RequirePackage{cmap}
   \RequirePackage{inputenc}
   \RequirePackage[T1]{fontenc}
   \RequirePackage[full]{textcomp}
\else
   \RequirePackage{fontspec}
\fi%
\ifcidenglish
   \RequirePackage[ngerman,UKenglish,USenglish,english]{babel}
\else
   \RequirePackage[english,UKenglish,USenglish,ngerman]{babel}
   \babelprovide[hyphenrules=ngerman-x-latest]{ngerman}
   \ClassInfo{cidarticle}{Using latest German hyphenation patterns}%
\fi%
\useshorthands*{"}
\addto\extrasenglish{\languageshorthands{ngerman}}
\addto\extrasUKenglish{\languageshorthands{ngerman}}
\addto\extrasUSenglish{\languageshorthands{ngerman}}
\ifPDFTeX
   \RequirePackage{mathptmx}
   \RequirePackage[%
      final,%
      tracking=smallcaps,%
      expansion=alltext,%
      protrusion=alltext-nott]{microtype}%
\else
   \setmainfont{NimbusRomNo9L}[%
      Extension         = .otf,%
      UprightFont       = *-Reg,%
      BoldFont          = *-Med,%
      ItalicFont        = *-RegIta,%
      BoldItalicFont    = *-MedIta,%
      Ligatures         = {Common},%
      ]%
   \RequirePackage[%
      final,%
      protrusion=alltext-nott]{microtype}%
   \ifluatex
      \ifcidenglish
         \RequirePackage[english]{selnolig}%
      \else
         \RequirePackage[ngerman]{selnolig}%
      \fi%
   \fi%
\fi%
\SetTracking{encoding=*,shape=sc}{50}%
\DeclareFontFamily{U}{MnSymbolC}{}
\DeclareSymbolFont{MnSyC}{U}{MnSymbolC}{m}{n}
\DeclareFontShape{U}{MnSymbolC}{m}{n}{
    <-6>  MnSymbolC5
   <6-7>  MnSymbolC6
   <7-8>  MnSymbolC7
   <8-9>  MnSymbolC8
   <9-10> MnSymbolC9
  <10-12> MnSymbolC10
  <12->   MnSymbolC12%
}{}
\DeclareMathSymbol{\powerset}{\mathord}{MnSyC}{180}
\RequirePackage{etoolbox}
\RequirePackage[oldcommands]{ragged2e}
\newlength{\doihoffset}
\newlength{\doivoffset}
\ifcrop
   \RequirePackage[
     paperheight=220truemm,paperwidth=155truemm,
     text={110truemm,176truemm},
     inner=25truemm,
     outer=20truemm,
     top=24.6truemm,
     bottom=19truemm,
     nomarginpar,
     headsep=7truemm,
     headheight=13.5bp,
     driver=none]
     {geometry}
   \RequirePackage[a4,center,frame,info]{crop}
   \renewcommand*\CROP@@info{{%
      \global\advance\CROP@index\@ne
      \def\x{\discretionary{}{}{\hbox{\kern.5em---\kern.5em}}}%
      \advance\paperwidth-20\p@
      \dimen@4pt
      \ifx\CROP@pagecolor\@empty
      \else
      \advance\dimen@\CROP@overlap
      \fi
      \hb@xt@\z@{%
         \hss
         \vbox to\z@{%
            \centering
            \hsize\paperwidth
            \vss
            \normalfont
            \normalsize
            \expandafter\csname\CROP@font\endcsname{%
               ``\jobname''\x
               \the\year/\the\month/\the\day\x
               \CROP@time\x
               page\kern.5em\thepage\x
               \#\the\CROP@index
               \strut
            }%
            \vskip\dimen@
         }%
         \hss
      }%
   }}%
   \setlength{\doihoffset}{1.45cm}
   \setlength{\doivoffset}{1.2cm}
\else
   \RequirePackage[%
      paperheight=220truemm,paperwidth=155truemm,%
      text={110truemm,176truemm},%
      inner=25truemm,%
      outer=20truemm,%
      top=24.6truemm,%
      bottom=19truemm,%
      nomarginpar,%
      headsep=7truemm,%
      headheight=13.5bp,%
      driver=none]%
   {geometry}
   %\setlength{\doihoffset}{4.2cm}
   %\setlength{\doivoffset}{4.3cm}
\fi%
\renewcommand\normalsize{%
   \@setfontsize\normalsize{10bp}{13.5bp}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\ifx\MakeRobust\@undefined \else
\MakeRobust\normalsize
\fi
\DeclareRobustCommand\small{%
   \@setfontsize\small{9bp}{13.5bp}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
      \topsep 4\p@ \@plus2\p@ \@minus2\p@
      \parsep 2\p@ \@plus\p@ \@minus\p@
      \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\DeclareRobustCommand\footnotesize{%
   \@setfontsize\footnotesize{8bp}{9.6bp}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
      \topsep 3\p@ \@plus\p@ \@minus\p@
      \parsep 2\p@ \@plus\p@ \@minus\p@
      \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\DeclareRobustCommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\DeclareRobustCommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\DeclareRobustCommand\large{\@setfontsize\large{12bp}{14.4bp}}
\DeclareRobustCommand\Large{\@setfontsize\Large{13bp}{15.6bp}}
\DeclareRobustCommand\LARGE{\@setfontsize\LARGE{14bp}{16.8bp}}
\DeclareRobustCommand\huge{\@setfontsize\LARGE{16bp}{19.2bp}}
\DeclareRobustCommand\Huge{\@setfontsize\LARGE{20bp}{24bp}}
\RequirePackage[autostyle]{csquotes}
\ifusebiblatex
   \RequirePackage[%
      backend=biber,% UTF-8 support
      style=LNI,    % The GI style - see https://www.ctan.org/pkg/biblatex-lni
      natbib=true,   % Required for \Citet
      autolang=other%
   ]{biblatex}
   \renewcommand{\bibfont}{\normalfont\small}
   \defbibheading{bibliography}[\iflanguage{english}{Bibliography}{Literaturverzeichnis}]{%
      \section*{#1}\markboth{#1}{#1}\pdfbookmark[1]{\iflanguage{english}{Bibliography}{Literaturverzeichnis}}{bibliography\thecidarticle}}
   \patchcmd{\biburlsetup}%
      {\def\UrlBigBreaks{\do\:\do\-}}%
      {\def\UrlBigBreaks{\do\:\do\-\do\/}}%
      {}%
      {}%
  % Enable hyperlinked authors when using \citeauthor
  % Source: http://tex.stackexchange.com/a/75916/9075
  \DeclareCiteCommand{\citeauthor}%
    {\boolfalse{citetracker}%
     \boolfalse{pagetracker}%
     \usebibmacro{prenote}}%
    {\ifciteindex%
       {\indexnames{labelname}}%
       {}%
     \printtext[bibhyperref]{\printnames{labelname}}}%
    {\multicitedelim}%
    {\usebibmacro{postnote}}%
\fi%
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{grffile}
\RequirePackage{fancyhdr}
\RequirePackage{listings}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\lstset{%
   basicstyle=\ttfamily,%
   columns=fixed,%
   basewidth=.5em,%
   xleftmargin=0.5cm,%
   captionpos=b,%
   upquote}%
\def\thisbottomragged{\def\@textbottom{\vskip\z@ plus.0001fil
\global\let\@textbottom\relax}}
\renewcommand\@pnumwidth{2.5em}
\renewcommand\@tocrmarg{2.55em}
\renewcommand\@dotsep{2.5}
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \advance\rightskip by 0pt plus 2cm
               \parfillskip -\rightskip \pretolerance=10000
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\newcommand{\@toctitle}{}%
\newcommand*{\@titlerunning}{}%
\renewcommand{\title}{\@dblarg\@@title}
\def\@@title[#1]#2{%
   \gdef\@title{#2}%
   \renewcommand{\@toctitle}{#2}%
   \renewcommand*{\@titlerunning}{#1}%
}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\gdef\and{\texorpdfstring{\unskip,\ }{, }}
\renewcommand{\author}{\@dblarg\@@author}
\newcommand{\@tocauthor}{}%
\newcommand{\@authorrunning}{}%
\def\@@author[#1]#2{%
   \DeclareRobustCommand{\@author}{%
      #2%
   }%
   \renewcommand{\@tocauthor}{#1}%
   %\protected@edef\@tocauthor{%
   %   #1%
   %}%
   \renewcommand{\@authorrunning}{#1}%
}
\newcommand*{\authorrunning}[1]{%
   \renewcommand*{\@authorrunning}{#1}}
\newcommand*{\titlerunning}[1]{%
   \renewcommand*{\@titlerunning}{#1}}%
\newcommand*{\email}[1]{\ifusehyperref\href{mailto:#1}{\protect\nolinkurl{#1}}\else\protect\nolinkurl{#1}\fi}
\newcommand*{\orcid}[1]{%
   \ifusehyperref\unskip~\orcidlink{#1}\,\href{https://orcid.org/#1}{https://orcid.org/#1}%
   \else\orcidlink{}\,https://orcid.org/#1\fi}
\newcommand{\@doi}{}
\newcommand{\doi}{%
      \begingroup\catcode`\_12 \doi@i}
\newcommand{\doi@i}[1]{%
      \gdef\@doi{#1}\endgroup}
\newcounter{cidarticle}
\@addtoreset{section}{cidarticle}%
\@addtoreset{footnote}{cidarticle}%
\@addtoreset{figure}{cidarticle}%
\@addtoreset{table}{cidarticle}%
\renewcommand\maketitle{\par%
   \begingroup
    \renewcommand\thefootnote{\@arabic\c@footnote}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi%
    \else
      \newpage
      \global\@topnum\z@% Prevents figures from going at top of page.
      \@maketitle
    \fi%
    \ifnorunningheads
      \thispagestyle{empty}
    \else
      \thispagestyle{plain}
    \fi%
    \@thanks
  \endgroup
  \ifusehyperref
      \HyXeTeX@CheckUnicode
      \HyPsd@PrerenderUnicode{\@tocauthor}%
      \pdfstringdef\@pdfauthor{\@tocauthor}%
      \HyXeTeX@CheckUnicode
      \HyPsd@PrerenderUnicode{\@title}%
      \pdfstringdef\@pdftitle{\@title}%
  \fi%
  %\global\let\thanks\relax
  %\global\let\maketitle\relax
  %\global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  %\global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@subtitle\@empty
  %\global\let\title\relax
  %\global\let\author\relax
  %\global\let\date\relax
  %\global\let\and\relax
}
\def\@maketitle{%
  \clearpage\begingroup\pagestyle{empty}\cleardoublepage\endgroup%
  \markboth{\@authorrunning}{\@titlerunning}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}%
  \phantomsection%
  \addcontentsline{toc}{chapter}{\protect\numberline{}{\@toctitle}}%
  \addtocontents{toc}{\protect\contentsline{subsection}{\@tocauthor}{}{}}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}%
  \refstepcounter{cidarticle}%
  \null%
  \vskip-16.8bp%\spacebeforesection%
  \vskip 11mm%
  \raggedright% Linksbündig
  \let\footnote\thanks
    {\LARGE\bfseries\@title\par}%
    \ifx\@subtitle\empty\else
      \ifx\@subtitle\undefined\else
         \vskip \baselineskip%
         {\normalsize\bfseries\@subtitle\par}%
      \fi%
    \fi%
    \vskip\baselineskip% Abstand nach dem Titel
    {\normalsize%
      \lineskip .5em%
        \@author
      \par}%
    \vskip 2\baselineskip% Abstand vor dem Abstract
}%
\newcommand*{\@addmargin}[2][\@tempa]{%
   \list{}{%
      \if@tempswa
         \def\@tempa{\leftmargin}%
         \setlength{\leftmargin}{#2}%
         \setlength{\rightmargin}{#1}%
      \else
         \def\@tempa{\rightmargin}%
         \setlength{\rightmargin}{#2}%
         \setlength{\leftmargin}{#1}%
      \fi
      \setlength{\listparindent}{\parindent}%
      \setlength{\itemsep}{\parskip}%
      \setlength{\itemindent}{\z@}%
      \setlength{\@tempskipa}{\topsep}%
      \setlength{\topsep}{\z@}%
      \setlength{\parsep}{\parskip}%
      \setlength{\@tempskipb}{\partopsep}%
      \setlength{\partopsep}{\z@}%
      \let\makelabel\@gobble
      \setlength{\labelwidth}{\z@}%
      \advance\@listdepth\m@ne
   }%
   \item\nobreak\ignorespaces
}

\renewenvironment*{abstract}{%
   \renewcommand{\abstractname}{Abstract}%
   \@addmargin{\parindent}\small\noindent\ignorespaces{\bfseries\abstractname:\ }%
}{\advance\@listdepth\@ne
  \endlist
  \par\vspace{\baselineskip}}
\newif\ifkeywords
\newenvironment{keywords}%
   {\global\keywordstrue\normalsize%
    \def\and{\unskip;\space}%
    \noindent\ignorespaces{\bfseries Keywords:\ }}%
   {\par\global\keywordsfalse}
\let\@RIGsection\section
\pretocmd\@startsection{%
   \ifkeywords\ClassError{cidarticle}%
      {keywords is an environment, not a macro}%
      {Please change \string\keywords\space to an environment}%
      \keywordsfalse%
   \fi%
}{}{}%
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {-2\baselineskip}{\baselineskip}{\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {-2\baselineskip}{\baselineskip}{\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {-2\baselineskip}{\baselineskip}{\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {1\baselineskip}{-1em}{\normalfont\normalsize\bfseries}}
\newlength{\spacebeforesection}
\setlength{\spacebeforesection}{\dimexpr\topsep+11mm\relax}
\newcommand{\CIDsection}[1]{%
   \section*{\rule{0pt}{\spacebeforesection}#1}%
   \markboth{#1}{#1}%
   \pdfbookmark[1]{\iflanguage{english}{Bibliography}{Literaturverzeichnis}}{bibliography\thecidarticle}%
}
\newcommand{\CIDVorwort}[1]{\section*{\rule{0pt}{\spacebeforesection}#1}\markboth{#1}{#1}}
\RequirePackage{caption}
\captionsetup[figure]{style=base,font=footnotesize,position=below}
\captionsetup[table]{style=base,font=small,position=above}
\captionsetup[lstlisting]{style=base,font=footnotesize,position=below}
\newcommand{\ifwithinfigure}[2]{%
   \ifx\@currenvir\empty
      \PackageWarningNoLine{ifwithinfigure}{Environment name not available}%
   \else
      \ifx\@currenvir\figure
         #1%
      \else
         #2%
      \fi
   \fi
}
\setlength{\intextsep}{\baselineskip}%Abstand nach der Grafik
\setlength{\abovecaptionskip}{.5\baselineskip}
\setlength{\belowcaptionskip}{%
   \ifwithinfigure{2\baselineskip}{0pt}%
}
\renewcommand\tableofcontents{%
   \clearpage\thispagestyle{plain}
   \pdfbookmark[0]{\contentsname}{toc}%
   \CIDVorwort{\contentsname}%
   \@starttoc{toc}%
}

\def\@part[#1]#2{%
   \clearpage\begingroup\pagestyle{empty}\cleardoublepage\endgroup
   \thispagestyle{empty}
   \pdfbookmark[-1]{#2}{part\thepage}%
   \addtocontents{toc}{\protect\contentsline{part}{#1}{}{}}
   \null\vfil
   {\centering
    \interlinepenalty \@M
    \normalfont
    \fontsize{20bp}{20bp}\selectfont\bfseries #2%
    \markboth{}{}\par}%
   \vfil\null\newpage
   \null
   \thispagestyle{empty}%
   \newpage}

\renewcommand*\l@part[2]{%
   \ifnum \c@tocdepth >-2\relax
     \addpenalty\@secpenalty
     \vspace*{2\baselineskip}%
     \setlength\@tempdima{3em}%
     \begingroup
       \parindent \z@ \rightskip \@pnumwidth
       \parfillskip -\@pnumwidth
       {\leavevmode
           \fontsize{13bp}{13.5bp}\selectfont #1\hfil
           \hb@xt@\@pnumwidth{\hss #2%
           \kern-\p@\kern\p@}}\par
        \nobreak
        \if@compatibility
          \global\@nobreaktrue
          \everypar{\global\@nobreakfalse\everypar{}}%
       \fi
     \endgroup
     \vspace*{2\baselineskip}%
   \fi}
\renewcommand*\l@section[2]{%
   \ifnum \c@tocdepth >\z@
      \addpenalty\@secpenalty
      \setlength\@tempdima{0pt}%
      \begingroup
         \parindent \z@ \rightskip \@pnumwidth
         \parfillskip -\@pnumwidth
         \leavevmode
         \advance\leftskip\@tempdima
         \hskip -\leftskip
         #1\nobreak\mdseries
         \leaders\hbox{$\m@th
            \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
            mu$}\hfill
         \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \endgroup
   \fi}
\let\l@chapter\l@section%
\renewcommand*\l@subsection[2]{%
   \ifnum \c@tocdepth >\z@
      \addpenalty\@secpenalty
      \setlength\@tempdima{0pt}%
      \begingroup
         \parindent \z@ \rightskip \@pnumwidth
         \parfillskip -\@pnumwidth
         \leavevmode
         \advance\leftskip\@tempdima
         \hskip -\leftskip
         \itshape #1\nobreak\hfil
         \nobreak\hb@xt@\@pnumwidth{\hss #2%
         \kern-\p@\kern\p@}\par
      \endgroup
   \fi}

\def\fps@figure{htbp}
\def\fnum@figure{\figurename~\thefigure}
\def\@floatboxreset{%
        \reset@font
        \small
        \@setnobreak
        \@setminipage
}%
\setcounter{topnumber}{10}% maximale Anzahl gleitender Objekte am Seitenanfang
\setcounter{bottomnumber}{10}% maximale Anzahl gleitender Objekte am Seitenende
\renewcommand{\topfraction}{1.0}% Anteil den gleitende Objekte am Seitenanfang einnehmen dürfen
\renewcommand{\bottomfraction}{1.0}% Anteil den gleitende Objekte am Seitenende einnehmen dürfen
\def\fps@table{htbp}
\def\fnum@table{\tablename~\thetable}
\renewcommand{\arraystretch}{1.1}
\setlength{\mathindent}{0.5cm}
\RequirePackage{verbatim}
\def\verbatim@processline{\hskip0.5cm\the\verbatim@line\par}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width 2.6cm
  \kern5.6\p@}
\RequirePackage[hang,stable,bottom,belowfloats]{footmisc}
\setlength{\footnotemargin}{5mm} % Abstand Fußnotenzähler/Fußnotentext
\def\@cidmakefnmark{\rlap{\normalfont\@thefnmark}}%
\long\def\@makefntext#1{%
   \ifFN@hangfoot
   \bgroup
   \setbox\@tempboxa\hbox{%
      \ifdim\footnotemargin>0pt
         \hb@xt@\footnotemargin{\@cidmakefnmark\hss}%
      \else
         \@cidmakefnmark
      \fi%
   }%
   \leftmargin\wd\@tempboxa
   \rightmargin\z@
   \linewidth \columnwidth
   \advance \linewidth -\leftmargin
   \parshape \@ne \leftmargin \linewidth
   \@totalleftmargin \leftmargin
   \footnotesize
   \@setpar{{\@@par}}%
   \leavevmode
   \llap{\box\@tempboxa}%
   \parskip\hangfootparskip\relax
   \parindent\hangfootparindent\relax
   \footnotelayout#1%
   \ifFN@hangfoot
      \par\egroup
   \fi%
\fi%
}
\setlength{\parindent}{5mm}
\renewcommand{\labelitemi}{\textbullet}
\renewcommand*\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
   \setlength{\labelsep}{0.70cm}%
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}%
       %\setlength{\itemsep}{8pt}%
       \setlength{\parsep}{-2pt}}%
  \fi}
  \renewcommand{\labelenumii}{\alph{enumii})}
  \renewcommand*\enumerate{%
  \ifnum \@enumdepth >\thr@@
      \@toodeep
    \else
\setlength{\labelsep}{0.70cm}%Abstand zur Aufzählungsnummer
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \fi
    \@ifnextchar[{\@enumlabel@{\@enumerate@}[}{\@enumerate@}}
  \def\@enumerate@{%
    \expandafter\list\csname label\@enumctr\endcsname{%
      \usecounter{\@enumctr}%
      \def\makelabel##1{\hss\llap{##1}}
\setlength{\labelsep}{0.6cm} %Einrückung des Aufzählungszeichens
      %\setlength{\itemsep}{8pt}%
      \setlength{\parsep}{-2pt}}
  }%
\usepackage{enumitem}
\setlist{noitemsep}
\newcommand{\andname}{}
\addto\captionsngerman{%
   \def\andname{und}%
   \def\figurename{Abb.}%
   \def\tablename{Tab.}%
   \def\lstlistingname{List.}%
   \def\bibname{Literaturverzeichnis}%
   \def\refname{Literaturverzeichnis}%
}%
\addto\captionsenglish{%
  \def\andname{and}%
  \def\figurename{Fig.}%
  \def\tablename{Tab.}%
  \def\lstlistingname{List.}%
  \def\bibname{Bibliography}%
  \def\refname{Bibliography}%
}%
\addto\captionsUKenglish{%
   \def\andname{and}%
   \def\figurename{Fig.}%
   \def\tablename{Tab.}%
   \def\lstlistingname{List.}%
   \def\bibname{Bibliography}%
   \def\refname{Bibliography}%
}%
\addto\captionsUSenglish{%
   \def\andname{and}%
   \def\figurename{Fig.}%
   \def\tablename{Tab.}%
   \def\lstlistingname{List.}%
   \def\bibname{Bibliography}%
   \def\refname{Bibliography}%
}%
\newcommand*{\startpage}[1]{\setcounter{page}{#1}}
\def\@bookshorttitle{}
\newcommand{\booktitle}{\@dblarg\@@booktitle}
\def\@@booktitle[#1]#2{\gdef\@bookshorttitle{#1}\gdef\@booktitle{#2}}
\newcommand{\booksubtitle}[1]{\gdef\@booksubtitle{#1}}
\newcommand*{\@editor}{}
\newcommand*{\editor}[1]{\renewcommand{\@editor}{#1}}
\newcommand*{\@yearofpublication}{\the\year}
\newcommand*{\yearofpublication}[1]{\renewcommand*{\@yearofpublication}{#1}}
\renewcommand{\sectionmark}[1]{}%
\renewcommand{\subsectionmark}[1]{}%
\fancypagestyle{plain}{%
      \fancyhead{}% Löscht alle Kopfzeileneinstellungen
      \renewcommand{\headrulewidth}{0.0pt}% Linie unter Kopfzeile
   }%
\ifnorunningheads
   \pagestyle{empty}%
\else%
   \pagestyle{fancy}%
   \fancyhead[RE]{\footnotesize\leftmark{}}%
   \fancyhead[LO]{\footnotesize\rightmark{}}%
   \fancyhead[LE,RO]{\thepage}%
   \fancyfoot{}% Löscht alle Fußzeileneinstellungen
   \renewcommand{\headrulewidth}{0.4pt}%Linie unter Kopfzeile
   \fancyheadoffset[ol]{0.8mm}%
   \fancyheadoffset[el]{0.8mm}%
   \fancyheadoffset[or]{-0.8mm}%
   \fancyheadoffset[er]{-0.8mm}%
\fi%
\RequirePackage{url}
\urlstyle{same}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
   \def\UrlBigBreaks{\do\:\do\-}%
   \def\UrlBigBreaks{\do\:\do\-\do\/}
\RequirePackage{xspace}
\RequirePackage{etoolbox}
\RequirePackage{authblk}
\newcommand{\@authlisthead}{}
\newtoks\@temptokenb
\newtoks\@temptokenc
\renewcommand\Authsep{, }
\renewcommand\Authands{\iflanguage{ngerman}{ und }{, and }}
\renewcommand\Authand{\iflanguage{ngerman}{ und }{ and }}

\renewcommand\author[4][]%
{\ifnewaffil\addtocounter{affil}{1}%
   \edef\AB@thenote{\arabic{affil}}\fi
   \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
   \ifcsundef{@emailsandorcids\AB@note}{\csgdef{@emailsandorcids\AB@note}{}}{}%
   \setcounter{Maxaffil}{0}\fi
   \ifnum\value{authors}=0\def\@firstauthor{#2}\fi
   \ifnum\value{authors}>1\relax
   \@namedef{@sep\number\c@authors}{\Authsep}\fi
   \addtocounter{authors}{1}%
   \begingroup
   \let\protect\@unexpandable@protect \let\and\AB@pand
   \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
   \@temptokena=\expandafter{\AB@authors}%
   \@temptokenb=\expandafter{\AB@authors}%
   {\def\\{\protect\\[\@affilsep]\protect\Affilfont
         \protect\AB@resetsep}%
      \xdef\AB@author{\AB@blk@and#2}%
      \ifnewaffil\gdef\AB@las{}\gdef\AB@lasx{\protect\Authand}\gdef\AB@as{}%
      \xdef\AB@authors{\the\@temptokena\AB@blk@and}%
      \else
      \xdef\AB@authors{\the\@temptokena\AB@as\AB@au@str}%
      \global\let\AB@las\AB@lasx\gdef\AB@lasx{\protect\Authands}%
      \gdef\AB@as{\Authsep}%
      \fi
      \gdef\AB@au@str{#2}}%
   \@temptokena=\expandafter{\AB@authlist}%
   \@temptokenb=\expandafter{\@authlisthead}%
   \let\\=\authorcr
   \xdef\AB@authlist{\the\@temptokena
      \protect\@nameuse{@sep\number\c@authors}%
      \protect\Authfont#2\AB@authnote{\AB@note}}%
   \xdef\@authlisthead{\the\@temptokenb
      \protect\@nameuse{@sep\number\c@authors}%
      \protect\Authfont#2}%
   \endgroup
   \ifnum\value{authors}>2\relax
   \@namedef{@sep\number\c@authors}{\Authands}\fi
   \ifcsempty{@emailsandorcids\AB@note}%
   {\csgappto{@emailsandorcids\AB@note}{%
         \if\relax#3\relax\else\email{#3}\fi\if\relax#4\relax\else\ \orcid{#4}\fi}%
   }%
   {\csgappto{@emailsandorcids\AB@note}{%
         \if\relax#3\relax\else\ |\ \email{#3}\fi\if\relax#4\relax\else\ \orcid{#4}\fi}}%

   \newaffilfalse
}

\renewcommand\@author{\ifx\AB@affillist\AB@empty\AB@author\else
   \ifnum\value{affil}>\value{Maxaffil}\def\rlap##1{##1}%
   \AB@authlist\AB@affillist
   \else\AB@authors\fi\fi}

\renewcommand\affil[2][]%
{\newaffiltrue\let\AB@blk@and\AB@pand
   \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
   \setcounter{Maxaffil}{0}\fi
   \begingroup
   \let\protect\@unexpandable@protect
   \def\thanks{\protect\thanks}\def\footnotetext{\protect\footnotetext}%
   \@temptokena=\expandafter{\AB@authors}%
   {\def\\{\protect\\\protect\Affilfont}\xdef\AB@temp{#2}}%
   \xdef\AB@authors{\the\@temptokena\AB@las\AB@au@str
      \protect\\[\affilsep]\protect\Affilfont\AB@temp}%
   \gdef\AB@las{}\gdef\AB@au@str{}%
   {\def\\{, \ignorespaces}\xdef\AB@temp{#2}}%
   \@temptokena=\expandafter{\AB@affillist}%
   \xdef\AB@affillist{\the\@temptokena
      \footnotetext[\AB@note]{%
         \raggedright\AB@temp\ifcsempty{@emailsandorcids\AB@note}{}{, \csuse{@emailsandorcids\AB@note}}}%
   }
   \endgroup
}
\def\maketitle{%
   \ifnum\value{authors}>2
   \authorrunning{\@firstauthor\ et\ al.}%
   \else
   \authorrunning{\@authlisthead}
   \fi%
   \AB@maketitle%
}
\ifusehyperref
   \AddToHook{env/document/begin}[cidarticle/loadhyperref]{%
      \RequirePackage{hyperref}
      \RequirePackage[startatroot]{bookmark}
      \RequirePackage{colorprofiles}
      \RequirePackage[a-2b,mathxmp]{pdfx}[2018/12/22]
      \hypersetup{%
         colorlinks=false,%
         %allcolors=black,%
         linkcolor=BrickRed,
         citecolor=Green,
         filecolor=Mulberry,
         urlcolor=NavyBlue,
         menucolor=BrickRed,
         runcolor=Mulberry,
         linkbordercolor=BrickRed,
         citebordercolor=Green,
         filebordercolor=Mulberry,
         urlbordercolor=NavyBlue,
         menubordercolor=BrickRed,
         runbordercolor=Mulberry,
         bookmarks=true,
         bookmarksnumbered = true,
         bookmarksopen=true,
         bookmarksdepth=5,
         %pdfsubject = {Technical Report},
         %pdfkeywords = {},
         %pdfcreator = {HPI},
         %pdfmetalang = {en-US},
         %pdfproducer = {CID},
         %pdflang = {en-US},
         pdfdisplaydoctitle = true,
         pdfpagemode = UseOutlines,
         pdfpagelayout = SinglePage,
         pdfview = Fit,
         linktoc=all%
      }
      \renewcommand{\theHsection}{\thecidarticle-\arabic{section}}%
      \RequirePackage{orcidlink}%
      \RequirePackage[all]{hypcap}%
   }%
   \DeclareHookRule{env/document/begin}{cidarticle/loadhyperref}{before}{biblatex}
\else
   \RequirePackage{tikz}
   \usetikzlibrary{svg.path}
   \definecolor{orcidlogocol}{HTML}{A6CE39}
   \tikzset{
      orcidlogo/.pic={
         \fill[orcidlogocol] svg{M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z};
         \fill[white] svg{M86.3,186.2H70.9V79.1h15.4v48.4V186.2z}
         svg{M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z}
         svg{M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z};
      }
   }

   %% Reciprocal of the height of the svg whose source is above.  The
   %% original generates a 256pt high graphic; this macro holds 1/256.
   \newcommand{\@OrigHeightRecip}{0.00390625}

   %% We will compute the current X height to make the logo the right height
   \newlength{\@curXheight}

   \DeclareRobustCommand\orcidlink[1]{%
      \setlength{\@curXheight}{\fontcharht\font`X}%
      \mbox{%
         \begin{tikzpicture}[yscale=-\@OrigHeightRecip*\@curXheight,
         xscale=\@OrigHeightRecip*\@curXheight,transform shape]
         \pic{orcidlogo};
         \end{tikzpicture}%
      }{}}

   \providecommand{\texorpdfstring}[2]{#2}%
   \providecommand{\pdfbookmark}[3][]{\relax}%
   \providecommand{\phantomsection}{\relax}
\fi%
\ifusecleveref%
   \AtEndPreamble{%
      \ifcidenglish
        \RequirePackage[capitalise,nameinlink]{cleveref}
        \crefname{section}{Sect.}{Sect.}
        \Crefname{section}{Sect.}{Sect.}
      \else
        \RequirePackage[ngerman,nameinlink]{cleveref}
      \fi%
      \crefname{figure}{\figurename}{\figurename}
      \Crefname{figure}{\figurename}{\figurename}
      \crefname{listing}{\lstlistingname}{\lstlistingname}
      \Crefname{listing}{\lstlistingname}{\lstlistingname}
      \crefname{table}{\tablename}{\tablename}
      \Crefname{table}{\tablename}{\tablename}
   }%
\fi%
\newcommand*{\cid@abbrv}[1]{#1\@\xspace}
\newcommand*{\cidabbrv}[2]{\gdef#1{\cid@abbrv{#2}}}
\newcommand*{\cid@initialism}[1]{\textsc{#1}\xspace}
\newcommand*{\cidinitialism}[2]{\gdef#1{\cid@initialism{#2}}}
\newcommand*{\ie}{\cid@abbrv{i.\,e.}}
\newcommand*{\eg}{\cid@abbrv{e.\,g.}}
\newcommand*{\cf}{\cid@abbrv{cf.}}
\newcommand*{\etal}{\cid@abbrv{et~al.}}
\newcommand*{\OMG}{\cid@initialism{omg}}
\newcommand*{\BPM}{\cid@initialism{bpm}}
\newcommand*{\BPMN}{\cid@initialism{bpmn}}
\newcommand*{\BPEL}{\cid@initialism{bpel}}
\newcommand*{\UML}{\cid@initialism{uml}}
\frenchspacing
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\displaywidowpenalty=10000
\clubpenalty=9999
\interfootnotelinepenalty=9999
\brokenpenalty=2000
\vfuzz \hfuzz
\raggedbottom
%% 
%% Copyright (C) 2023 by Universitätsverlag Potsdam
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Martin Sievers.
%% 
%% This work consists of the file  cidarticle.dtx
%%                                 cidarticle.ins
%%                                 README.md
%%                                 CHANGELOG.md
%%           and the derived files cidarticle.pdf
%%                                 cidarticle.cls
%%                                 cidarticle-author-template.tex
%%                                 cidarticle-example.bib
%%
%% End of file `cidarticle.cls'.
