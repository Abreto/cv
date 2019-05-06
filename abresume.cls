\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abresume}[2010/05/07 v0.1 abResume LaTeX class]

\LoadClass[a4paper,11pt,oneside]{article}
\RequirePackage[left=1in, right=1in, bottom=1.25in, top=1.25in]{geometry}

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements
% \RequirePackage[pdftex, hidelinks]{hyperref}

\RequirePackage{xcolor}
\definecolor{mygray}{gray}{0.6}

% No page numbers
% \pagenumbering{gobble}
\pagestyle{empty} % Suppress page numbers


%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name, email, phone and face
%----------------------------------------------------------------------------------------

\newcommand{\firstname}[1]{\renewcommand{\@firstname}{#1}}
\newcommand{\@firstname}{}
\newcommand{\lastname}[1]{\renewcommand{\@lastname}{#1}}
\newcommand{\@lastname}{}
\newcommand{\fullname}{\@firstname~\textsc{\@lastname}}

\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}} % Defines the \phone command to set phone
\newcommand{\@phone}{} % Sets \@phone to empty by default

\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\@email}{}

\renewcommand{\maketitle}{%
    \begin{center}
        {\LARGE \fullname} \\
        {\small \textcolor{mygray}{\emph{Curriculum Vit\ae}}}
    \end{center}
    % \hrule
    \normalsize
}
