% Contributor: 残橘子
% Email: mingchuanh617@stu.scau.edu.com
% License: LaTeX Project Public License v1.3c
%Github 地址: https://github.com/huangmingchuan5/SCAU-LaTeX-Thesis-Template-for-Graduation-Project.git


\ProvidesClass{SCAU}[2021/02/23 v0.1 Thesis Class of SCAU]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\SetupKeyvalOptions{family=CUC, prefix=CUC@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{CUC}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% 设置纸张格式
\RequirePackage[
  a4paper,
  left=2.4cm,right=2.4cm,top=2.4cm,bottom=2.4cm,%页面设置：页边距上下左右各用2.4cm。
  headsep=0.3cm]{geometry}
\setlength{\headsep}{0.6cm}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo,array,hyperref}

% 设置目录与引用的超链接（需要编译多次）
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times New Roman}       %西文字体默认


% 1.5倍行距
\linespread{1.5}

% 段落缩进2字符
\setlength\parindent{2\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[authoryear]{natbib}
\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-author-year}

% 【关键修正】
% 1. （） : 强制使用中文全角括号
% 2. {,~} : 第5个参数是“作者”和“年份”之间的标点。我们显式设置为“逗号+空格”，
%           确保无论如何都会显示为 "(Author, 2020)"
\bibpunct{（}{）}{;}{a}{,~}{}

% 【清除旧的错误设置】
% 请务必确认这里不再包含任何 \renewcommand\NAT@spacechar{} 的代码！
% 之前的该代码导致了逗号后空格消失。

% 其他格式保持
\let\cite\citep
\setlength{\bibsep}{0pt}
\def\bibfont{\songti\zihao{-4}}
\setlength{\bibhang}{2\ccwd}

% 自定义参考文献标题
\renewcommand{\refname}{%
  \makebox[\textwidth][c]{\heiti \zihao{4} 参\hspace{1em}考\hspace{1em}文\hspace{1em}献} % 黑体、四号字，每个字之间空1个字符
  \vspace{-0.7cm} % 段后间距为0行
}
\renewcommand\figurename{图}
\renewcommand\tablename{表}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace}
\captionsetup[figure]{skip=8pt,labelsep=onespace}

\renewcommand{\captionfont}{\songti\zihao{5}}

\usepackage{booktabs} % 用于美化表格
\usepackage{float} % 用于控制表格位置
% 设置表注格式
\newcommand{\tablesource}[1]{%
  \vspace{4pt} % 表题与表注之间的间距
  \parbox{\linewidth}{\songti\zihao{-5}\linespread{1.5}\selectfont #1} % 表注字体为宋体，小五号，1.5倍行距
}
% 新增：表格内强制单倍行距
\AtBeginEnvironment{tabular}{\linespread{1}\selectfont}
\AtBeginEnvironment{longtable}{\linespread{1}\selectfont} % 如果使用了跨页表格

% 设置图题格式
\renewcommand{\figurename}{图} % 图编号前缀
\DeclareCaptionLabelSeparator{onespace}{~~} % 图号与图题之间空1个字距
% 设置图题格式
\captionsetup[figure]{
  labelsep=onespace, % 使用自定义分隔符 onespace
  font=small, % 图题字体为小号
  justification=centering % 图题居中
}

% 设置图注格式
\newcommand{\figsource}[1]{%
  \vspace{4pt} % 图题与图注之间的间距
  \parbox{\linewidth}{\songti\zihao{-5}\linespread{1.5}\selectfont #1} % 图注字体为宋体，小五号，1.5倍行距
}


% 设置插图与正文之间的间距
\setlength{\intextsep}{12pt} % 插图与正文之间上下各空一行


%%%%%%%%%%%%%%%%%%%%%% code style %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    frame=single,
}

\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%%原创声明 %%%%%%%%%%%%%%%%%%%%%%
%声明authorization
\newenvironment{authorization}{
\setlength{\parindent}{2\ccwd}  % 设置段首缩进为 2 个中文字符宽度

\thispagestyle{empty} % 本页不显示页码
\addtocounter{page}{-1} % 将页码计数器减 1


    \begin{center}
        \textbf{\Large 华南农业大学本科毕业论文（设计）原创性声明}
    \end{center}
  
    本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。

    \vspace{1cm}
    \noindent

    作者签名： \hfill 日期： \underline{\hspace{2cm}} 年 \underline{\hspace{1cm}} 月 \underline{\hspace{1cm}} 日 \hfill

    \vspace{5cm}

    \begin{center}
        \textbf{\Large 华南农业大学本科毕业论文（设计）使用授权声明}
    \end{center}
    \setlength{\parindent}{2\ccwd}  % 设置段首缩进为 2 个中文字符宽度

    本人完全了解学校有关保留、使用毕业论文（设计）的规定，同意学校保留并向国家有关部门或机构送交毕业论文（设计）的复印件和电子版，允许毕业论文（设计）被查阅和借阅。学校可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编毕业论文（设计）。

    \vspace{1cm}

    \noindent
    作者签名： \hspace{6.8cm}  指导教师签名：\\
    日期： \underline{\hspace{2cm}} 年 \underline{\hspace{1cm}} 月 \underline{\hspace{1cm}} 日 \hfill 日期： \underline{\hspace{2cm}} 年 \underline{\hspace{1cm}} 月 \underline{\hspace{1cm}} 日
}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 中文摘要命令
\renewenvironment{abstract} {
\clearpage \phantomsection
\thispagestyle{empty} % 不显示页码
\begin{center}
    \zihao{4} \heiti 摘 \qquad \qquad 要 % 标题中间空4个字距

\vspace{8pt}
\end{center}
% \addcontentsline{toc}{section}{摘 \quad 要} % 不添加到目录
\zihao{-4} \ignorespaces\indent  % 添加段首缩进

} { \clearpage }


\newcommand{\keywords}[1]{\newline\newline\newline\noindent\heiti{关键词：}\songti\zihao{-4} #1}



% 英文摘要环境
\newenvironment{abstractEN}[3]{%
    \clearpage
    \phantomsection
    \thispagestyle{empty} % 不显示页码
    % \addcontentsline{toc}{section}{Abstract} % 不添加到目录
    \begin{center}
        {\textbf{\large #1}} \\[1ex]
        #2 \\[1ex]
        (College of Science, South China Agricultural University, Guangzhou 510642, China)
    \end{center}
    \noindent\textbf{Abstract:} #3%
}

% 英文关键词命令
\newcommand{\keywordsEN}[1]{%
    \par\vspace{1cm} % 使用 \par 确保前一个段落结束，再加空距
    \noindent\textbf{Key words: } #1%
    \clearpage % 在关键词之后换页
}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{setspace,titlesec,zhnumber,titletoc}

% 修改章节编号格式
\renewcommand{\thesection}{\arabic{section}} % 一级标题：1, 2, 3
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}} % 二级标题：1.1, 1.2
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}} % 三级标题：1.1.1, 1.1.2
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}} % 四级标题：1.1.1.1, 1.1.1.2

\newcommand{\sectionbreak}{\clearpage} % 每章节清页面


% 一级标题格式
% 修改点：将原来的 {\thesection~~}{0pt} 改为 {\thesection}{\ccwd}
% \ccwd 代表一个当前汉字的宽度，保证间距固定
\titleformat{\section}[block]{\zihao{4} \heiti}
{\thesection}{\ccwd}{\vspace{0pt}} 

% 二级标题格式
\titleformat{\subsection}{\zihao{-4} \heiti}
{\thesubsection}{\ccwd}{}

% 三级标题格式：改为楷体
\titleformat{\subsubsection}{\zihao{-4} \kaishu}
{\thesubsubsection}{\ccwd}{}

% 四级标题格式：改为楷体
\titleformat{\paragraph}[block]{\zihao{-4} \kaishu}
{\theparagraph~~}{0pt}{}

\setcounter{secnumdepth}{4} % 设置标题编号深度为 4（包括 paragraph）



%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%
% 定义目录标题格式
\renewcommand\contentsname{%
  \vspace*{-1.8cm}
  \makebox[\textwidth][c]{\heiti \zihao{4} 目\qquad\qquad 录} % 修改：改为四号字
  \vspace{18pt}
}

\titlecontents{section}[0pt]{\songti \zihao{-4}\linespread{1.5}\selectfont}
{\thecontentslabel\hspace{0.5em}}{}%
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[0pt]{\songti \zihao{-4}\linespread{1.5}\selectfont}
{\thecontentslabel\hspace{0.5em}}{}%
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsubsection}[0pt]{\songti \zihao{-4}\linespread{1.5}\selectfont}
{\thecontentslabel\hspace{0.5em}}{}%
{\titlerule*[0.7em]{.}\contentspage}

\setcounter{tocdepth}{3} % 设置目录深度为 3（不显示 paragraph）


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{参考文献} % 添加到目录
    \vspace{-0.5cm} % 向上移动1.5cm（调整上方间距）
    \refname % 调用自定义的参考文献标题
    \vspace{0cm} % 标题和文献列表之间的间距
    \setstretch{1.5} % 1.5倍行距
}{
    \clearpage
}

\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{-10pt}
}


\newcommand{\contentpage}{
  \begin{spacing}{1.5}
    \tableofcontents
  \end{spacing}

  \clearpage


  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\nonumsection}[1]{
  \phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}





%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  % 将内容 #3 放入一个盒子中
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
  % 使用 `\ooalign` 在内容下方绘制一条线：
  % `\copy0` 复制盒子中的内容
  % `\rule` 绘制一条水平线，线的位置由 `#1` 和 `#2` 控制，宽度为盒子的宽度
}}
% 定义一个名为 `dunderline` 的命令，用于在文本下方添加下划线
% 参数：
% `#1` 可选参数，默认值为 -6pt，控制下划线的垂直位置
% `#2` 必选参数，控制下划线的粗细
% `#3` 必选参数，需要添加下划线的文本

% 修改：将字体改为宋体(\songti)和小三号(\zihao{-3})
\newcommand{\infobox}[2]{
    \hspace{2.4cm}\songti\zihao{-3}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[8cm][c]{#2}}}}
}

\newcommand{\trbox}[2]{
    \hspace{2.4cm}\songti\zihao{-3}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[3.2cm][c]{#2}}}}
}
\newcommand{\jobbox}[2]{
    \hspace{2.4cm}\songti\zihao{-3}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[2.8cm][c]{#2}}}}
}

\newcommand{\coverpage}{
  \begin{titlepage}
    \vspace*{-10pt}
    % 向上移动 10pt，调整页面顶部间距
  
    \vspace*{2\ccwd}
    % 添加 2 个汉字宽度的垂直间距
  
    \centering
    \includegraphics{SCAU.png}
    % 插入校徽图片，文件名为 `SCAU.png`
    \quad \quad \quad
    % 添加一些水平间距
    
    \centering
    \zihao{-0}\textbf{\songti{本科毕业论文}}
    % 设置标题为“本科毕业论文”，字体为小初号宋体加粗
    \vspace{1cm}
    % 添加 0.6cm 的垂直间距
  
    \zihao{2}\textbf{\heiti\thesisTitle}
    % 设置论文标题，字体为二号黑体加粗
    \vspace{4.5cm}
    % 添加 2.5cm 的垂直间距
  
     \flushleft  %左对齐
         \begin{spacing}{1.5}
  
 % 设置行距为 1.5 倍
        \infobox{ \zihao{-3}\songti{学\hphantom{空白}院:}}{\yourDept}
        % 生成“学院”信息框，内容为 `\yourDept`
  
        \infobox{ \zihao{-3}\songti{专\hphantom{空白}业:}}{\yourMajor}
        % 生成“专业”信息框，内容为 `\yourMajor`
    
        \infobox{ \zihao{-3}\songti{姓\hphantom{空白}名:}}{\yourName}
        % 生成“姓名”信息框，内容为 `\yourName`
        
        \infobox{ \zihao{-3}\songti{学\hphantom{空白}号:}}{\studentID}
        % 生成“学号”信息框，内容为 `\studentID`

    \makebox[0.45\textwidth][l]{\trbox{\zihao{-3}\songti{指导教师:}}{\yourMentor}}\hspace{-1.2cm}
    \makebox[0.45\textwidth][l]{\jobbox{\zihao{-3}\songti{职称:}}{\yourjob}}
        % 生成“职称”信息框，内容为 `\yourjob`
        % 生成“指导教师”信息框，内容为 `\yourMentor`

   \infobox{ \zihao{-3}\songti{提交日期:}}{\Date}
        % 生成“提交日期”信息框，内容为 `\Date`
    \end{spacing}
  
    \vspace{3cm}
    % 添加 3cm 的垂直间距


  \end{titlepage}
  
  \pagestyle{CUCThesisMain}
  % 设置页面样式为 `CUCThesisMain`
  \pagenumbering{Roman}
  % 设置页码格式为大写罗马数字
  \setcounter{page}{1}
  % 重置页码计数器，从 1 开始编号
}
% 定义一个名为 `coverpage` 的命令，用于生成论文封面


%%%%%%%%%%%%%%%%%%%%%% 编程语言语法高亮支持 %%%%%%%%%%%%%%%%%%%%%%

\usepackage{color}
\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}
\definecolor{orange}{rgb}{0.9, 0.4, 0.0}

% ====================== JavaScript ======================
\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, switch, var, if, in, while, do, else, case, break, const},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this, async},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}

% ====================== Python ======================
\lstdefinelanguage{Python}{
  keywords={and, as, assert, break, class, continue, def, del, elif, else, except, False, finally, for, from, global, if, import, in, is, lambda, None, nonlocal, not, or, pass, raise, return, True, try, while, with, yield},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={self, print, range, len, input, int, str, list, dict, set, tuple},
  ndkeywordstyle=\color{orange}\bfseries,
  identifierstyle=\color{black},
  sensitive=true,
  comment=[l]{\#},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]",
  morestring=[b]'
}

% ====================== C ======================
\lstdefinelanguage{C}{
  keywords={auto, break, case, char, const, continue, default, do, double, else, enum, extern, float, for, goto, if, inline, int, long, register, restrict, return, short, signed, sizeof, static, struct, switch, typedef, union, unsigned, void, volatile, while, _Alignas, _Alignof, _Atomic, _Bool, _Complex, _Generic, _Imaginary, _Noreturn, _Static_assert, _Thread_local},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={printf, scanf, main, include, define, malloc, free, NULL},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=true,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]",
  morestring=[b]'
}

% ====================== C++ ======================
\lstdefinelanguage{C++}{
  keywords={alignas, alignof, and, and_eq, asm, atomic_cancel, atomic_commit, atomic_noexcept, auto, bitand, bitor, bool, break, case, catch, char, char8_t, char16_t, char32_t, class, co_await, co_return, co_yield, complex, const, const_cast, constexpr, consteval, consexpr, continue, decltype, default, delete, do, double, dynamic_cast, else, enum, explicit, export, extern, false, float, for, friend, goto, if, import, inline, int, long, module, mutable, namespace, new, noexcept, not, not_eq, nullptr, operator, or, or_eq, private, protected, public, ref, register, reinterpret_cast, requires, return, short, signed, sizeof, static, static_assert, static_cast, struct, switch, synchronized, template, this, thread_local, throw, true, try, typeid, typename, union, unsigned, using, virtual, void, volatile, wchar_t, while, xor, xor_eq},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={std, string, vector, map, cout, cin, endl, namespace, include, define},
  ndkeywordstyle=\color{orange}\bfseries,
  identifierstyle=\color{black},
  sensitive=true,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]",
  morestring=[b]'
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%附录设定%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义附录格式
\RequirePackage{hyperref}
\renewcommand{\appendix}{%
  \par
  \setcounter{section}{0} % 重置章节计数器

  % 设置附录的目录深度为 1（只显示附录主标题，不显示 subsection 及以下级别）
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}

  % 定义附录专用的超链接目标格式
  \renewcommand{\theHsection}{appendix.\arabic{section}}

  % 只修改一级标题的格式
  \renewcommand{\thesection}{附录\ \Alph{section}}

  % 子标题保持原有的数字格式
  \renewcommand{\thesubsection}{\arabic{subsection}}
  \renewcommand{\thesubsubsection}{\arabic{subsection}.\arabic{subsubsection}}
  \renewcommand{\theparagraph}{\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}

  % 为每个附录节添加超链接锚点
  \titleformat{\section}[block]
    {\clearpage\phantomsection
     \zihao{4}\heiti\centering}
    {\thesection}{1em}{}

\titlespacing*{\section}{0pt}{-0.3cm}{12pt}
  % 重置各类计数器
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{equation}{0}

% 修改图表公式编号格式 (去除中间的连字符 - )
  \renewcommand{\thefigure}{\Alph{section}\arabic{figure}}   % 输出格式：图A1
  \renewcommand{\thetable}{\Alph{section}\arabic{table}}     % 输出格式：表A1
  \renewcommand{\theequation}{\Alph{section}\arabic{equation}} % 输出格式：式A1

}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%致谢%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义致谢内容格式
\newenvironment{acknowledgement}{%
  \clearpage\addcontentsline{toc}{section}{致谢}
  \section*{致\hspace{4\ccwd}谢} % 修改：中间空4个字距
  \vspace{0.5em}
  \setlength{\parindent}{2em}
  \setstretch{1.5}
  \zihao{-4}
  \setlength{\parskip}{2pt}
}{%
  \par
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%脚注%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{ragged2e}
% 设置脚注格式
\usepackage{footmisc}
\renewcommand{\footnotelayout}{%
  \fontsize{9}{1}\selectfont % 小五号字体，行距为 11pt（单倍行距）
  \setlength{\parindent}{0pt} % 无缩进
  \setlength{\parskip}{0pt} % 段前0行，段后0行
  \justifying % 两端对齐
}

% 确保脚注全文连续编号
\setcounter{footnote}{0} % 重置脚注计数器