%%%%  LaTeX-Class-File-for-Research-Report-Formats-of-Mahidol-University.cls  %%%%%%%%%
%%% =============================================================================== %%%
%%%  @LaTeX-style-file{
%%%    author          = "Sakul Montha",
%%%    version         = "1.0",
%%%    create date     = "08-Apr-2017",
%%%    last update     = "14-Oct-2017",
%%%    filename        = "LaTeX-Class-File-for-Research-Report-Formats-of-Mahidol-University.cls",
%%%    address         = "Mahidol University"
%%%    email           = "iamgique@gmail.com"
%%%    keywords        = "LaTeX, LaTeX class file for research report formats of Mahidol University",
%%%    docstring       = "Usage:
%%%                         \documentclass[..,Xpt]{theisis}
%%%                         \author{..}
%%%                         \authorThai{..}
%%%                         \degreefaculty{..}
%%%                         \degreefacultyThai{..}
%%%                         \title{..}
%%%                         \titleThai{..}
%%%                         \maketitle
%%%                         \begin{abstract}...\end{abstract}
%%%                         \begin{acknowledgement}...\end{acknowledgement}
%%%                         ...
%%%                         \references use references.tex and references.bib
%%%                         https://www.sharelatex.com/learn/Bibliography_management_in_LaTeX
%%%                         https://www.sharelatex.com/learn/Bibtex_bibliography_styles
%%%                         \begin{biography}{Author's name}...\end{biography}
%%%                         \end{document}
%%%
%%%  }

%%% ===========================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\typeout{Document Style `For Mahidol University' <8-April-2017>.}
\typeout{=========================================}
\typeout{Written by Sakul Montha}
\typeout{=========================================}

\usepackage{graphicx} %for figures
\usepackage{enumerate} %for lists
\usepackage{parskip}
\usepackage{amsmath}
\usepackage{ifthen}
\usepackage{tabularx,booktabs}
\usepackage{multirow}
\usepackage{hyperref}
\usepackage{url}

\usepackage{array}
\usepackage[table]{xcolor}
%-------------------------------------------------------
\paperwidth=21.0cm
\paperheight=29.7cm
\usepackage{geometry}
\geometry{
  a4paper, total={170mm,257mm},
  left=3.75cm,
  right=2.5cm,
  bottom=2.8cm,
  top=3.38cm,
  headsep=0.80cm,
  textheight=620pt
}

\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra}
\XeTeXlinebreaklocale "th_TH"

\fontspec [Path = fonts/,BoldFont = timesbd.ttf,ItalicFont = timesi.ttf,BoldItalicFont = timesbi.ttf]{times.ttf}
 
 \newenvironment{thai}{
    \fontspec [Path = fonts/,
        BoldFont = angsab.ttf,
        ItalicFont = angsai.ttf,
        BoldItalicFont = angsaz.ttf
    ]{angsa.ttf}
}

\usepackage{newtxtext,newtxmath}

%% define new needed boolean variables
\newif\if@tmptwocolumn  \@tmptwocolumnfalse
\newif\if@draftversion  \@draftversionfalse
\newif\if@technote      \@technotefalse
\newif\if@openright


\usepackage{indentfirst}

\setlength{\parindent}{2.0cm}
\parindent        2.0cm
\parskip          0.0em

\newcommand{\latex}{\LaTeX\xspace\space}
\newcommand{\tex}{\TeX\xspace\space}

%%%%%%%%%%%%%%%%%%%%%%% Chapter %%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{5}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand \thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand \thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand \theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand \thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}

\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{fancy}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}\MakeUppercase{#1}}%
                    \else
                      \addcontentsline{toc}{chapter}\MakeUppercase{{#1}}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}

%%%%%%%%%%%%%%%%%%%%%%% Figure & Table %%%%%%%%%%%%%%%%%%%%%%%
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{LIST OF FIGURES}
\newcommand\listtablename{LIST OF TABLES}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure }
\newcommand\tablename{Table }


\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}


\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{5\p@}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\textbf{#1} #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
%%%%%%%%%%%%%%%%%%%%%%% table %%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% bullet & number %%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
\newcommand\section{\leftskip 0pt\@startsection {section}{1}{\z@}%
                                   {-.1ex \@plus -1ex \@minus -.2ex}%
                                   {0.1ex \@plus.1ex}%
                                   {\fontsize{14pt}{20pt}\selectfont\bfseries }}
\newcommand\subsection{\null\leftskip 2.0cm\@startsection{subsection}{2}{\z@}%
                                     {-.1ex \@plus -1ex \@minus -.2ex}%
                                     {0.1ex \@plus.1ex}%
                                     {\fontsize{12pt}{20pt}\selectfont\bfseries }}
\newcommand\subsubsection{\null\leftskip 2.0cm\@startsection{subsubsection}{3}{\z@}%
                                     {-.1ex \@plus -1ex \@minus -.2ex}%
                                     {0.1ex \@plus.1ex}%
                                     {\fontsize{12pt}{20pt}\selectfont\bfseries }}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}


\if@twocolumn
  \setlength\leftmargini  {2.3cm}
\else
  \setlength\leftmargini  {2.3cm}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}


%%%%%%%%%%%%%%%%%%%%%%% setup caption  %%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{subcaption}
\captionsetup[figure]{labelfont={bf}, labelsep=space}
\captionsetup[table]{singlelinecheck=false, format=hang, justification=raggedright, font=footnotesize, labelsep=space, labelfont={bf}, textfont={bf}}


%%%%%%%%%%%%%%%%%%%%%%% START %%%%%%%%%%%%%%%%%%%%%%%%%%
\def\maketitle{\par
  \begingroup
  \def\thefootnote{} % the \thanks{} mark type is empty
  \if@twocolumn
     \if@technote
        \newpage\global\@topnum\z@ \@maketitle
     \else\twocolumn[\@maketitle]\fi
  \else\newpage\global\@topnum\z@ \@maketitle \fi
  \thispagestyle{titlepagestyle}\@thanks
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}
  \let\typeOfReport\relax
  \let\thanks\relax
  \let\ReportType\relax
  \let\DegreeTitle\relax
  \let\ProgramTitle\relax
  \let\release\relax
  \let\Advisor\relax
  \let\AdvisorPosition\relax
  \let\CoAdvisor\relax
  \let\Committee\relax
  \let\CommitteePosition\relax
  \let\Committeee\relax
  \let\CommitteeePosition\relax
}

\def\@maketitle{
    \thispagestyle{empty}
    \begin{center}
        \textbf{\\[-0.9cm]\fontsize{14pt}{16pt}\selectfont\MakeUppercase \@title \\[8.1cm]}
        \textbf{\fontsize{14pt}{16pt}\selectfont\MakeUppercase \@author \\}
        \vfill
        \textbf{\fontsize{14pt}{16pt}\selectfont\MakeUppercase \@ProgramTitle \\[1.0cm]}
        \textbf{\fontsize{14pt}{15pt}\selectfont\MakeUppercase COPYRIGHT OF MAHIDOL UNIVERSITY}
        \newpage
    \end{center}
    
    \begin{center}
        \thispagestyle{plain}
        \ifthenelse{\equal{\@typeOfReport}{thematic}}
        {\text{\\[-0.8cm]Thematic Paper \\[-0.15cm]}}
        {\text{\\[-0.8cm]Thesis \\[-0.15cm]}}%
        entitled \\
        \textbf{\fontsize{14pt}{17pt}\selectfont\MakeUppercase \@title \\[6em]}
        \vfill
        {
            \begin{tabular}
                {p{6.8cm\linewidth} p{1.1cm\linewidth} p{6.8cm\linewidth}}
                                &   & \hrulefill \\
                                &   & \@author \\
                                &   & Cabdidate \\[1.5cm]
                                &   & \hrulefill \\
                                &   & \@Advisor \\
                                &   & Major advisor \\[1.5cm]
                                
                                &   & \hrulefill \\
                                &   & \@CoAdvisor \\
                                &   & Co-Advisor \\[1.5cm]
                                
        \hrulefill              &   & \hrulefill \\
        \@dean                  &   & \@Committee \\[0.2cm]
        Dean                    &   & \modMultiRow{\@CommitteePosition} \\
        \@deanPo                &   & \\
    
            \end{tabular}
        }
    \end{center}

    \newpage

    \begin{center}
        \thispagestyle{plain}
        \ifthenelse{\equal{\@typeOfReport}{thematic}}
        {\text{\\[-0.8cm]Thematic Paper \\[-0.15cm]}}
        {\text{\\[-0.8cm]Thesis Paper \\[-0.15cm]}}%
        entitled \\
        \textbf{\fontsize{14pt}{17pt}\selectfont\MakeUppercase \@title \\[1em]}
        \fontsize{12pt}{17pt}\selectfont was submitted to the Faculty of Graduate Studies, Mahidol University \\ for the degree of \@SubmittedFor \\ on \\ \@SubmittedDate \\[2em]
        \vfill
        {
            \begin{tabular}
                {p{6.8cm\linewidth} p{1.1cm\linewidth} p{6.8cm\linewidth}}
                                &   & \hrulefill \\
                                &   & \@author \\
                                &   & Cabdidate \\[1.0cm]
                                &   & \hrulefill \\
                                &   & \@Advisor \\
                                &   & Chair \\[1.0cm]
                        \if@REPORTusingCoAdvisor%
                                &   & \hrulefill \\
                                &   & \@memberOne \\
                                &   & Member \\[1.0cm]
                        \fi%
        \hrulefill              &   & \hrulefill \\
        \@memberTwo             &   & \@memberThree \\
        Member                  &   & Member \\[1.0cm]
        
        \hrulefill              &   & \hrulefill \\
        \@dean                  &   & \@deanAct \\
        Dean                    &   & Acting Dean \\
        \@deanPo                &   & \@deanActPo \\
    
            \end{tabular}
        }
    \end{center}

    \newpage
}

\def\typeOfReport#1{\gdef\@typeOfReport{#1}}
\def\title#1{\gdef\@title{#1}}
\def\titleThai#1{\gdef\@titleThai{#1}}
\def\ReportType#1{\gdef\@ReportType{#1}}
\def\DegreeTitle#1{\gdef\@DegreeTitle{#1}}
\def\SubmittedFor#1{\gdef\@SubmittedFor{#1}}
\def\SubmittedDate#1{\gdef\@SubmittedDate{#1}}
\def\ProgramTitle#1{\gdef\@ProgramTitle{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% !!!!!!!!
% \def\ISBN#1{\gdef\@ISBN{\bf#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% !!!!!!!!
\def\author#1{\gdef\@author{#1}}
\def\authorThai#1{\gdef\@authorThai{#1}}
\def\degreefaculty#1{\gdef\@degreefaculty{#1}}
\def\degreefacultyThai#1{\gdef\@degreefacultyThai{#1}}
\def\release#1{\gdef\@release{\bf#1}}
\def\Advisor#1{\gdef\@Advisor{#1}}
\def\AdvisorPosition#1{\gdef\@AdvisorPosition{#1}}
% \def\CoAdvisor#1{\gdef\@CoAdvisor{#1}}
\def\Committee#1{\gdef\@Committee{#1}}
\def\CommitteePosition#1{\gdef\@CommitteePosition{#1}}
\def\Committeee#1{\gdef\@Committeee{#1}}
\def\CommitteeePosition#1{\gdef\@CommitteeePosition{#1}}
\def\dean#1{\gdef\@dean{#1}}
\def\deanPo#1{\gdef\@deanPo{#1}}
\def\deanAct#1{\gdef\@deanAct{#1}}
\def\deanActPo#1{\gdef\@deanActPo{#1}}
\def\memberOne#1{\gdef\@memberOne{#1}}
\def\memberTwo#1{\gdef\@memberTwo{#1}}
\def\memberThree#1{\gdef\@memberThree{#1}}

\def\acknowledgement#1{\gdef\@acknowledgement{#1}}

%%% abstract %%%
\def\abstractCommittee#1{\gdef\@abstractCommittee{#1}}
\def\abstractCommitteeThai#1{\gdef\@abstractCommitteeThai{#1}}
\def\abstractEng#1{\gdef\@abstractEng{#1}}
\def\abstractThai#1{\gdef\@abstractThai{#1}}
\def\keywordEng#1{\gdef\@keywordEng{#1}}
\def\keywordThai#1{\gdef\@keywordThai{#1}}
\def\pageCountEng#1{\gdef\@pageCountEng{#1}}
\def\pageCountThai#1{\gdef\@pageCountThai{#1}}

%%% Biography %%%
\def\dateOfBirth#1{\gdef\@dateOfBirth{#1}}
\def\placeOfBirth#1{\gdef\@placeOfBirth{#1}}
\def\institutionsAttended#1{\gdef\@institutionsAttended{#1}}
\def\institutionsAttendedTwo#1{\gdef\@institutionsAttendedTwo{#1}}
\def\homeAddress#1{\gdef\@homeAddress{#1}}
\def\tel#1{\gdef\@tel{#1}}
\def\email#1{\gdef\@email{#1}}
\def\office#1{\gdef\@office{#1}}
\def\employmentAddress#1{\gdef\@employmentAddress{#1}}

\def\referencesOrBibliography#1{\gdef\@referencesOrBibliography{#1}}

\newcommand\modMultiRow[1]{%
  \multirow{2}*{%
    \begin{minipage}{6.8cm}% --- or minipage, if you prefer a fixed width
    \flushleft #1%
    \end{minipage}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ISBN !!!!!!!!
\def\@ISBN{\relax}
\newif\if@REPORTusingISBN
\global\@REPORTusingISBNfalse
\def\ISBN#1{\def\@ISBN{#1} \global\@REPORTusingISBNtrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CoAdvisor !!!!!!!!
\def\@CoAdvisor{\relax}
\newif\if@REPORTusingCoAdvisor
\global\@REPORTusingCoAdvisorfalse
\def\CoAdvisor#1{\def\@CoAdvisor{#1} \global\@REPORTusingCoAdvisortrue}


\usepackage{enumitem}
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}


%%%%%%%%%%%%%%%%%%%%%% Biography %%%%%%%%%%%%%%%%%%%%%% 
\def\biography{%
    \clearpage
    \addcontentsline{toc}{chapter}{\textbf{BIOGRAPHY}}
    
    \fancyhf{}
    \fontsize{12pt}{20pt}\selectfont
    \thispagestyle{fancy}
    
    \fancyhead{}
    \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{Fac. of Grad. Studies, Mahidol Univ.}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@author}}}
    \fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@degreefaculty } / \thepage}{\fontsize{10pt}{12} \selectfont Biography / \thepage}}
    
    \begin{center}
    \textbf{\fontsize{14pt}{15pt}\selectfont\\[-0.0cm] BIOGRAPHY\\[1.80cm]}
    
    {\begin{tabular}{p{6.8cm\linewidth} p{1.1cm\linewidth} p{6.8cm\linewidth}}
                            
    \textbf{NAME}                        &   & \@author \\
    \textbf{DATE OF BIRTH}               &   & \@dateOfBirth \\
    \textbf{PLACE OF BIRTH}              &   & \@placeOfBirth \\
    \textbf{INSTITUTIONS ATTENDED}       &   & \@institutionsAttended \\
                                         &   & \@institutionsAttendedTwo \\
    \textbf{HOME ADDRESS}                &   & \@homeAddress \\
                                         &   & Tel: \@tel \\
                                         &   & Email: \@email \\
    \textbf{INSTITUTIONS ATTENDED}       &   & \@office \\
                                         &   & \@employmentAddress \\
    \end{tabular}}
    \end{center}
\indent
}
\def\endbiography{\\ \newpage}

%%%%%%%%%%%%%%%%%%%%%% APPENDICES %%%%%%%%%%%%%%%%%%%%%% 
\usepackage{appendix}
\def\appendices{%
    \addcontentsline{toc}{chapter}{\textbf{APPENDICES}}
    
    \appendix
    
    \makeatletter
    \renewcommand*\l@chapter{\@dottedtocline{1}{1.8cm}{0.6cm}}
    \renewcommand*\l@section{\@dottedtocline{1}{1.8cm}{0.6cm}}
    \renewcommand*\l@subsection{\@dottedtocline{2}{3.6cm}{0.9cm}}
    \renewcommand*\l@subsubsection{\@dottedtocline{3}{5.4cm}{1.2cm}}
    \makeatother
    
    \clearpage
    \fancyhf{}
    \fontsize{12pt}{20pt}\selectfont
    \thispagestyle{fancy}
    
    \fancyhead{}
    \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{Fac. of Grad. Studies, Mahidol Univ.}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@author}}}
    \fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@degreefaculty } / \thepage}{\fontsize{10pt}{12} \selectfont Appendices / \thepage}}
    \renewcommand{\headrulewidth}{0pt}
    
    \begin{center}
        \topskip 0pt
        \vspace*{\fill}
        \textbf{\fontsize{14pt}{15pt}\selectfont\\[-3.0cm] APPENDICES}
        \vspace*{\fill}
    \end{center}
    
    \renewcommand{\chaptername}{APPENDIX}
    
    \setcounter{chapter}{0}
    \renewcommand \thesection {\MakeUppercase{\@alph\c@chapter}.\@arabic\c@section}
    
    \newcounter{figure}
    \renewcommand \thefigure {\MakeUppercase{\@alph\c@chapter}.\@arabic\c@figure}
    
    \newcounter{table}
    \renewcommand \thetable {\MakeUppercase{\@alph\c@chapter}.\@arabic\c@table}
    
    \titleformat{\chapter}[display]
      {\centering \bfseries \fontsize{14pt}{14pt}\selectfont}
      {\\[0.65cm] \MakeUppercase{\chaptertitlename} \MakeUppercase{\@alph\c@chapter}}
      {.7em}
      {\MakeUppercase}
\indent 
}

%%%%%%%%%%%%%%%%%%%%%% references or bibliography  %%%%%%%%%%%%%%%%%%%%%%
\def\references{%
    \clearpage
    \addcontentsline{toc}{chapter}{\MakeUppercase{\textbf{\@referencesOrBibliography}}}
    
    \fancyhf{}
    \fontsize{12pt}{20pt}\selectfont
    \thispagestyle{fancy}
    
    \fancyhead{}
    \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{Fac. of Grad. Studies, Mahidol Univ.}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@author}}}
    \fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@degreefaculty } / \thepage}{\fontsize{10pt}{12} \selectfont \@referencesOrBibliography / \thepage}}
    
    \begin{center}
    \textbf{\fontsize{14pt}{15pt}\selectfont\\[-0.0cm] \MakeUppercase{\@referencesOrBibliography}}
    \end{center}
    
    \indent}
    
    \renewcommand{\refname}{}
\def\endreferences{\newpage }

%%%%%%%%%%%%%%%%%%%% Acknowledgement %%%%%%%%%%%%%%%%%%%%%%
\def\acknowledgement{%
    \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
    \fancyhf{}
    \fancyhead[R]{\fontsize{10pt}{12} \selectfont \thepage}
    \pagenumbering{roman}
    \setcounter{page}{3}
    \fontsize{12pt}{20pt}\selectfont
    \null
    \thispagestyle{fancy}
    \begin{center}
    \textbf{\fontsize{14pt}{15pt}\selectfont\\[-0.48cm] ACKNOWLEDGEMENTS\\[1.80cm]}
    \end{center}

    \indent}
\def\endacknowledgement{\\ \par \hfill \@author \newpage

    \addcontentsline{toc}{chapter}{ABSTRACT (ENGLISH)}
    %abstractEng
    \fancyhf{}
    \ifthenelse{\equal{\@typeOfReport}{thematic}}
    {\rhead{\fontsize{10pt}{12} \selectfont Thematic Paper / \thepage}}
    {\rhead{\fontsize{10pt}{12} \selectfont Thesis / \thepage}}%
    \lhead{\fontsize{10pt}{12} \selectfont Fac. of Grad. Studies, Mahidol Univ.}
    \pagenumbering{roman}
    \setcounter{page}{4}
    \fontsize{10.5pt}{15pt}\selectfont
    \null
    \thispagestyle{fancy}
    \begin{center}

    \\[-0.5cm]\fbox{\begin{minipage}{5.7in}
    \vbox to 23cm{
        \MakeUppercase{\@title} \\ \\
        \MakeUppercase{\@author} \\ \\
        \MakeUppercase{\@degreefaculty} \\ \\
        \MakeUppercase{\@abstractCommittee} \\ \\
        \MakeUppercase{\centerline{Abstract}} \\
        \@abstractEng \\ \\
        \@keywordEng \\ \\
        \@pageCountEng \\
    }
    \end{minipage}}
    \end{center}

    \newpage
    
    \addcontentsline{toc}{chapter}{ABSTRACT (THAI)}
    %abstractThai
    \fancyhf{}
    \ifthenelse{\equal{\@typeOfReport}{thematic}}
    {\rhead{\fontsize{10pt}{12} \selectfont Thematic Paper / \thepage}}
    {\rhead{\fontsize{10pt}{12} \selectfont Thesis / \thepage}}%
    \lhead{\fontsize{10pt}{12} \selectfont Fac. of Grad. Studies, Mahidol Univ.}
    \pagenumbering{roman}
    \setcounter{page}{5}
    \fontsize{10.5pt}{15pt}\selectfont
    \null
    \thispagestyle{fancy}
    \begin{center}

    \\[-0.5cm]\fbox{\begin{minipage}{5.7in}
    \vbox to 23cm{
        {\fontsize{14pt}{20pt}\selectfont\@titleThai} \\ \\
        \MakeUppercase{\@title} \\ \\
        {\fontsize{14pt}{20pt}\selectfont\@authorThai} \\ \\
        {\fontsize{14pt}{30pt}\selectfont\@degreefacultyThai} \\ \\
        {\fontsize{14pt}{30pt}\selectfont\@abstractCommitteeThai} \\ \\
        {\fontsize{14pt}{30pt}\selectfont
            \begin{thai}\MakeUppercase{\centerline{ บทคัดย่อ }}\end{thai} \\
        }
        
        {\fontsize{14pt}{16pt}\selectfont\@abstractThai} \\ \\
        {\fontsize{14pt}{30pt}\selectfont\@keywordThai} \\ \\
        {\fontsize{14pt}{30pt}\selectfont\@pageCountThai} \\
    }
    \end{minipage}}
    \end{center}

    \newpage
}

%%%%%%%%%%%%%%%%%%%%%%% Chapter %%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{titlesec}
\usepackage{titletoc}
\usepackage{afterpage}
\renewcommand\chaptername{CHAPTER}
\titleformat{\chapter}[display]
  {\centering \bfseries \fontsize{14pt}{14pt}\selectfont}
  {\\[0.65cm] \MakeUppercase{\chaptertitlename} \MakeUppercase{\@roman\c@chapter}}
  {.7em}
  {\MakeUppercase}

%%%%%%%%%%%%%%%%%%%%%%% Section & Sub Section %%%%%%%%%%%%%%%%%%%%%%%%%%
\titlespacing*{\chapter}{0}{0}{52pt}
\titlespacing*{\section}{0}{52pt}{0}
\titlespacing*{\subsection}{2.0cm}{20pt}{0}
\titlespacing*{\subsubsection}{3.0cm}{20pt}{0}

%%%%% header numbering mahidol style %%%%%
\fancypagestyle{mahidol-fancy-style}{%
    \headsep=0.80cm
    \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{#1}}{}}
    \pagenumbering{arabic}
    \setcounter{page}{1}
    \fancyhead{}
    \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{Fac. of Grad. Studies, Mahidol Univ.}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@author}}}
    \fancyhead[R]{\ifthenelse{\isodd{\value{page}}}{\fontsize{10pt}{12} \selectfont \nouppercase{\@degreefaculty } / \thepage}{\fontsize{10pt}{12} \selectfont \nouppercase{\leftmark} / \thepage}}
    \renewcommand{\headrulewidth}{0pt}
}





%%%%%%%%%%%%%%%%%%%%%%% TOC %%%%%%%%%%%%%%%%%%%%%%%%%%
\input cls/toccontinue.clo\relax
\def\tocname{CONTENTS}
\c@tocdepth=\c@secnumdepth
 
\def\tableofcontents{
   \clearpage
   \typeout{CONTENTS}
   \def\headmark{\vbox{
        \hbox to \textwidth{\hfil{\fontsize{10pt}{0pt}\selectfont\thepage}}
        \vbox to 40pt {\vfil\vfil}
        \hbox to \textwidth{\textbf{\fontsize{14pt}{15pt}\selectfont\hfil CONTENTS (cont.)} \hfil}
        \vbox to 25pt {\vfil\vfil}
        \hbox to \textwidth{\bfseries\hfil{Page}}}}
   \headsep=3.00cm
   \textheight=620pt
   \pagestyle{continued}
   \table@of@cont
   \newpage
   }
 
\def\table@of@cont{%
   \begin{singlespace}
   \makeatletter
        \renewcommand*\l@section{\@dottedtocline{1}{1.8cm}{0.9cm}}
        \renewcommand*\l@subsection{\@dottedtocline{2}{3.6cm}{1.1cm}}
        \renewcommand*\l@subsubsection{\@dottedtocline{3}{5.4cm}{1.4cm}}
        \renewcommand*\l@table{\@dottedtocline{4}{0.0cm}{0.8cm}}
        \renewcommand*\l@figure{\@dottedtocline{5}{0.0cm}{1.1cm}}
        \renewcommand\@dotsep{240}
    
        \titlecontents{chapter}%
        [0em]% <left>
        {\addvspace{1em}}% <above-code>
        {\bfseries\@chapapp\ \MakeUppercase{\@roman\thecontentslabel}\enspace}%
        {\hspace{-0em}}% <numberless-entry-format> 
        {\hfill\contentspage}%% <filler-page-format>
        [\addvspace{0pt}]% 

        \g@addto@macro{\appendix}{%
            \renewcommand\chaptername{Appendix}%
            \addtocontents{toc}{
                \protect\renewcommand*{\protect\chaptername}{\protect\appendixname}
            }%
            \renewcommand \thechapter {\@alph\c@chapter}
            \renewcommand \thesection {\MakeUppercase{\@alph\c@chapter}.\@arabic\c@section}
        }
    \makeatother
   
   \fancyhf{}
   \fancyhead[R]{\fontsize{10pt}{0pt} \selectfont \thepage}
   \pagenumbering{roman}
   \setcounter{page}{6}
   \thispagestyle{fancy}
   \enlargethispage{-3\baselineskip}
   
   %\@makeschapterhead{CONTENTS}
   \begin{center}
   \textbf{\fontsize{14pt}{15pt}\selectfont\\[-2.48cm] CONTENTS\\[1.00cm]}
   \end{center}
   \hbox to \textwidth{\bfseries{}\hfil{Page}}
   \par
   \@starttoc{toc}
   \end{singlespace}
}
%%%%%%%%%%%%%%%%%%%%%%% TOC %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% LOF %%%%%%%%%%%%%%%%%%%%%%%%%%
\def\listoffigures{
   \clearpage
   \typeout{LIST OF FIGURES.}
   \def\headmark{\vbox{
        \hbox to \textwidth{\hfil{\fontsize{10pt}{0pt}\selectfont\thepage}}
        \vbox to 40pt {\vfil\vfil}
        \hbox to \textwidth{\textbf{\fontsize{14pt}{15pt}\selectfont\hfil LIST OF FIGURES (cont.)} \hfil}
        \vbox to 40pt {\vfil\vfil}
        \hbox to \textwidth{\bfseries{Figure}\hfil{Page}}}}
   \headsep=3.00cm
   \textheight=620pt
   \pagestyle{continued}
   \list@of@figs
   \newpage
   }

\def\list@of@figs{
   \begin{singlespace}
   
   \makeatletter
        \renewcommand*\l@section{\@dottedtocline{1}{1.8cm}{0.8cm}}
        \renewcommand*\l@subsection{\@dottedtocline{2}{3.6cm}{1.1cm}}
        \renewcommand*\l@subsubsection{\@dottedtocline{3}{5.4cm}{1.4cm}}
        \renewcommand*\l@table{\@dottedtocline{4}{0.0cm}{0.8cm}}
        \renewcommand*\l@figure{\@dottedtocline{5}{0.0cm}{1.1cm}}
        \renewcommand\@dotsep{240}
    
        \titlecontents{chapter}%
        [0em]% <left>
        {\addvspace{1em}}% <above-code>
        {\bfseries\@chapapp\ \MakeUppercase{\@roman\thecontentslabel}\enspace}%
        {\hspace{-0em}}% <numberless-entry-format> 
        {\hfill\contentspage}%% <filler-page-format>
        [\addvspace{0pt}]% 


        \g@addto@macro{\appendix}{%
            \renewcommand\chaptername{Appendix}%
            \addtocontents{toc}{
                \protect\renewcommand*{\protect\chaptername}{\protect\appendixname}
            }%
            \renewcommand \thechapter {\@alph\c@chapter}
            \renewcommand \thesection {\MakeUppercase{\@alph\c@chapter}.\@arabic\c@section}
        }
    \makeatother
    
    \fancyhf{}
    \fancyhead[R]{\fontsize{10pt}{0pt} \selectfont \thepage}
    \thispagestyle{fancy}
    \enlargethispage{-0\baselineskip}
   
   %\@makeschapterhead{LIST OF FIGURES}
   \begin{center}
   \textbf{\fontsize{14pt}{15pt}\selectfont\\[-2.48cm] LIST OF FIGURES\\[1.00cm]}
   \end{center}
   \hbox to \textwidth{\bfseries{Figure}\hfil{Page}}
   \par
   \@starttoc{lof}
   \end{singlespace}}
%%%%%%%%%%%%%%%%%%%%%%% LOF %%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% LOT %%%%%%%%%%%%%%%%%%%%%%%%%%
\def\listoftables{
   \clearpage
   \typeout{LIST OF TABLES.}
   \def\headmark{\vbox{
        \hbox to \textwidth{\hfil{\fontsize{10pt}{0pt}\selectfont\thepage}}
        \vbox to 40pt {\vfil\vfil}
        \hbox to \textwidth{\textbf{\fontsize{14pt}{15pt}\selectfont\hfil LIST OF TABLES (cont.)} \hfil}
        \vbox to 40pt {\vfil\vfil}
        \hbox to \textwidth{\bfseries{Table}\hfil{Page}}}}
   \headsep=3.00cm
   \textheight=620pt
   \pagestyle{continued}
   \list@of@tabs
   \newpage
   }

\def\list@of@tabs{
   \begin{singlespace}
   
   \makeatletter
        \renewcommand*\l@section{\@dottedtocline{1}{1.8cm}{0.8cm}}
        \renewcommand*\l@subsection{\@dottedtocline{2}{3.6cm}{1.1cm}}
        \renewcommand*\l@subsubsection{\@dottedtocline{3}{5.4cm}{1.4cm}}
        \renewcommand*\l@table{\@dottedtocline{4}{0.0cm}{0.8cm}}
        \renewcommand*\l@figure{\@dottedtocline{5}{0.0cm}{1.1cm}}
        \renewcommand\@dotsep{240}
    
        \titlecontents{chapter}%
        [0em]% <left>
        {\addvspace{1em}}% <above-code>
        {\bfseries\@chapapp\ \MakeUppercase{\@roman\thecontentslabel}\enspace}%
        {\hspace{-0em}}% <numberless-entry-format> 
        {\hfill\contentspage}%% <filler-page-format>
        [\addvspace{0pt}]% 


        \g@addto@macro{\appendix}{%
            \renewcommand\chaptername{Appendix}%
            \addtocontents{toc}{
                \protect\renewcommand*{\protect\chaptername}{\protect\appendixname}
            }%
            \renewcommand \thechapter {\@alph\c@chapter}
            \renewcommand \thesection {\MakeUppercase{\@alph\c@chapter}.\@arabic\c@section}
        }
    \makeatother
    
    \fancyhf{}
    \fancyhead[R]{\fontsize{10pt}{0pt} \selectfont \thepage}
    \thispagestyle{fancy}
    \enlargethispage{-0\baselineskip}
   
   %\@makeschapterhead{LIST OF TABLES}
   \begin{center}
   \textbf{\fontsize{14pt}{15pt}\selectfont\\[-2.48cm] LIST OF TABLES\\[1.00cm]}
   \end{center}
   \hbox to \textwidth{\bfseries{Table}\hfil{Page}}
   \par
   \@starttoc{lot}
   \end{singlespace}}
%%%%%%%%%%%%%%%%%%%%%%% LOT %%%%%%%%%%%%%%%%%%%%%%%%%%


\makeatletter
\renewcommand\normalsize{%
\@setfontsize\normalsize{12pt}{20pt}% Will look incredibly crabbed if line height is too small
\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@%
\abovedisplayshortskip \z@ \@plus2\p@%
\belowdisplayshortskip 5\p@ \@plus2\p@ \@minus3\p@%
\belowdisplayskip \abovedisplayskip%
\let\@listi\@listI%
}
\normalsize  
\makeatother