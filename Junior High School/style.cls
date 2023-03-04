\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[templates]

\LoadClass[11pt]{book}
\usepackage[fontset=ubuntu]{ctex}
% \usepackage{xeCJK}
\usepackage[bodytextleadingratio=1.5,restoremathleading=true]{zhlineskip}
\usepackage{geometry}
\geometry{
    papersize = {182mm, 257mm},
    inner = 22mm, outer = 18mm,
    % left = 20mm, right = 20mm,
    top = 16mm, bottom = 20mm
}

\usepackage{graphbox}
\usepackage{xcolor}
\usepackage{pifont}
\usepackage{packages/sidefig}

% \usepackage{showframe}

%%%%%%%%%%%%
%% 字体配置

% \xeCJKDeclareSubCJKBlock{Punct}{
%   `，, `。, `：, `；, `、, `？, `！,
%   `‘, `’, `“, `”, `（, `）, `《, `》, `〈, `〉,
%   `—, `…, `·,
% }

% \newCJKfontfamily\heisong[NFSSFamily=heisong,Punct=SimSun]{SimHei}
% ,Punct=Kai

\usepackage[T1]{fontenc}


\setmainfont{TeX Gyre Termes}
\newfontfamily\Serif{TeX Gyre Termes}

% local
% \newCJKfontfamily\Kai{FandolKai}
% \newCJKfontfamily\Hei{FandolHei}
% \newCJKfontfamily\Song{Noto Serif CJK SC}

% upload
\setCJKmainfont[Path="../fonts/"]{FZNewShuSong-Z10S.ttf}
\setCJKfamilyfont{FZHei}[Path="../fonts/"]{FZHei-B01S.ttf}
\setCJKfamilyfont{FZShuSong}[Path="../fonts/"]{FZNewShuSong-Z10S.ttf}
\setCJKfamilyfont{FZXBSong}[Path="../fonts/"]{FZXiaoBiaoSong-B05S.ttf}
\newcommand{\Hei}{\CJKfamily{FZHei}}
\newcommand{\Song}{\CJKfamily{FZShuSong}}
\newcommand{\XBSong}{\CJKfamily{FZXBSong}}
\newCJKfontfamily\Kai{FandolKai}


\newcommand{\annotation}{\Kai}
\newcommand{\hint}[1]{{\Kai (#1)}}

% \catcode`“=\active
% \protected\def “{{\Serif\char`“}}
% \catcode`”=\active
% \protected\def ”{{\Serif\char`”}}
\catcode`“=\active
\protected\def “{\char```}
\catcode`”=\active
\protected\def ”{\char`"}
\catcode`’=\active
\protected\def ’{{\Serif\char`\'}}
% \catcode`—=\active
% \protected\def —{{\Serif\char`\—}}


\usepackage{setspace}
% \setlength{\parskip}{0.2em}


%%%%%%%%%%%%%%%%%%%%%%%%%
%% 章节格式与项目定义

\usepackage{titlesec, titletoc}
\usepackage[shortlabels]{enumitem}
% 设置各级文本格式
\setcounter{secnumdepth}{3}
\titleformat{\chapter}{\zihao {5}}{}{0em}{}
\titleformat{\section}{\zihao{4}\Hei\centering}{
    第\Roman{section}卷\quad
}{0em}{}
\titleformat{\subsection}{\zihao{5}\Hei}{
    第{\chinese{subsection}}部分\quad
}{0em}{}
\titleformat{\subsubsection}{\zihao{5}\Hei}{
    第{\chinese{subsubsection}}节\quad
}{0em}{}
% \titleformat{\subsection}{\linespread{1}}{第{\bf\chinese{subsection}}部分~~}{0em}{\zihao{5}\linespread{1}}{}
\titlespacing*{\chapter}{0mm}{-5mm}{-10mm}
\titlespacing*{\section}{0em}{1.25em}{0.5em}
\titlespacing*{\subsection}{0em}{0.5em}{0.25em}
\titlespacing*{\subsubsection}{0em}{0.1em}{0.1em}
% 设置各级文本的编号格式
\setlist{itemsep=0.2em,topsep=0.25em,partopsep=0pt,parsep=0pt}
\setenumerate[1]{label=(\hspace{1.25em})~\arabic*.,leftmargin=3.5em,itemindent=0em,labelsep=0.25em,}
% \setenumerate[2]{label=(\arabic*),leftmargin=1.3em,itemindent=0em,labelsep=0.25em,}
% \setenumerate[3]{label=(\alph*),leftmargin=1.2em,itemindent=0em,labelsep=0.25em,}

% 并排

\usepackage{framed}


%%%%%%%%%%%%%%%%%%%%%%
%% 页码、页眉页脚设置

\usepackage{lastpage} % 页码
\usepackage{fancyhdr} % 设置页眉页脚

\fancypagestyle{plain}{\pagestyle{fancy}}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[CE,CO]{\small{
    英语试卷~第~\thepage~页（共 \pageref{LastPage} 页）
}}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\headrulewidth}{0mm} % 页眉线宽，设置为 0 时去页眉线

\usepackage{tasks}

%%%%%%%%%%%%%%%%%%%%%%
%% 引用信息配置

\usepackage{cleveref}
\crefname{enumi}{}{}
% \crefdefaultlabelformat{~#1~}
\lineskiplimit=12pt
\lineskip=6pt


%%%%%%%%%%%%%%%%%%%%%%
%% 试卷标题配置

\newcommand{\headLine}[4]{
    {\noindent
        % \bf {绝密$\bigstar$启用前 }
        \vspace*{-0.5em}}
    \begin{center}
        \zihao{3}#1年#2 \\
        \vspace*{0.25em}
        \makebox[4em][s]{\zihao{-2}{\XBSong #3}}{\zihao{4}#4}
        \vspace*{0.75em}
    \end{center}
}


%%%%%%%%%%%%%%%%%%%%%%
%% 选择题选项自动排版

\usepackage{hlist}
\usepackage{ifthen}

\newlength{\lengthX}
\newlength{\lengthY}
\newlength{\lengthZ}
\newlength{\lengthThird}
\newlength{\lengthMaxi}

\newcommand{\option}[3]{
    \setlength{\lengthThird}{0.31\linewidth}
    \settowidth{\lengthX}{A.#1}	\settowidth{\lengthY}{B.#2} \settowidth{\lengthZ}{C.#3}

    \ifthenelse{\lengthtest{\lengthX > \lengthY}} {
        \setlength{\lengthMaxi}{\lengthX}
    }{
        \setlength{\lengthMaxi}{\lengthY}
    }
    \ifthenelse{\lengthtest{\lengthMaxi < \lengthZ}} {
        \setlength{\lengthMaxi}{\lengthZ}
    }{}
    \ifthenelse{\lengthtest{\lengthMaxi > \lengthThird}} {
        \begin{hlist}[\parskip=0pt,pre skip=0pt,post skip=0pt,item skip=0pt,item offset={1.15em}, label=\Alpha {hlisti}.,pre label={}]1
            \hitem #1
            \hitem #2
            \hitem #3
        \end{hlist}
    }{
        \begin{hlist}[\parskip=0pt,pre skip=0pt,post skip=0pt,item skip=0pt,item offset={1.15em}, label=\Alpha {hlisti}.,pre label={}]3
            \hitem #1
            \hitem #2
            \hitem #3
        \end{hlist}
    }
}

\newlength{\lengthA}
\newlength{\lengthB}
\newlength{\lengthC}
\newlength{\lengthD}
\newlength{\lengthHalf}
\newlength{\lengthQuarter}
\newlength{\lengthMax}

\newcommand{\options}[4]{
    \setlength{\lengthHalf}{0.42\linewidth}	\setlength{\lengthQuarter}{0.21\linewidth}
    \settowidth{\lengthA}{A.#1}	\settowidth{\lengthB}{B.#2} \settowidth{\lengthC}{C.#3} \settowidth{\lengthD}{D.#4}

    \ifthenelse{\lengthtest{\lengthA > \lengthB}} {
        \setlength{\lengthMax}{\lengthA}
    }{
        \setlength{\lengthMax}{\lengthB}
    }
    \ifthenelse{\lengthtest{\lengthMax < \lengthC}} {
        \setlength{\lengthMax}{\lengthC}
    }{}
    \ifthenelse{\lengthtest{\lengthMax < \lengthD}} {
        \setlength{\lengthMax}{\lengthD}
    }{}
    \ifthenelse{\lengthtest{\lengthMax > \lengthHalf}} {
        \begin{hlist}[\parskip=0pt,pre skip=0pt,post skip=0pt,item skip=0pt,item offset={1.15em}, label=\Alpha {hlisti}.,pre label={}]1
            \hitem #1
            \hitem #2
            \hitem #3
            \hitem #4
        \end{hlist}
    }{
        \ifthenelse{\lengthtest{\lengthMax > \lengthQuarter}} {
            \begin{hlist}[\parskip=0pt,pre skip=0pt,post skip=0pt,item skip=0pt,item offset={1.15em}, label=\Alpha {hlisti}.,pre label={}]2
                \hitem #1
                \hitem #2
                \hitem #3
                \hitem #4
            \end{hlist}
        }{
            \begin{hlist}[\parskip=0pt,pre skip=0pt,post skip=0pt,item skip=0pt,item offset={1.15em}, label=\Alpha {hlisti}.,pre label={}]4
                \hitem #1
                \hitem #2
                \hitem #3
                \hitem #4
            \end{hlist}
        }
    }
}


%%%%%%%%%%%%%%%%%%%%%%
%% 题目括号与填空配置

\usepackage{ulem}

\newif\ifshowAnswer
\newcommand{\showAnswer}[1]{\ifthenelse{\isodd{#1}}{\showAnswertrue}{}}

\newcommand{\opt}[1]{
    \ifshowAnswer
        { \nolinebreak\hfill\mbox{\upshape(\makebox[1cm][c]{\textcolor{red}{#1}}) }}
    \else
        { \nolinebreak\hfill\mbox{\upshape(\makebox[1.2cm][r])} }
    \fi
}

\newcommand{\blank}[1][0.8]{\uline{\makebox[#1cm][c]{}}}

\newcommand{\wordform}[2][2]{\uline{\makebox[#1cm][c]{
    \ifshowAnswer
        \textcolor{red}{#2}
    \else
        \phantom{#2}
    \fi
}}}

\newcommand{\cloze}[1]{
    \uline{ \makebox[2.5em][c]{#1} }
}

\newcommand{\scores}[1]{
    {\Hei（本小题满分#1分）}
}

\newcommand{\score}[1]{
    {\Kai（#1分）}
}

\newcommand{\dialogue}[2]{
    —~#1 \newline
    —~#2
}

\newcommand{\Choices}[1]{选择题\quad(共#1分)}
\newcommand{\Written}[1]{非选择题 (共#1分)}
\newcommand{\ReadingSection}[1]{\centerline {\textbf{#1}}}
\newcommand{\Directions}[1]{\par{\Song #1}}
\newcommand{\Scores}[2]{ (共#1小题；每小题#2分，共 \the\numexpr #1 * #2 \relax 分) }
\newcommand{\wordclass}[1]{~{\it #1}.}

% \newcommand{\hlines}{
%     % \noindent \uline{\hfill} \par
% \newcounter{themenumber}  
% \forloop{themenumber}{1}{\value{themenumber} < 2}{x\\ \hline}   
% }
\usepackage{pgffor}

\def\hlines#1{
  \foreach \index in {1, ..., #1} {
    \noindent \uline{\hfill} \par
  }
}

\newcounter{countercompletion}[enumi]
\newcommand{\completion}[2][2]{
    \refstepcounter{enumi}{\theenumi.}\uline{\makebox[#1cm][c]{
        \ifshowAnswer
            \textcolor{red}{#2}
        \else
            \phantom{#2}
        \fi
    }}
}
