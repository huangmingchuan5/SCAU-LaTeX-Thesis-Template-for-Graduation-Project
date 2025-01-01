% Contributor: Huang Mingchuan
% Email: mingchuanh617@stu.scau.edu.com
% License: LaTeX Project Public License v1.3c

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

\RequirePackage{gbt7714}    %用于生成符合中国国家标准 GB/T 7714-2015 的参考文献样式。
\bibliographystyle{gbt7714-numerical}   %数字顺序制（numerical）
\setlength{\bibsep}{0.0pt}              %文献条目之间的垂直间距为 0
\def\bibfont{\zihao{5}}

% 自定义参考文献标题
\renewcommand{\refname}{%
  \makebox[\textwidth][c]{\heiti \zihao{4} 参\hspace{1em}考\hspace{1em}文\hspace{1em}献} % 每个字之间空1个字距
  \vspace{-2em}
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
\begin{center}
\vspace*{-10pt}
    \zihao{4} \heiti 摘 \qquad \qquad 要 % 标题中间空4个字距

\vspace{8pt}
\end{center}
\addcontentsline{toc}{section}{摘 \quad 要}
\zihao{-4} \ignorespaces\indent  % 添加段首缩进

} { \clearpage }


\newcommand{\keywords}[1]{\newline\newline\newline\noindent\heiti{关键词：}\songti\zihao{-4} #1}



% 英文摘要环境

\newenvironment{abstractEN}{

     \phantomsection
    \noindent\zihao{-4}\textbf{Abstract:} 
  \addcontentsline{toc}{section}{Abstract}
  \zihao{-4}\ignorespaces 
}{\clearpage}

% 英文关键词命令
\newcommand{\keywordsEN}[1]{
  \vspace{1em} % 调整与正文的间距
  \\
  \\
  \\
  \noindent\textbf{Keywords: } #1
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
\titleformat{\section}[block]{\vspace*{-10pt} \zihao{4} \heiti}
{\thesection~~}{0pt}{\vspace{8pt}} % 1

% 二级标题格式
\titleformat{\subsection}{\zihao{-4} \heiti}
{
\thesubsection~~}{0pt}{}  %1.1

% 三级标题格式
\titleformat{\subsubsection}{\zihao{-4} \heiti}
{\thesubsubsection~~}{0pt}{}  %1.1.1

% 四级标题格式
\titleformat{\paragraph}[block]{\zihao{-4} \heiti} % 使用 [block] 模式
{\theparagraph~~}{0pt}{}  % 1.1.1.1

\setcounter{secnumdepth}{4} % 设置标题编号深度为 4（包括 paragraph）




%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%
% 定义目录标题格式
\renewcommand\contentsname{%
  \makebox[\textwidth][c]{\heiti \zihao{4} 目\qquad\qquad 录} % 目录标题居中
}

\titlecontents{section}[0pt]{\bfseries \songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsubsection}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

% 四级标题目录格式
\titlecontents{paragraph}[3\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{} % 四级标题编号与标题之间无空格
{\titlerule*[0.7em]{.}\contentspage}
\setcounter{tocdepth}{4} % 设置目录深度为 4（包括 paragraph）


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

% 定义参考文献环境
\newenvironment{references}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{参考文献} % 添加到目录
    \refname % 调用自定义的参考文献标题
    \vspace{1em} %添加一些垂直间距
}{
    \clearpage
}

\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
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

\newcommand{\infobox}[2]{
    \hspace{2.4cm}\heiti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[8cm][c]{#2}}}}
}
% 定义一个名为 `infobox` 的命令，用于生成带下划线的信息框
% 参数：
% `#1` 信息框的标签（如“学院”、“专业”等）
% `#2` 信息框的内容
% 格式：
% `\hspace{2.4cm}` 左侧缩进 2.4cm
% `\heiti\zihao{-2}\textbf` 设置字体为黑体小二加粗
% `\dunderline{1pt}{\makebox[8cm][c]{#2}}` 在内容下方添加 1pt 的下划线，并将内容居中放在 8cm 的盒子中

\newcommand{\trbox}[2]{
\hspace{2.4cm}\heiti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[3.2cm][c]{#2}}}}
}
\newcommand{\jobbox}[2]{
\hspace{2.4cm}\heiti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[2.8cm][c]{#2}}}}
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




%%%%%%%%%%%%%%%%%%%%%% JavaScript语法高亮支持 %%%%%%%%%%%%%%%%%%%%%%

\usepackage{color}
\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}

\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break, const},
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%附录设定%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义附录格式
\renewcommand{\appendix}{%
  \par
  \setcounter{section}{0} % 重置章节计数器
  \renewcommand{\thesection}{附录\ \Alph{section}} % 附录序号与标题之间空1个字距
  \titleformat{\section}[block] % 设置附录标题格式
    {\vspace*{0pt} \zihao{4} \heiti \centering} % 黑体，四号，居中
    {\thesection}{1em}{} % 序号与标题之间空1个字距
  \titlespacing*{\section}{0pt}{0pt}{0pt} % 段前0行，段后0行
  \setlength{\parskip}{1.5\baselineskip} % 1.5倍行距

  % 定义附录中的图、表、公式编号格式
  \renewcommand{\thefigure}{\Alph{section}\arabic{figure}} % 图编号格式：图A1, 图A2
  \renewcommand{\thetable}{\Alph{section}\arabic{table}} % 表编号格式：表A1, 表A2
  \renewcommand{\theequation}{式\Alph{section}\arabic{equation}} % 公式编号格式：（式A1）, （式A2）
}

  \vspace{-1cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%致谢%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义致谢内容格式
\newenvironment{acknowledgement}{%
  \clearpage\addcontentsline{toc}{section}{致\quad 谢} % 将“致谢”加入目录
  \section*{致~~~~~~~~谢} % 添加致谢标题
  \vspace{1em}
  \setlength{\parindent}{2em} % 首行缩进2字距
  \setstretch{1.5} % 1.5倍行距
  \zihao{-4} % 小四号
  \setstretch{1.5} % 1.5倍行距
  \setlength{\parskip}{2pt} % 段落间距为 0


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