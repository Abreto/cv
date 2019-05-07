\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abresume}[2010/05/07 v0.1 abResume LaTeX class]

\LoadClass[a4paper,10pt,oneside]{article}
\RequirePackage[left=0.75in, right=0.75in, bottom=1in, top=1in]{geometry}

\DeclareOption{withphoto}{\def\@withphoto{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements
\RequirePackage[xetex, hidelinks]{hyperref}

\RequirePackage{graphicx}
\graphicspath{ {images/} }

\RequirePackage{xcolor}

% No page numbers
% \pagenumbering{gobble}
\pagestyle{empty} % Suppress page numbers

\RequirePackage{fontspec}
\setmainfont{Palatino}[
    SmallCapsFont={Palatino SC}
]

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
\newcommand{\fullname}{\@firstname~\textsc{\@lastname}}

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
\definecolor{cvgray}{gray}{0.7}
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
        {\small \textcolor{cvgray}{\textit{Curriculum Vit\ae}}} \\[0pt]\testline
        \\[0pt]\testline
        % {\faPhone\abcvHeaderIconSep\abcvHeaderItemSty{\@phone}}\\[0pt]\testline
        {\abcvHeaderItemSty{\faEnvelopeO\abcvHeaderIconSep}\href{mailto:\@email}{\abcvHeaderItemSty{\@email}}} %\\[0pt]\testline
        \abcvHeaderItemSty{$\;\bullet\;$} {\abcvHeaderItemSty{\faGlobe\abcvHeaderIconSep}\href{\@homepageurl}{\abcvHeaderItemSty{\@homepagetil}}}\\[0pt]\testline
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
\newcommand{\cvsection}[1]{
    \sectionskip
    {\Large \textsc{\abcvBlue{#1}}}
    \sectionlineskip
    \abcvBlue{\hrule} % Horizontal line
}

\RequirePackage{enumitem}
\setlist[itemize,1]{label=\abcvBlue{\textbullet}}
\setlist[itemize,2]{label=\abcvBlue{$\circ$}}
\newenvironment{cvlist}
{
    \begin{itemize}[topsep=0pt, leftmargin=1.0em, nosep]
}
{
    \end{itemize}
}

\newenvironment{eduitem}[4]
{
    % \textbf{{#1} \hfill {#2}} \\
    % \begin{flushright}
    %    \hfill \textit{#3}-\textit{#4}
    % \end{flushright}
    \def\@eduitem@t{#3}
    \def\@eduitem@f{#4}
    \tabularx{\textwidth}{Xr}%\hline
        \textbf{#1} & \textbf{#2} \\[0pt]%\hline
        \begin{cvlist}
}
{
    \end{cvlist} & \textit{\@eduitem@t}~-~\textit{\@eduitem@f} \\%\hline
    \endtabularx
    % \smallskip
}
