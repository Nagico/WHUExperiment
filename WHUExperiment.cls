% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\RequirePackage{expl3 , xparse , l3keys2e}
\ProvidesClass{WHUExperiment}[2022/07/22 Wuhan University Thesis Template for Experimental Report]


\ExplSyntaxOn
\msg_new:nnn { WHUExperiment } { 引擎不支持 }
  {
    WHUExperiment ~ 不支持 ~ #1 ~ 引擎。\\\\

    请使用 ~ XeLaTeX ~ 或 ~ LuaLaTeX ~ 进行编译！
  }

\sys_if_engine_xetex:F
  {
    \sys_if_engine_luatex:F
      {
        \msg_fatal:nnx { WHUExperiment } { 引擎不支持 }
          { \c_sys_engine_str }
      }
  }

\ExplSyntaxOff

\LoadClass[zihao=-4,a4paper,oneside]{ctexbook}
%\setmainfont{Times New Roman}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions

\usepackage[dvipsnames, svgnames, x11names]{xcolor}

%------------------------ Page layout ----------------------------------
\RequirePackage{fancyhdr,hyperref}
\RequirePackage{float}
\RequirePackage{subcaption}

\hypersetup{pdfencoding=auto}  %%% 邓东升修改
 \ifprint
 \hypersetup{hidelinks}
 \else
\hypersetup{citecolor=magenta,linkcolor=blue}
\fi
\RequirePackage[top=2.5truecm,bottom=2truecm,left=3truecm,right=3truecm,includefoot,xetex]{geometry}    % 页面设置%

\newtoks\StudentNumber       %学号
\newtoks\miji            %密级
\newtoks\Cmajor          %学科专业中文名
\newtoks\Emajor          %学科专业英文名
\newtoks\Edate           %英文日期
\newtoks\Etitle          %英文题目
\newtoks\Eauthor         %作者英文名
\newtoks\Esupervisor     %指导教师英文名
\newtoks\Csupervisor     %指导教师中文名
\newtoks\Eschoolname      %学院英文名
\newtoks\Cschoolname      %学院中文名
\newtoks\Ccoursename          %课程名称
\newtoks\CsupervisorAnother        %指导教师二
\newtoks\CstudentNum			%学生学号




\pagestyle{fancyplain}
\fancyhf{}  %清除以前对页眉页脚的设置
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{-\,\thepage\,-}


\fancypagestyle{plain}
{
\fancyhead{}                                    % clear all header fields
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}                                    % clear all footer fields
\fancyfoot[C]{\zihao{5}\usefonttimes{-\,\thepage\,-}}
}

%%=====封面===================== 
\def\maketitle{%
  \null
  \thispagestyle{empty}%
  %\vspace*{-2cm}
  \begin{center}\leavevmode
    {\heiti \zihao{5}%
    \begin{tabular}{p{9cm}lp{3cm}l}
%  & \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{学\hfill 号}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\StudentNumber}\hfill{} & \\ \cline{3-3}
%  & \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{密\hfill 级}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\miji}\hfill{}   & \\ \cline{3-3}
    \end{tabular}
    }
    \par
    \vspace*{0.9cm} %插入空白
    {\songti \zihao{1} \makebox[9cm][s]{武汉大学计算机学院}}\\
	\vspace{0.8cm}
	{\songti \zihao{1} \makebox[9cm][s]{本科生课程实验报告}}\\
    \vspace{2.0cm}
    {\heiti \zihao{2} \@title \par}%
%    \vspace{4.2cm}
     \vfill\vfill\vfill
    {\songti\zihao{-3}
    \begin{tabular}{cp{3cm}c}
      \raisebox{-3ex}[0pt]{\makebox[3.5cm][s]{专\hfill 业\hfill 名\hfill 称\hfill:\hfill}} & { {}\raisebox{-3ex}[0pt]{\the\Cmajor}\hfill{}} & \\[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3.5cm][s]{课\hfill 程\hfill 名\hfill 称\hfill:\hfill}} & {  {}\raisebox{-3ex}[0pt]{\the\Ccoursename}\hfill{}} & \\[3ex]
	  \raisebox{-3ex}[0pt]{\makebox[3.5cm][s]{指\hfill 导\hfill 教\hfill 师\hfill:\hfill}} & { {}\raisebox{-3ex}[0pt]{\the\Csupervisor}\hfill{}} & \\[3ex]

      % 关闭第二指导教师显示
      % \raisebox{-3ex}[0pt]{\makebox[3.5cm][s]{指\hfill 导\hfill 教\hfill 师\hfill:\hfill}} & { {}\raisebox{-3ex}[0pt]{\the\CsupervisorAnother}\hfill{}} & \\[3ex]
	  \raisebox{-3ex}[0pt]{\makebox[3.5cm][s]{学\hfill 生\hfill 学\hfill 号\hfill:\hfill}} & { {}\raisebox{-3ex}[0pt]{\the\CstudentNum}\hfill{}} & \\[3ex]
	  \raisebox{-3ex}[0pt]{\makebox[3.5cm][s]{学\hfill 生\hfill 姓\hfill 名\hfill:\hfill}} & { {}\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\[3ex]
     \end{tabular}
    }
    \par
    \vspace{2.6cm}
    {
    {\songti \zihao{3} \@date \par}%
    }
    %\vspace*{-0.7cm}
  \end{center}%
%  \null
%   \cleardoublepage
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\usefonttimes{\fontencoding{T1}\fontfamily{ptm}\selectfont}
\newcommand\cnabstractname{摘要}
\newcommand\teachername{教师评语评分}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\noindent\heiti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\usefonttimes{\noindent\bfseries\zihao{-4}\enkeywordsname: }#1} }
\newcommand\enkeywordsname{Key words}
\newenvironment{cnabstract}{
    \newpage
\chapter*{\ziju{2}{\cnabstractname}}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh
    \songti\zihao{-4}
    \@afterheading}
    {\par}

\newenvironment{enabstract}{
    \newpage
    \chapter*{\usefonttimes\enabstractname}
%    \songti\zihao{-4}
	\usefonttimes
    \@afterheading}
    {\par}
	
\newenvironment{teacher}{
    \newpage
\chapter*{{\teachername}}   
    \songti\zihao{4}
    \@afterheading}
    {\par}
	
%%------------------------常用宏包-----------------------------------
\RequirePackage{amssymb}
\RequirePackage{unicode-math}
% \RequirePackage[tbtags]{amsmath}
\RequirePackage{mathtools}
\RequirePackage{extarrows}
\RequirePackage{ragged2e} % for \RaggedRight macro
\RequirePackage{booktabs}
\RequirePackage[normalem]{ulem}
\RequirePackage{physics}
\RequirePackage{supertabular}
\RequirePackage{multirow}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX宏包.
\RequirePackage{gbt7714}
\RequirePackage{graphicx}                 % 图形
\RequirePackage { tikz, pgfplots } % 绘图
\pgfplotsset { compat = 1.17 }
\RequirePackage{color}             %支持彩色
\RequirePackage{listings}
%\RequirePackage{mathrsfs}   % 不同于\mathcal or \mathfrak 之类的英文花体字体
\RequirePackage{url}
\RequirePackage{enumerate}
\RequirePackage{CJKfntef}
\RequirePackage{natbib}

\RequirePackage{hhline, boldline}
\RequirePackage{seqsplit, caption} %for table spacing to second row
\RequirePackage{siunitx} %for table spacing to second row
\RequirePackage{threeparttable} %to add footnote below table

% 使用 tabularx 创建占满宽度的表格
\RequirePackage { tabularx }

\newcolumntype{L}{>{\RaggedRight\hangafter=1\hangindent=0em}X}
\newcolumntype{C}{>{\Centering\hangafter=1\hangindent=0em}X}
\newcolumntype{R}{>{\RaggedLeft\hangafter=1\hangindent=0em}X}

\ProvideDocumentCommand { \tabularxcolumn } { m }
  { m { #1 } }  % 使表格内容垂向居中

\RequirePackage
{
    longtable,
    xltabular, % 长表格
    booktabs,  % 三线表
    makecell,
    multirow,  % 跨行表格
    diagbox    % 斜线表头
}

\RequirePackage { algorithm2e }     % 算法代码
\ExplSyntaxOn
\tl_set:Nn \algorithmcfname { 算法 }
\SetAlCapSty {}
\SetAlCapFnt {}
\box_new:N \l__whu_space_box
\hbox_set:Nn \l__whu_space_box { \nobreakspace }
\SetAlgoCaptionSeparator
  { \hbox_to_wd:nn { 1 em - \box_wd:N \l__whu_space_box } {} }
% 算法标题后会跟一个不间断空格 ~，这里将其宽度减掉
\ExplSyntaxOff

%%-------------------------代码高亮-----------------------------------
\renewcommand{\lstlistlistingname}{代码汇总} % 代码高亮caption的名称
\renewcommand{\lstlistingname}{代码}

\lstset{
	basicstyle=\linespread{1.0}\ttfamily, % 设置字体族
	breaklines=true, % 自动换行
	keywordstyle=\bfseries\color{blue!70!black}, % 设置关键字为粗体，颜色为 NavyBlue
	morekeywords={}, % 设置更多的关键字，用逗号分隔
	emph={self}, % 指定强调词，如果有多个，用逗号隔开
  emphstyle=\bfseries\color{Rhodamine}, % 强调词样式设置
  commentstyle=\itshape\color{PineGreen!90!black}, % 设置注释样式，斜体，浅灰色
  stringstyle=\bfseries\color{red!90!black}, % 设置字符串样式
  backgroundcolor = \color{yellow!10},
  columns=flexible,
  numbers=left, % 显示行号在左边
  numbersep=2em, % 设置行号的具体位置
  numberstyle=\footnotesize, % 缩小行号
  % frame=single, % 边框
  % framesep=1em % 设置代码与边框的距离
}

%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}


\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使参考文献引用以上标出现

%%%%%%%-------------------------------------------------
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
            \parsep 0pt
            \topsep \parsep
            \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
     \else \global\advance\@listdepth\@ne \fi
  \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
  \csname @list\romannumeral\the\@listdepth\endcsname
  \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
  \@trivlist
  \parskip\parsep \parindent\listparindent
  \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
  \advance\@totalleftmargin \leftmargin
  \parshape \@ne \@totalleftmargin \linewidth
  \ignorespaces}

\makeatother
%---------------------------------------------------
\newcommand\acknowledgement{\chapter*{\ziju{2}结论}}

%%% ---- 章节标题设置 ----- %%%%
\ctexset{chapter={format+={\zihao{-2}\usefonttimes},%
               number={\arabic{chapter}},name={,},afterskip={0.5\baselineskip},beforeskip={0.8\baselineskip}}}      %\zihao{-2}
\ctexset{section={format+={\zihao{4}\raggedright\usefonttimes},afterskip={0.5\baselineskip},beforeskip={0.5\baselineskip}}}
\ctexset{subsection={format+={\zihao{-4}\raggedright\usefonttimes},afterskip={0.5\baselineskip},beforeskip={0.5\baselineskip}}}
\ctexset{subsubsection={format={\zihao{-4}\bf\raggedright\usefonttimes},afterskip={0.5\baselineskip},beforeskip={0.5\baselineskip}}}

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

%%% ---- 图表标题设置 ----- %%%%
\RequirePackage[labelsep=quad]{caption} %% 序号之后空一格写标题
\captionsetup[table]{textfont=bf}  %%设置表格标题字体为黑体  。2016.06.07
\renewcommand\figurename{\zihao{-4}\usefonttimes 图}

\renewcommand\tablename{\bf\zihao{-4}\usefonttimes 表}

%%% ------ 目录设置 ------- %%%%
\ctexset{contentsname={目\qquad 录}}
 
\RequirePackage{tocloft} 
\renewcommand\cftchapfont{\zihao{4}\bf\usefonttimes}
\renewcommand\cftchappagefont{\zihao{-4}\bf\usefonttimes}
\renewcommand\cftsecfont{\zihao{-4}\usefonttimes}
\renewcommand\cftsecpagefont{\zihao{-4}\usefonttimes}
\renewcommand\cftsubsecfont{\zihao{-4}\usefonttimes}
\renewcommand\cftsubsecpagefont{\zihao{-4}\usefonttimes}
\renewcommand\cftsubsubsecfont{\zihao{-4}\usefonttimes}
\renewcommand\cftsubsubsecpagefont{\zihao{-4}\usefonttimes}
\renewcommand\cfttoctitlefont{\hfill\zihao{-2}\bf}
\renewcommand\cftaftertoctitle{\hfill}
 
%%% ------ 脚注设置 ------- %%%%
\RequirePackage{ctex}
\RequirePackage{pifont}
\RequirePackage[perpage,symbol*]{footmisc}
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figures/}}        % 图片文件路径
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\allowdisplaybreaks

\endlinechar `\^^M
\endinput
