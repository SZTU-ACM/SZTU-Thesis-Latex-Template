%
% 本模版根据深圳技术大学学位论文撰写规范创建
% 论文内容一般应由 9 个主要部分组成，依次为：
% 1.封面；
% 2.学位论文诚信声明；
% 3.目录；
% 4.中文摘要；
% 5.论文正文；
% 6.参考文献；
% 7.致谢。
% 8.英文摘要；
% 9.附录（必要时）；


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SZTUthesis}[2021/03/31 v1.0 Standard LaTeX document class]
\ProcessOptions\relax
%% 读取基类
\LoadClass[a4paper,12pt]{article}
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{SZTUthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi
% 相关宏包 %
% ------------------------------------%
% 支持中文的 ctex 宏包
\RequirePackage[fontset=none]{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{ntheorem}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
% 自定义关键词
\RequirePackage{pgfkeys}
% 设置目录
\RequirePackage{titletoc}
% 设置字体
\RequirePackage{fontenc}
% 设置颜色
\RequirePackage{xcolor}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% 设置标题格式
\RequirePackage{titlesec}
% 超链接 hyperref 的设置
\RequirePackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}           % 设置链接包括引用的颜色
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
% 长表格
\RequirePackage{longtable}
% % 弹性表格
% \RequirePackage{tabularx}
% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
% 首行缩进
\RequirePackage{indentfirst}
% warning: ccaption宏包不能出现在 caption 宏包之后
% % 设置中英文标题
% \RequirePackage{ccaption}
% 设置浮动体的标题
\RequirePackage{caption}
\RequirePackage{subcaption}
% 定制列表环境
\RequirePackage{enumitem}
% 提供\AtBeginEnvironment以方便全局调整一些结构的设置
\RequirePackage{etoolbox}
% 下划线（\underline会执行box逻辑，下划线文字无法换行。ulem的\uline为替代品）
\RequirePackage[normalem]{ulem}
% 动态宽度包，代替minipage
\RequirePackage{varwidth}
% % 尺寸计算
% \RequirePackage{calc}
% 算法编号
\RequirePackage{algorithm}
% 获取总页数
\RequirePackage{lastpage}
% 控制元素编号与章节的关系
\RequirePackage{chngcntr}
% 字符串处理
\RequirePackage{xstring}
% 添加浮动环境
\RequirePackage{float}


% 参考文献格式 GBT7714-2005
% 来自https://github.com/CTeX-org/gbt7714-bibtex-style
% \RequirePackage{natbib} % gbt7714.sty已经包含了natbib宏包
\RequirePackage{gbt7714}

% 处理ctex宏包默认字体warning问题 %
\setCJKmainfont[AutoFakeBold]{SimSun}
\setCJKsansfont[AutoFakeBold]{SimHei}
\setCJKmonofont[AutoFakeBold]{FangSong}

% 页面布局 %
% -------------------------------------------------------%
\geometry{top=25.4mm,bottom=25.4mm,left=31mm,right=31mm}
% 给页眉留足空间（否则会有 \headheight is too small的warning）
\setlength{\headheight}{14.5pt}
% “磅”是衡量印刷字体大小的单位,约等于七十二分之一英寸。
% 而 1英寸＝25.4毫米，则1磅＝25.4/72≈0.353毫米。
% 磅和 LaTeX的 pt- points (大约 1/72 inch) 是一致的。
\renewcommand*{\baselinestretch}{1.5}   % 几倍行间距
\setlength{\baselineskip}{16pt}         % 基准行间距
\setlength{\parskip}{12pt}              % 基准段间距（word行距与字体有关，这里用12pt近似word五号宋体行间距）


% 设置字体 %
% -------------------------------------------------------%
\setmainfont{Times New Roman}
\setmonofont{Courier New}
\setsansfont{Arial}
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12pt}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
}

% 重定义ctex定义好的宋体和黑体，以支持伪加粗AutoFakeBold
% 即支持类似word里的给黑体、宋体等中文字体加粗的操作，用\bfseries
\let\heiti\relax
\newCJKfontfamily[hei]\heiti{SimHei}[AutoFakeBold]
\let\songti\relax
\newCJKfontfamily[song]\songti{SimSun}[AutoFakeBold]
\let\kaishu\relax
\newCJKfontfamily[kai]\kaishu{KaiTi}[AutoFakeBold]

\let\huawenxingkai\relax
\newCJKfontfamily[hwxk]\huawenxingkai{STXingkai.ttf}[AutoFakeBold]
\let\huawenzhongsong\relax
\newCJKfontfamily[hwzs]\huawenzhongsong{STZhongsong.ttf}[AutoFakeBold]
\let\huawenxinwei\relax
\newCJKfontfamily[hwxw]\huawenxinwei{STXinwei.ttf}[AutoFakeBold]


% 每行缩进两个汉字
\setlength{\parindent}{2em}

%  中文标题名称
\newcommand*{\sztu@cap@contentsname}{目录}
\newcommand*{\sztu@cap@listfigurename}{插图清单}
\newcommand*{\sztu@cap@listtablename}{附表清单}
\newcommand*{\sztu@cap@refname}{参考文献}
\newcommand*{\sztu@cap@indexname}{索引}
\newcommand*{\sztu@cap@figurename}{图}
\newcommand*{\sztu@cap@tablename}{表}
\newcommand*{\sztu@cap@appendixname}{附录}
\newcommand*{\sztu@cap@abstractname}{摘要}
 %%%  中文关键字
\newcommand*{\sztu@cap@keywordsname}{关键字}


% 定制titlepage
% 定义命令和定义相应的宏。
%----------------------------------------------------------------------%
% 预定义全局使用的文字，如姓名、专业等信息，在content/info.tex中定义
%----------------------------------------------------------------------%
% 以下定义封面相关命令和相应的宏，以titleen为例，\titleen为实际在源码中使用的命令，一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏，而该宏能够在后续的环境中使用。
\newcommand*{\titlecn}[1]{\gdef\@titlecn{#1}}                           % 中文标题
\newcommand*{\titlecnSingleLine}{\StrSubstitute{\@titlecn}{\\}{}}         % 中文标题去掉换行“\\”
\newcommand*{\titleen}[1]{\gdef\@titleen{#1}}                           % 英文标题
\newcommand*{\titleenSingleLine}{\StrSubstitute{\@titleen}{\\}{}}         % 英文标题去掉换行“\\”
\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}}                     % 一级学科（学科专业）
\newcommand*{\minormajor}[1]{\gdef\@minormajor{#1}}                     % 二级学科（学科方向）
\newcommand*{\interestmajor}[1]{\gdef\@interestmajor{#1}}               % 研究方向，关键词组
\newcommand*{\department}[1]{\gdef\@department{#1}}                     % 二级培养单位
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}                     % 导师
\newcommand*{\supervisortitle}[1]{\gdef\@supervisortitle{#1}}           % 导师职称
\newcommand*{\subsupervisor}[1]{\gdef\@subsupervisor{#1}}               % 副导师
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}                       % 学号

\newcommand*{\clcnumber}[1]{\gdef\@clcnumber{#1}}                       % 中图分类号 Chinese Library Classification
\newcommand*{\schoolcode}[1]{\gdef\@schoolcode{#1}}                     % 学校代码
\newcommand*{\udc}[1]{\gdef\@udc{#1}}                                   % UDC
\newcommand*{\academiccategory}[1]{\gdef\@academiccategory{#1}}         % 学术类别


% 封面 %
% -------------------------------------------------------------%

% 论文日期
% 采用key-value对的方式来制定存储信息的pgf路径
\pgfkeys{/thesisdate/pgf/.cd, % 定义pgf路径
    year/.store in = \year, % 指定关键词year的存储位置为\year
    month/.store in = \month, % 指定关键词month的存储位置为\month
    day/.store in = \day
}
% 利用上述的pgf的key-value定制论文日期命令
\newcommand{\thesisdate}[1] {
    \pgfkeys{/thesisdate/pgf/.cd,#1} % 指定使用/thesisdate/pgf/.cd来解释参数，然后在后文能直接使用存储位置来指定解释的内容
    \gdef\@thesisdate{\year{} 年 \month{} 月 \day{} 日} % 将构建好的日期存储到宏（\@thesisdate）中
}

% 以下为学位论文的封面内容

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义 \makecoverpage 实现封面的重新绘制
% -----------------------------------------------%
\newcommand{\makecoverpage} {
    \thispagestyle{empty}
    {
        \hbadness=10000  % Suppress "Underful \hbox ..."
        \centering
        \linespread{1.5}
        \begin{figure}[H]
            \centering
            \includegraphics[width=0.75\textwidth]{school_title.pdf}
        \end{figure}
        \vspace{-1cm}
        {\zihao{2} \bfseries \songti 本科毕业论文（设计） \par} % 二号宋体
        \vspace{2.5cm} % 空行
        \begin{minipage}{\textwidth}
            \centering
            \bfseries
            {\zihao{3} \heiti 题目：} 
            \begin{varwidth}[t]{0.85\textwidth}
                \zihao{2} \kaishu \uline{\@titlecn} 
            \end{varwidth}

        \end{minipage}
        \vskip 3.5cm
        {
            \zihao{3} \heiti
            \begin{tabular}{ll}
                \makebox[5em][s]{姓名：}      & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@author \hfill}} \\
                \makebox[5em][s]{学院：}      & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@department \hfill}} \\
                \makebox[5em][s]{专业：}      & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@priormajor \hfill}} \\
                \makebox[5em][s]{学号：}      & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@studentid \hfill}} \\
                \makebox[5em][s]{指导教师：}  & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@supervisor \hfill}} \\
                \makebox[5em][s]{职称：}      & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@supervisortitle \hfill}} \\
                \makebox[5em][s]{提交日期：}   & \parbox[t]{14em}{\bfseries \kaishu \uline{\centering \hfill \@thesisdate \hfill}} \\
            \end{tabular}
        }
        \par
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2.学位论文诚信声明
% -----------------------------------------------%
% 单独设一页，排在扉页后
% 按模板，标题二号，内容四号，这里学校没有特别强调字体字号，
% 应该有一定自由度。

\newcommand{\announcement}{

    \linespread{1.5} % 这部分的行间距跟正文不一样

    \vspace*{2.5cm}
    {\centering \zihao{-2} \bfseries \heiti 深圳技术大学本科毕业论文（设计）诚信声明 \par}

    \vspace{2cm}

    \hbadness=10000  % Suppress "Underful \hbox ..."
    \setlength{\parindent}{2em} % 首行缩进
    {
        \zihao{4}
        本人郑重声明：所呈交的毕业论文（设计），题目《\titlecnSingleLine》 是本人在指导教师的指导下，独立进行研究工作所取得的成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式注明。除此之外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。本人完全意识到本声明的法律结果。

        \vspace{4cm}

        \begin{flushright}
                毕业论文（设计）作者签名：\makebox[5em][c]{} \\
                日期：\makebox[5em][c]{}\makebox[6em][s]{年月日}
        \end{flushright}
        
    }

    \vspace{1cm}

}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. 目录 %
% -----------------------------------------------%
% 目录由论文（设计）的章、节、附录等序号、名称和页码组成。单独成页。四号宋体，1.5倍行距分散对齐排版。 
% “目录”两字居中（三号黑体），下空两行为章、节、小节及其开始页码（靠右顶格）。章、节、小节分别以阶梯式排列：1（第1章）、1.1、1.1.1依次标出。章、节、小节的题名与页码之间用“．．．．．．”连接。除“目录”两字外，其余字体均为小四号宋体。

\setcounter{secnumdepth}{3}
% 定义作为标题的格式
% \titleformat{command}[shape]%定义标题类型和标题样式
%               {format}%定义标题格式
%               {label}%定义标题的标签，即标题的标号等
%               {sep}%定义标题和标号之间的水平距离
%               {before-code}%定义标题前的内容
%               [after-code]%定义标题后的内容
\newcommand{\sectionbreak}{\clearpage}  % 大章前分页
\titleformat{\section}{\zihao{-2}\centering \bfseries \heiti}{\thesection}{1em}{}
\titleformat{\subsection}{\zihao{3} \bfseries \heiti}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\zihao{-3} \bfseries \heiti}{\thesubsubsection}{1em}{}
% 设置章节标题的段间距，默认0.5段间距足够了，去掉章节标题自带的段间距
\titlespacing{\section}{0pt}{0pt}{0pt}%{0.3em}{0.3em}
\titlespacing{\subsection}{0pt}{0pt}{0pt}%{0.3em}{0.3em}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}%{0.3em}{0.3em}
% 定义在目录中的格式
% \titlecontents{标题名}
%               [左间距]
%               {标题格式}
%               {标题标志}
%               {无序号标题}
%               {指引线与页码}
\titlecontents{section}
              [0.75em] % 按样例目录左侧是和前置部分文字左侧对齐的
              {\zihao{4} \songti}
              {\contentslabel {1em}}
              {\hspace*{-1em}}
              {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}
    [2.5em]
    {\zihao{4} \songti} % note that 3.8 = 1.5 + 2.3
    {\contentslabel{2.2em}}
    {\hspace*{-3em}}
    {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsubsection}
    [4em]
    {\zihao{4} \songti} % note that 3.8 = 1.5 + 2.3
    {\contentslabel{3.0em}}
    {\hspace*{-5em}}
    {\titlerule*[0.5pc]{.}\contentspage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 正文标题+作者信息
% \newcommand{\infotitle}{
%     \linespread{1.5}
%     \begin{center} \zihao{2} \bfseries \huawenzhongsong \titlecnSingleLine \end{center}
%     % \begin{center} \zihao{5} \kaishu \@department-\@priormajor \quad  \@author \end{center}
%     % \begin{center} \zihao{-5} \kaishu 学号：\@studentid \end{center}
% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页眉
\newcommand{\setheader}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[C]{\songti \zihao{-5} 深圳技术大学本科毕业论文— \titlecnSingleLine }
}
% 摘要页码格式
\newcommand{\setabstractfooter}{
    \setcounter{page}{1} % 重置页码编号
    \pagenumbering{Roman}
    \fancyfoot[C]{\zihao{-5} \thepage}
}
% 正文页码格式
\newcommand{\setfooter}{
    \setcounter{page}{1} % 重置页码编号
    \pagenumbering{arabic}
    \fancyfoot[C]{\zihao{-5} 第 \thepage\ 页，共 \pageref{LastPage}\ 页}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. 中文摘要
% -----------------------------------------------%
% 摘要】和【关键词】：【】内字符小四号楷体加粗，【】外字符五号楷体。以上内容一律单倍行距、段前段后 0.5 行、两端对齐排版。

\newcommand*{\keywordscn}[1]{\gdef\@keywordscn{#1}} % 定义中文关键词
\newcommand*{\categorycn}[1]{\gdef\@categorycn{#1}} % 定义中文分类
\newenvironment{abstractcn} { % 定义中文摘要环境

    \linespread{1.5}

    \begin{center} \zihao{2} \bfseries \huawenzhongsong \@titlecn \end{center}

    \vspace{0.5cm}

    \noindent {\zihao{4} \bfseries \kaishu 【摘\quad 要】} % “摘要”两个字为四号楷体
    \zihao{-4}\kaishu \noindent % 内容为小四号楷体
}
% 显示中文关键词和分类号
{
    \begin{flushleft}
        \noindent 
        {\zihao{4} \bfseries \kaishu 【关键词】} % “关键词”三个字为四号楷体
        {\zihao{-4} \kaishu \@keywordscn} \par % 内容为小四号楷体
    \end{flushleft}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. 英文摘要
% -----------------------------------------------%
% 英文摘要格式和内容与中文摘要相对应，另起一页，具体见样例9。居中打印论文英文题名（三号Times New Roman字体），换行顶格编排“Abstract”及英文摘要内容（四号Times New Roman字体），摘要内容每段开头留四个字符空格。摘要内容后下换行顶格编排“Keywords”和“Classification”。
% 定义英文摘要，字体全部为timesnewroman
\newcommand*{\keywordsen}[1]{\gdef\@keywordsen{#1}} % 英文关键词
\newcommand*{\categoryen}[1]{\gdef\@categoryen{#1}} % 中文分类
\newenvironment{abstracten} { % 新建英文摘要环境
    \linespread{1.5}

    \begin{center} \zihao{2} \bfseries \@titleen \end{center}

    \vspace{0.5cm}

    \noindent {\zihao{4} \bfseries 【Abstract】~} % 四号
    \zihao{-4} \noindent % 小四号
}
{
    \begin{flushleft}
        \noindent 
        {\zihao{4} \bfseries 【Key words】~} %四号
        {\zihao{-4} \@keywordsen} \par % 小四号
    \end{flushleft}
}


% 5. 论文正文 %
% -------------------------------------------------------%
% 论文正文是主体，主体部分应从另页右页开始，每一章应另起页。一般由序号标题、文字叙述、图、表格和公式等五个部分构成。
% 写作形式可因研究内容的性质不同而变化，一般可包括绪论（或综述）、理论分析、计算方法、实验装置和测试方法、实验结果分析和讨论、研究成果、结论及意义等。
% 该部分由用户编写
% 一级标题字体不大于小二号，黑体加粗； 
% 二级标题比一级标题小半号，黑体加粗； 
% 三级标题比上一级标题小半号，黑体加粗； 
% 正文内容小四号宋体。 
% 以上内容一律1.5倍行距、段前段后0.5行、两端对齐排版。 

% 图表等浮动环境设置 %
% ----------------------------------------------------------%
% 正文中出现的图表力求简明，图次和表次一律写成图 1，图 2…或表 1，表 2…，并尽可能随文排。
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.tif}
 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}


% 插图格式
% ------------------------------------------------------%
% \captionsetup[subfigure]{labelfont=normalfont,textfont=normalfont,singlelinecheck=off,justification=raggedright}
% singlelinecheck=off 表示即使caption只有一行， justification 也生效
% justification=raggedright 使子图 caption 靠左对齐，而caption的上下位置由\caption标签的位置决定，以此实现了学校要求的子图标签在左上角显示。
% 这部分功能由 subcaption 这个包实现，而这个包不能和 subfigure 同时使用，所以子图的写法也与 subfigure 包的不大一样。 
% \captionsetup[subfigure]{singlelinecheck=off,justification=raggedright} % 左对齐
\captionsetup[subfigure]{singlelinecheck=off,justification=centering}   % 居中

% 图下方描述的字体
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{sfive}{\zihao{5}}
% \renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}



\captionsetup[figure]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={song,sfive},   % 图的字体, 宋体小五
	position=bottom    % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 表格格式
% ------------------------------------------------------%
% \renewcommand{\thetable}{\arabic{section}-\arabic{table}}
% \renewcommand {\thetable} {\thesection-\arabic{table}}
\captionsetup[table]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={song,sfive},   % 图的字体, 宋体小五
	position=top
}
% 算法
% ------------------------------------------------------%
\floatname{algorithm}{算法}
% \renewcommand{\thealgorithm}{\arabic{section}-\arabic{algorithm}}
% \renewcommand {\thealgorithm} {\thesection-\arabic{algorithm}}
\captionsetup[algorithm]{
	format=plain,      % 标题从第二行开始是否缩进，plain无缩进，hang有缩进
	labelsep=quad,     % 分隔符是一个空格
	font={song,sfive},   % 图的字体, 宋体小五
	position=top
}

% 列表环境设置 %
% ------------------------------------------------------------------%
% \RequirePackage{listings}
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 表格 %
% ------------------------------------------------------%
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\sztu@oldtabular\tabular
\let\sztu@endoldtabular\endtabular
\renewenvironment{tabular} {
    \bgroup
	\renewcommand{\arraystretch}{1.38}
    \sztu@oldtabular
} {
    \sztu@endoldtabular\egroup
}

% 表格字号应比正文小，一般五号/10.5pt，但是暂时没法再cls里设置（不然会影响到封面等tabular环境）
% 所以目前只好在主文件里局部\AtBeginEnvironment

% 数学环境, 定理等设置 %
% -------------------------------------------------------%
% 数学定理相关的常量
\newcommand*{\sztu@cap@definition}{定义}
\newcommand*{\sztu@cap@theorem}{定理}
\newcommand*{\sztu@cap@lemma}{引理}
\newcommand*{\sztu@cap@corollary}{推论}
\newcommand*{\sztu@cap@assumption}{假设}
\newcommand*{\sztu@cap@conjecture}{猜想}
\newcommand*{\sztu@cap@axiom}{公理}
\newcommand*{\sztu@cap@principle}{定律}
\newcommand*{\sztu@cap@problem}{问题}
\newcommand*{\sztu@cap@example}{例}
\newcommand*{\sztu@cap@proof}{证明}
\newcommand*{\sztu@cap@solution}{解}

\newtheorem{definition}{\sztu@cap@definition}
\newtheorem{theorem}{\sztu@cap@theorem}
\newtheorem{lemma}{\sztu@cap@lemma}
\newtheorem{corollary}{\sztu@cap@corollary}
\newtheorem{assumption}{\sztu@cap@assumption}
\newtheorem{conjecture}{\sztu@cap@conjecture}
\newtheorem{axiom}{\sztu@cap@axiom}
\newtheorem{principle}{\sztu@cap@principle}
\newtheorem{problem}{\sztu@cap@problem}
\newtheorem{example}{\sztu@cap@example}
\newtheorem*{proof}{\it{\sztu@cap@proof}}
\newtheorem{solution}{\sztu@cap@solution}



% 编号分章节。如需要连续编号，注释\makeatletter下面对应内容即可。
% \renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

\makeatletter
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
\@addtoreset{equation}{section}
\makeatother

% 6. 参考文献 %
% ------------------------------------------------------%
% 【】标题五号楷体顶格加粗，内容小五号楷体顶格。单倍行距、段前段后 0.5 行、两端对齐排版。
\newcommand{\setreference}
{
    \setlength{\bibsep}{2ex} % 参考文献条目间距
    % 临时修改section标题样式
    \renewcommand{\refname}{参考文献}
    \titleformat{\section}{\centering \bfseries \zihao{-2} \heiti}{\thesection}{1em}{}
    % \addcontentsline{toc}{section}{参考文献}
    % { \zihao{-2} \bfseries \heiti 参考文献 \par}
    \phantomsection % 使得hyperref目录能够跳转到正确的位置
    \addcontentsline{toc}{section}{参考文献} % 由于参考文献不是section，这句把参考文献加入目录
	\zihao{5} \kaishu
	\bibliographystyle{gbt7714-numerical}
    \bibliography{thesis-references}
    \newpage
    
    % % 改回section样式 
    % \titleformat{\section}{\zihao{3} \bfseries \heiti}{\thesection}{1em}{}
}
% 7. 致谢 %
% 作者对给予指导、各类资助和协助完成研究工作以及提供各种对论文工作有利条件的单位及个人表示感谢。
% “致谢”二字居中，小四号黑体加粗
% 内容五号宋体，单倍行距、段前段后0.5行

\newenvironment{thankscontent} { % 定义致谢环境

    \linespread{1.5}

    \vspace{0.5cm}
    \phantomsection % 使得hyperref目录能够跳转到正确的位置
    \addcontentsline{toc}{section}{致谢}
    {\centering \zihao{-2} \bfseries \heiti 致谢 \par}
    \vspace{0.5cm}
    \zihao{-4} \songti
}

% 9. 附录（必要时）%
% -------------------------------------------------------%
% TODO %
% 附录中主要列入正文内不便列出的过分冗长的公式推导，供查读方便所需的辅助性数学工具或表格、重复性数据图表、计算程序及说明等。附录依次为附录1，附录2……等，“附录X”三字居中（三号黑体）。附录中的图表公式另编排序号，与正文分开。


% 篇眉和页码要求 %
% ---------------------------------------------------------%
% 篇眉宋体小五号居中，深圳技术大学本科毕业论文—论文标题

% \pagestyle{fancy}
% \fancyhf{} % 清空原有格式
% \fancyhf[RH]{\small\leftmark} % 设置所有（奇数和偶数）右侧页眉
% \fancyhf[LH]{深圳技术大学博士学位论文} % 设置所有（奇数和偶数）左侧页眉
% \fancyhf[CF]{\thepage} % 所有（奇数和偶数）中间页脚


\endinput
