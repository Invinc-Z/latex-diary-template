\ProvidesClass{diary}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[a4paper]{article}
\RequirePackage[UTF8]{ctex}
\RequirePackage[landscape,twocolumn]{geometry}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\RequirePackage[calc]{datetime2}
\usepackage{xparse} % LaTeX3 宏包（较新版本已内置）
\RequirePackage{xargs}
\usetikzlibrary{shadows,calc,positioning}

\geometry{left=2.0cm, right=2.0cm, top=4.5cm, bottom=2.5cm}
\setlength{\columnsep}{3cm}
\pagestyle{empty}
\linespread{1.25}
\AtBeginDocument{\zihao{4}}

% 颜色
\definecolor{background-color}{HTML}{fffee8}
\definecolor{titlepage-color}{HTML}{fffbb4}
\definecolor{date-color}{HTML}{454545}
\definecolor{weekday-color}{HTML}{454545}
\definecolor{map-color}{HTML}{454545}
\definecolor{weather-color}{HTML}{454545}

% 背景
\def\SpiralNumber{16}      % 线圈数
\def\GridColor{black!100}  % 网格线颜色
\def\ShadowXshift{0.5ex}
\def\ShadowYshift{-0.5ex}

\tikzset{%
  spiral/.pic={
    \draw[
      draw=black,
      left color=black!70,
      right color=black!70,
      middle color=gray!40
      ]
      (-1.1,-0.35) rectangle ++(10pt,10pt);
    \draw[
      draw=black,
      left color=black!70,
      right color=black!60,
      middle color=gray!40
      ]
      (-1.77,-0.35) rectangle ++(10pt,10pt);
    \draw[
      double=gray!80,
      double distance=1pt,
      ]
      (-1,-0.2) arc (40:-220:10pt and 2pt);
    \draw[
      double=gray!80,
      double distance=1pt,
      ]
      (-1,-0.05) arc (40:-220:10pt and 2pt);
  }
}

\def\SpiralPosition{%
  ([xshift=36pt, yshift=3pt+2.5cm-\Valor*(\textheight+2.5cm)/(\SpiralNumber-1)]current page text area.north)
}
\RequirePackage{eso-pic}
\AddToShipoutPictureBG{%
  \begin{tikzpicture}[remember picture,overlay]
    % draw frame
    \draw[rounded corners=10pt,fill=background-color,drop shadow={shadow xshift=\ShadowXshift, shadow yshift=\ShadowYshift}]
      ([xshift=-30pt,yshift=20pt+2.5cm]current page text area.north west) rectangle
      ([xshift=-2pt,yshift=-20pt]current page text area.south);
    \draw[rounded corners=10pt,fill=background-color,drop shadow={shadow xshift=\ShadowXshift, shadow yshift=\ShadowYshift}]
      ([xshift=30pt,yshift=-20pt]current page text area.south east) rectangle
      ([xshift=2pt,yshift=20pt+2.5cm]current page text area.north);
    % draw lines
    \draw[\GridColor,opacity=0.3,shift={(0,0.62\baselineskip)}]
          ([xshift=-30pt]current page text area.north west) grid[step=\baselineskip,xstep=0]
          ([xshift=-2pt]current page text area.south);
    \draw[\GridColor,opacity=0.3,shift={(0,0.62\baselineskip)}]
          ([xshift=30pt]current page text area.south east) grid[step=\baselineskip,xstep=0]
          ([xshift=2pt]current page text area.north);
    % top thick line
    \draw[black!70,line width=1pt]
          ([xshift=-30pt,yshift=0.7em]current page text area.north west) --
          ([xshift=-2pt,yshift=0.7em]current page text area.north);
    \draw[black!70,line width=1pt]
          ([xshift=30pt,yshift=0.7em]current page text area.north east) --
          ([xshift=2pt,yshift=0.7em]current page text area.north);
    % draw middle spiral
    \foreach \Valor in {0,1,...,\numexpr\SpiralNumber-1\relax}
      \pic at \SpiralPosition {spiral};
  \end{tikzpicture}
}

%ICON 
\newfontfamily\iconfont[Path=fonts/]{icofont}

% map icon
\def\map{{\iconfont^^^^ef79}}

% weather icon
\def\sun{{\iconfont^^^^ee81}}
\def\sunny{{\iconfont^^^^ee83}}
\def\hot{{\iconfont^^^^ee7e}}

\def\rainy{{\iconfont^^^^ee6a}}
\def\rainySunny{{\iconfont^^^^ee68}}
\def\rainyThunder{{\iconfont^^^^ee69}}
\def\thunderLight{{\iconfont^^^^ee84}}

\def\windy{{\iconfont^^^^ee9f}}
\def\clouds{{\iconfont^^^^ee51}}

\def\snow{{\iconfont^^^^ee6e}}
\def\snowy{{\iconfont^^^^ee7d}}
\def\snowyRainy{{\iconfont^^^^ee73}}

\def\hail{{\iconfont^^^^ee61}}
\def\dust{{\iconfont^^^^ee53}}

% emotion icon
\def\confused{{\iconfont^^^^eaf7}}
\def\sad{{\iconfont^^^^eb01}}
\def\simpleSmile{{\iconfont^^^^eb02}}
\def\slightlySmile{{\iconfont^^^^eb03}}
\def\angry{{\iconfont^^^^eaf4}}
\def\astonished{{\iconfont^^^^eaf5}}
\def\confounded{{\iconfont^^^^eaf6}}
\def\crying{{\iconfont^^^^eaf8}}
\def\dizzy{{\iconfont^^^^eaf9}}
\def\expressionless{{\iconfont^^^^eafa}}
\def\heartEyes{{\iconfont^^^^eafb}}
\def\laughing{{\iconfont^^^^eafc}}
\def\nerdSmile{{\iconfont^^^^eafd}}
\def\openMouth{{\iconfont^^^^eafe}}
\def\rage{{\iconfont^^^^eaff}}
\def\rollingEyes{{\iconfont^^^^eb00}}
\def\worried{{\iconfont^^^^eb07}}
\def\winkSmile{{\iconfont^^^^eb06}}
\def\stuckOutTongue{{\iconfont^^^^eb05}}
\def\smirk{{\iconfont^^^^eb04}}

%COMMAND DAY
\RequirePackage{xstring}
\newcommand\diary@numToMonth[1]{%
  \IfStrEqCase{#1}{%
    {1}{January}
    {2}{February}
    {3}{March}
    {4}{April}
    {5}{May}
    {6}{June}
    {7}{July}
    {8}{August}
    {9}{September}
    {10}{October}
    {11}{November}
    {12}{December}
  }
}

\DTMsavedate{currentdate}{\year-\month-\day}
\NewExpandableDocumentCommand{\getYear}{}{\DTMfetchyear{currentdate}}
\NewExpandableDocumentCommand{\getMonth}{}{\DTMfetchmonth{currentdate}}
\NewExpandableDocumentCommand{\getDay}{}{\DTMfetchday{currentdate}}

%COMMAND WEEKDAY
\newcommand\diary@EnDoWToCHDow[1]{%
	\IfStrEqCase{#1}{%
		{Sun}{星期日}
		{Mon}{星期一}
		{Tue}{星期二}
		{Wed}{星期三}
		{Thu}{星期四}
		{Fri}{星期五}
		{Sat}{星期六}
	}
}

%COMMAND WEEKDAY
\newcommand\diary@numToCHDow[1]{%
	\IfStrEqCase{#1}{%
		{0}{星期一}
		{1}{星期二}
		{2}{星期三}
		{3}{星期四}
		{4}{星期五}
		{5}{星期六}
		{6}{星期日}
	}
}

% default value
\def\diary@province{}
\def\diary@city{}
\def\diary@weather{\sunny}
\def\diary@beginYear{}
\def\diary@beginMonth{}
\def\diary@beginDay{}
\def\diary@endYear{}
\def\diary@endMonth{}
\def\diary@endDay{}
\def\@title{}
\def\@author{}

%\RequirePackage{xargs}
\newcommandx{\Address}[2][1=江苏,2=南京,usedefault]{%
  \def\diary@province{#1}%
  \def\diary@city{#2}%
}%

% 添加主题居中命令
\newcommand{\Theme}[1]{%
	\begin{center}%
		\vspace{-2em}
		#1%
		\vspace{-0.55em}
	\end{center}%
}

% 添加主题居中命令
\newcommand{\CenterText}[1]{%
	\begin{center}%
		\vspace{-0.1em}
		#1%
		\vspace{-0.5em}
	\end{center}%
}

\newcommand\BeginAt[3][]{%
  \def\diary@beginYear{#1}%
  \def\diary@beginMonth{#2}%
  \def\diary@beginDay{#3}%
}
\newcommand\EndAt[3][]{%
  \def\diary@endYear{#1}%
  \def\diary@endMonth{#2}%
  \def\diary@endDay{#3}%
}

\newcounter{diary}

%\RequirePackage{xargs}
\newcommandx{\Date}[4][4]{%
  \ifx#4\empty%
  \else%
    \def\diary@weather{#4}%
  \fi%
  \stepcounter{diary}%
  \newpage%
  \begin{tikzpicture}[remember picture,overlay,black!80!yellow]
  	 \DTMsavedate{mydate}{#1-#2-#3}  % 保存当前日期
    \if@firstcolumn%
      \node[anchor=north east] at ([xshift=-2.5em,yshift=2.5cm]current page text area.north) (day) {\color{date-color}\fontsize{50}{60}\selectfont #3};%
      \draw[line width=2pt,date-color] ($(day.north west)+(-8pt,0)$) -- ($(day.south west)+(-8pt,0)$);%
      \node[anchor=north east,left=16pt of day,yshift=9pt] (month) {\color{date-color}\zihao{4}#2 月};%
      \node[anchor=south east,left=16pt of day,yshift=-9pt]  (weekday) {\color{weekday-color}\zihao{4}\diary@numToCHDow{\DTMfetchdow{mydate}}};%
      \node[anchor=south east,left=46pt of day,yshift=9pt] (year) {\color{date-color}\zihao{4}#1 年};%
      \node[left=8.0cm of day.east,anchor=center] (location) {\color{map-color}\map\ \ifx\diary@province\empty\else\diary@province•\fi\diary@city};%
      \node[left=10.5cm of day.east] {\color{weather-color}\huge\diary@weather};%
      \node at ($(current page text area.south)+(-0.25\textwidth-16pt,-8pt)$) {\color{date-color}第\thediary 篇};%
    \else%
      \node[anchor=north west] at ([xshift=2.5em,yshift=2.5cm]current page text area.north) (day) {\color{date-color}\fontsize{50}{60}\selectfont #3};%
      \draw[line width=2pt,date-color] ($(day.north east)+(8pt,0)$) -- ($(day.south east)+(8pt,0)$);%
      \node[anchor=north west,right=16pt of day,yshift=9pt] (month) {\color{date-color}\zihao{4}#2 月};%
      \node[anchor=south west,right=16pt of day,yshift=-9pt]  (weekday) {\color{weekday-color}\zihao{4}\diary@numToCHDow{\DTMfetchdow{mydate}}};%
      \node[anchor=north west,right=46pt of day,yshift=9pt] (year) {\color{date-color}\zihao{4}#1 年};%
      \node[right=8.0cm of day.west,anchor=center] (location) {\color{map-color}\map\ \ifx\diary@province\empty\else\diary@province•\fi\diary@city};%
      \node[right=10.5cm of day.west] {\color{weather-color}\huge\diary@weather};%
      \node at ($(current page text area.south)+(0.25\textwidth+16pt,-8pt)$) {\color{date-color}第\thediary 篇};%
    \fi%
  \end{tikzpicture}%
}%
% \DTMshortweekdayname{\DTMfetchdow{mydate}}
% \DTMfetchdow{mydate} 从通过 \DTMsavedate 保存的日期中，提取星期几（0-6，0=周一，6=周日）。

% 标题页字体
\def\diary@differentTitleCJKFont{}
\def\diary@differentTitleFont{}
\newcommand\TitleCJKFont[1]{%
  \newCJKfontfamily\diary@titleCJKfont{#1}%
  \def\diary@differentTitleCJKFont{1}%
}%
\newcommand\TitleFont[1]{%
  \newfontfamily\diary@titlefont{#1}%
  \def\diary@differentTitleFont{1}%
}%

% titlepage
\renewcommand\maketitle{%
  % 覆盖原来的背景
  \begin{tikzpicture}[remember picture,overlay]
    % draw frame
    \draw[rounded corners=10pt,fill=titlepage-color,drop shadow={shadow xshift=\ShadowXshift, shadow yshift=\ShadowYshift}]
      ([xshift=-30pt,yshift=20pt+2.5cm]current page text area.north west) rectangle
      ([xshift=-2pt,yshift=-20pt]current page text area.south);
    % draw middle spiral
    \foreach \Valor in {0,1,...,\numexpr\SpiralNumber-1\relax}
      \pic at \SpiralPosition {spiral};
  \end{tikzpicture}%
  \begin{center}
    \ifx\diary@differentTitleCJKFont\empty\else\diary@titleCJKfont\fi%
    \ifx\diary@differentTitleFont\empty\else\diary@titlefont\fi%
    {\zihao{0}\@title}\par%
    \vspace{5em}%
    {\zihao{2}\hspace*{0em}\@author}\par%
    \vspace{7em}%
    \ifx\diary@beginMonth\empty%
      某月某日\par%
      \hspace*{-1.5em}至\hspace{0.5em}%
      那月那日%
    \else%
      \ifx\diary@beginYear\empty%
      \else%
        \diary@beginYear 年%
      \fi%
      \diary@beginMonth 月\diary@beginDay 日\par%
      \hspace*{-1.5em}至\hspace{0.5em}%
      \ifx\diary@endYear\empty%
      \else%
        \diary@endYear 年%
      \fi%
      \diary@endMonth 月\diary@endDay 日%
    \fi%
  \end{center}
  \newpage%
}%