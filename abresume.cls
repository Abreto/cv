\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abresume}[2019/05/07 v0.1 abResume LaTeX class]

\LoadClass[a4paper,10pt,oneside,fontset=mac]{ctexart}
\RequirePackage[left=0.75in, right=0.75in, bottom=1in, top=1in]{geometry}

\DeclareOption{withphoto}{\def\@withphoto{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements
\RequirePackage{xcolor}
\definecolor{linkblue}{HTML}{0099ff}
\definecolor{emphred}{HTML}{990000}
% \RequirePackage[xetex, hidelinks]{hyperref}
% \RequirePackage[xetex, colorlinks=true, allcolors={linkblue}]{hyperref}
\RequirePackage[xetex, colorlinks=true, urlcolor={linkblue}, linkcolor={black}]{hyperref}

\RequirePackage{graphicx}
\graphicspath{ {images/} }


% No page numbers
% \pagenumbering{gobble}
% \pagestyle{empty} % Suppress page numbers
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\fancyfoot[C]{}
\fancyfoot[R]{\thepage\ / \textcolor{black}{\pageref{LastPage}}}
\pagestyle{fancy}

\RequirePackage{fontspec}
\setmainfont{Palatino}[
    SmallCapsFont={Palatino SC}
]

% Hiragino Sans GB W6, Kaiti SC
\setCJKmainfont[BoldFont=PingFang SC Semibold, ItalicFont=PingFang SC Light]{PingFang SC Regular}

% \RequirePackage{pxfonts}
% \RequirePackage{sourcecodepro}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name, email, phone and face
%----------------------------------------------------------------------------------------

\newcommand*{\name}[2]{
    \renewcommand{\@firstname}{#1}
    \renewcommand{\@lastname}{#2}
}
\newcommand{\@firstname}{}
\newcommand{\@lastname}{}
% \newcommand{\fullname}{\@firstname~\textsc{\@lastname}}
\newcommand{\fullname}{\@lastname\@firstname}

\newcommand*{\phone}[1]{\renewcommand{\@phone}{#1}} % Defines the \phone command to set phone
\newcommand{\@phone}{} % Sets \@phone to empty by default

\newcommand*{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\@email}{}

\newcommand*{\homepage}[2]{
    \renewcommand{\@homepageurl}{#1}
    \renewcommand{\@homepagetil}{#2}
}
\newcommand{\@homepageurl}{}
\newcommand{\@homepagetil}{}

\newcommand*{\face}[1]{\renewcommand{\@face}{#1}}
\newcommand{\@face}{}


\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{fontawesome} % icons
\definecolor{cvgray}{gray}{0.5}
\definecolor{nameblue}{HTML}{004d99}
% \RequirePackage[T1]{fontenc}
\newcommand{\abcvHeaderNameSty}[1]{{\textcolor{nameblue}{{#1}}}}
\newcommand{\testline}{}
\newcommand{\abcvHeaderIconSep}{~}
\newcommand*{\abcvHeaderItemSty}[1]{\textcolor{cvgray}{\texttt{#1}}}
\newcommand{\makecvheader}{%
    % \begin{center}
    %     {\LARGE \fullname} \\
    %     {\small \textcolor{cvgray}{\emph{Curriculum Vit\ae}}}
    % \end{center}
    % \hrule
    % \begin{tabularx}{\textwidth}{c>{\raggedleft\arraybackslash}X} \testline
    %     \multirow{8}{*}{
    %         % \parbox[c][35mm]{25mm}{
    %         % Standard 1-inch photo
    %         \includegraphics[width=25mm,height=35mm]{\@face}
    %         % }
    %     }
    %         & {\LARGE \fullname} \\[0pt]\testline
    %         & {\small \textcolor{cvgray}{\emph{Curriculum Vit\ae}}} \\[0pt]\testline
    %         \\[0pt]\testline
    %         & {\faMobilePhone\abcvHeaderIconSep\abcvHeaderItemSty{\@phone}}\\[0pt]\testline
    %         & {\faEnvelopeO\abcvHeaderIconSep\href{mailto:\@email}{\abcvHeaderItemSty{\@email}}} \\[0pt]\testline
    %         & {\faGlobe\abcvHeaderIconSep\href{\@homepageurl}{\abcvHeaderItemSty{\@homepagetil}}}\\[0pt]\testline
    %         \\[0pt]\testline
    %         \\[0pt]\testline
    %         \\[0pt]\testline
    % \end{tabularx}
    \begin{tabularx}{\textwidth}{>{\centering\arraybackslash}Xr} \testline
        {\huge \abcvHeaderNameSty{\fullname}}
            \ifthenelse{\isundefined{\@withphoto}}
            {}
            {
                & \multirow{8}{*}{
                % \parbox[c][35mm]{25mm}{
                % Standard 1-inch photo
                \includegraphics[width=25mm,height=35mm]{\@face}
                % }
                }
            } \\[1pt]\testline
        {\small \textcolor{cvgray}{\textit{个人简历}}} \\[0pt]\testline
        \\[0pt]\testline
        % {\faPhone\abcvHeaderIconSep\abcvHeaderItemSty{\@phone}}\\[0pt]\testline
        {\abcvHeaderItemSty{\faEnvelopeO\abcvHeaderIconSep}\href{mailto:\@email}{\abcvHeaderItemSty{\@email}}} %\\[0pt]\testline
        \ifthenelse{\equal{\@homepageurl}{}}{}
        {\abcvHeaderItemSty{$\;\;\bullet\;\;$} {\abcvHeaderItemSty{\faGlobe\abcvHeaderIconSep}\href{\@homepageurl}{\abcvHeaderItemSty{\@homepagetil}}}}\\[0pt]\testline
        \\[0pt]\testline
        \ifthenelse{\isundefined{\@withphoto}}{}
        {
            \\[0pt]\testline
            \\[0pt]\testline
            \\[0pt]\testline
        }
    \end{tabularx}
}

\definecolor{abcvblue}{HTML}{004d99}
\newcommand{\abcvBlue}[1]{\textcolor{abcvblue}{{#1}}}

\def\sectionskip{\medskip}
\def\sectionlineskip{\medskip}
\newCJKfontfamily\cvsectionfont{PingFang SC Medium}
\newcommand{\cvsection}[1]{
    \sectionskip
    {\Large \cvsectionfont {\abcvBlue{#1}}}
    \nopagebreak\sectionlineskip
    \abcvBlue{\hrule} % Horizontal line
    \nopagebreak
}

\RequirePackage{enumitem}
\setlist[itemize,1]{label=\abcvBlue{\textbullet}}
\setlist[itemize,2]{label=\abcvBlue{$\circ$}}
\newenvironment{cvlist}
{
    \begin{itemize}[topsep=0pt, leftmargin=1.0em, itemsep=2pt, parsep=1pt]
}
{
    \end{itemize}
}

% \newenvironment{eduitem}[4]
% {
%     % \textbf{{#1} \hfill {#2}} \\
%     % \begin{flushright}
%     %    \hfill \textit{#3}-\textit{#4}
%     % \end{flushright}
%     \def\@eduitem@t{#3}
%     \def\@eduitem@f{#4}
%     \tabularx{\textwidth}{Xr}%\hline
%         \textbf{#1} & \textbf{#2} \\[0pt]%\hline
%         \begin{cvlist}
% }
% {
%     \end{cvlist} & \textit{\@eduitem@t}~-~\textit{\@eduitem@f} \\%\hline
%     \endtabularx
%     % \smallskip
% }
\RequirePackage{calc}
\newlength{\@abcvlenofcity}\newlength{\@abcvlenofprid}
\newenvironment{eduitem}[4] % Name, Location, Start[, End]
{
    % \textbf{{#1} \hfill {#2}} \\
    % \begin{flushright}
    %    \hfill \textit{#3}-\textit{#4}
    % \end{flushright}
    \def\@abcveduitemcity{\textbf{#2}}
    \ifthenelse{\equal{#4}{}}
        {\def\@abcveduitemperiod{\textit{#3}}}
        {\def\@abcveduitemperiod{\textit{#3}~-~\textit{#4}}}
    \setlength{\@abcvlenofcity}{\widthof{\@abcveduitemcity}}
    \setlength{\@abcvlenofprid}{\widthof{\@abcveduitemperiod}}
    \smallskip
    \textbf{#1} 
    {\hspace*{\fill} \raggedright {\parbox[t][2em]{\maxof{\@abcvlenofcity}{\@abcvlenofprid}}{\hfill\raggedright \@abcveduitemcity \\ \hfill\raggedright \@abcveduitemperiod \\[0pt]}}}\\
    \vspace*{-1.5em}
    \begin{cvlist}
}
{
    \end{cvlist}
}

\newcommand{\awardentry}[2]{%
\item {#1}. \textit{#2}.
}
\newenvironment{awardentries}
{
    \begin{cvlist}
}
{
    \end{cvlist}
}

\newcommand{\cvtblpair}[2]{%
{#1} & {#2} \\[2pt]
}
\newenvironment{cvtbl}
{
    \begin{tabular}{>{\itshape}rl}
}
{
    \end{tabular}
}

%%%%%%%%%%%%%%%% Experience %%%%%%%%%%%%%%%%%
\newcommand{\abcvRoleSty}[1]{\textit{#1}}
\newenvironment{projitem}[4] % Project name, Role[, start, end]
{
    % \par\nobreak\vfil\penalty0\vfilneg\vtop\bgroup
    \textbf{#1} \\
    \hspace*{1em} \abcvRoleSty{#2} \hfill \textit{#3}\ifthenelse{\equal{#4}{}}{}{~-~\textit{#4}} \\[1pt]
    \vspace*{-1.5em}
    \begin{cvlist}
}
{
    \end{cvlist}
    % \par\xdef\tpd{\the\prevdepth}\egroup\prevdepth=\tpd
}
