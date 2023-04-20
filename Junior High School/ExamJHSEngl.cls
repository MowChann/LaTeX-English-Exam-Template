% ---------------------------- %
%         ExamJHSEngl          %
%                              %
%  @author:   zhangpeng96      %
%  @date:     2023/04/20       %
%  @version:  v0.5.2           %
% ---------------------------- %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExamJHSEngl}[templates]

\LoadClass[11pt]{book}
\usepackage[fontset=ubuntu]{ctex}
\usepackage[bodytextleadingratio=1.5,restoremathleading=true]{zhlineskip}
\usepackage{geometry}
\geometry{
    papersize = {182mm, 257mm},
    % inner = 22mm, outer = 18mm,
    left = 20mm, right = 20mm,
    top = 16mm, bottom = 20mm
}


% ----- 功能调试 -----

%% 显示框线
% \usepackage{showframe}


% ----- 预留功能 -----
% \usepackage{graphbox} 


% ----- 行距、框线以及颜色 -----
\usepackage{framed}
\usepackage{xcolor}
\usepackage{setspace}


% ----- 字体配置 -----
\usepackage[T1]{fontenc}
\setmainfont{TeX Gyre Termes}
\newfontfamily\Serif{TeX Gyre Termes}


% Overleaf 字体
\newCJKfontfamily\Kai{FandolKai}
\newCJKfontfamily\Hei{FandolHei}
% 上传 GBK 字体
\setCJKmainfont[Path="fonts/"]{FZNewShuSong-Z10S.ttf}
\setCJKfamilyfont{FZShuSong}[Path="fonts/"]{FZNewShuSong-Z10S.ttf}
\setCJKfamilyfont{FZXBSong}[Path="fonts/"]{FZXiaoBiaoSong-B05S.ttf}
\newcommand{\XBSong}{\CJKfamily{FZXBSong}}
\newcommand{\Song}{\CJKfamily{FZShuSong}}

%% 指定某些标点符号不使用 GBK 字体
\catcode`“=\active
\protected\def “{\char```}
\catcode`”=\active
\protected\def ”{\char`" }
\catcode`’=\active
\protected\def ’{{\Serif\char`\'}}
\catcode`《=\active
\protected\def 《{{\Hei\char`\《}}
\catcode`》=\active
\protected\def 》{{\Hei\char`\》}}

%% 修正圆圈序号字体不匹配而无法显示的错误
\usepackage{pifont}
\xeCJKDeclareCharClass{CJK}{%
  "24EA,        % ⓪
  "2460->"2473, % ①–⑳
  "3251->"32BF, % ㉑–㊿
  "24FF,        % ⓿
  "2776->"277F, % ❶–❿
  "24EB->"24F4  % ⓫–⓴
}


% ----- 章节与项目格式 -----

\usepackage{titlesec, titletoc}
\usepackage[shortlabels]{enumitem}

%% 设置各级文本格式
\setcounter{secnumdepth}{3}
\titleformat{\chapter}{\zihao{5}}{}{0em}{}
\titleformat{\section}{\zihao{4}\Hei\centering}{
    第\Roman{section}卷\quad
}{0em}{}
\titleformat{\subsection}{\linespread{1}\zihao{5}\Hei}{
    第{\chinese{subsection}}部分\,
}{0em}{}
\titleformat{\subsubsection}{\zihao{5}\Hei}{
    第{\chinese{subsubsection}}节\,
}{0em}{}
\titlespacing*{\chapter}{0mm}{-5mm}{-10mm}
\titlespacing*{\section}{0em}{1.25em}{0.5em}
\titlespacing*{\subsection}{-0.4em}{0.5em}{0.25em}
\titlespacing*{\subsubsection}{-0.4em}{0.1em}{0.1em}

%% 设置各级文本的编号格式
\setlist{itemsep=0.2em,topsep=0.25em,partopsep=0pt,parsep=0pt}
\setlist[itemize]{leftmargin=0.4em,itemindent=0.3em,itemsep=0em,topsep=0em,partopsep=0pt,parsep=0pt}
\setenumerate[1]{label=\arabic*.,leftmargin=3.75em,itemindent=0em,labelsep=0.2em,ref={\arabic*}}


% ----- 对齐、浮动与并排 -----

%% 横向并排布局
\usepackage{tasks}
\settasks{
    label=(\arabic*),
    item-indent={1em},
    label-width=1.5em,
    label-offset=0pt
}

%% 页面垂直顶端分布
\raggedbottom

%% 图片右侧浮动显示（可用于 enumerate 环境下）
% \usepackage{packages/sidefig}
% \usepackage{float}

%% 修正元素间距过大问题
% \usepackage{setspace}
% \setlength{\parskip}{0.2em}

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
    \settowidth{\lengthX}{A.#1} \settowidth{\lengthY}{B.#2} \settowidth{\lengthZ}{C.#3}

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
    \setlength{\lengthHalf}{0.44\linewidth} \setlength{\lengthQuarter}{0.22\linewidth}
    \settowidth{\lengthA}{A.#1} \settowidth{\lengthB}{B.#2} \settowidth{\lengthC}{C.#3} \settowidth{\lengthD}{D.#4}

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


% ----- 页码、页眉与页脚 -----

\usepackage{lastpage} % 页码
\usepackage{fancyhdr} % 设置页眉页脚

\fancypagestyle{plain}{\pagestyle{fancy}}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[CE,CO]{\small{
    英语试卷~第~\thepage~页（共 \pageref{LastPage} 页）
}}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\headrulewidth}{0mm} % 页眉线宽，设置为 0 时不显示页眉线


% ----- 图表及题号引用 -----

\usepackage{caption}
\captionsetup[figure]{name={Fig.},labelsep=space} 
\captionsetup{font=small}
\setlength{\abovecaptionskip}{0.05ex}

\usepackage{cleveref}
\crefname{enumi}{}{}
\crefdefaultlabelformat{\Figure.1}
\lineskiplimit=12pt
\lineskip=6pt
\captionsetup[figure]{skip=6pt}


% ----- 试卷总标题 -----

\newcommand{\headLine}[4]{
    \vspace*{-4em}
    \begin{center}
        \zihao{3} #1#2 \\
        \vspace*{0.25em}
        \makebox[4em][s]{\zihao{-2}{\XBSong #3}} \\
        \zihao{4} #4
        \vspace*{0.75em}
    \end{center}
}

\newcommand{\headLineSecret}[4]{
    \vspace*{-5em}
    \begin{flushleft}
        {\Hei 绝密$\bigstar$启用前 }    
    \end{flushleft}
    \vspace{-1em}
    \begin{center}
        \zihao{3} #1#2 \\
        \vspace*{0.25em}
        \makebox[4em][s]{\zihao{-2}{\XBSong #3}} \\
        \zihao{4} #4
        \vspace*{0.75em}
    \end{center}
}


% ----- 题目括号、填空 -----

\usepackage{ulem}

\newif\ifshowAnswer
\newcommand{\showAnswer}[1]{\ifthenelse{\isodd{#1}}{\showAnswertrue}{}}

\newcommand{\annotation}{\Kai}
\newcommand{\hint}[1]{{\Kai (#1)}}
\newcommand{\wordclass}[1]{~{\it #1}.}
\newcommand{\blank}[1][0.8]{\uline{\makebox[#1cm][c]{}}}
\newcommand{\score}[1]{{\Kai（#1分）}}
\newcommand{\scores}[1]{{\Hei（本小题满分#1分）}}
\renewcommand{\emph}[1]{\textbf{\underline{#1}}}

\usepackage{pgffor}
\newcounter{orders}
\def\hlines#1{
  \foreach \index in {1, ..., #1} {
    \noindent \uline{\hfill} \par
  }
}
\newcommand{\uliner}[1]{
    \textcolor{red}{\uline{#1}}
}
\newcommand{\countercontinue}{\setcounter{orders}{\arabic{enumi}}}
\newcommand{\cloze}[1][0.9]{
    \uline{\makebox[#1cm][c]{\arabic{orders}}}
    \addtocounter{orders}{1}
}
\newcommand{\choice}[1]{
    \addtocounter{enumi}{1}
    \ifshowAnswer
        (\makebox[1.4em][c]{\textcolor{red}{#1}})~\arabic{enumi}.
    \else
        (\hspace{1.4em})~\arabic{enumi}.
    \fi
}
\newcommand{\wordform}[2][2]{\uline{\makebox[#1cm][c]{
    \ifshowAnswer
        \textcolor{red}{#2}
    \else
        \phantom{#2}
    \fi
}}}
\newcommand{\completionchoices}[7]{
    \begin{minipage}[t]{.8\linewidth}
        \begin{framed}
            \noindent A. #1\\B. #2\\C. #3\\D. #4\\E. #5\\F. #6\\G. #7
        \end{framed}
    \end{minipage}
}

\NewDocumentCommand\completion{ O{2} O{l} m }{
    \addtocounter{enumi}{1}
    \if#2l
    \arabic{enumi}.\uline{\makebox[#1cm][c]{
        \ifshowAnswer
            \textcolor{red}{#3}
        \else
            \phantom{#2}
        \fi
    }}
    \else
    \uline{\makebox[#1cm][c]{
        ~\arabic{enumi}
        \ifshowAnswer
            \textcolor{red}{#3}
        \else
            \phantom{#2}
        \fi
    }}    
    \fi
}
\NewDocumentCommand\dialogue{ o m }{
    \begin{itemize}[
        label=\IfNoValueTF {#1} {}{#1:},
        leftmargin={\labelwidth+\labelsep}]
        \item #2
    \end{itemize}
}

\newenvironment{tightcenter}{
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{
  \end{center}
}


% ----- 题目章节文本与描述 -----

\newcommand{\Scores}[2]{（共#1小题；每小题#2分，共 \fpeval{#1*#2} 分）}
\newcommand{\ScoresText}[3]{（本题包括#1小题，#3，共#2分）}
\newcommand{\Directions}[1]{\par\noindent{\Song #1}}

\newcommand{\Choices}[1]{选择题\quad(共#1分)}
\newcommand{\Written}[1]{非选择题\quad(共#1分)}
\newcommand{\ReadingSection}[1]{\centerline {\textbf{#1}}}
