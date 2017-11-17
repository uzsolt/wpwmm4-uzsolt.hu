_LAYOUT(`note.m4',_title,`Véletlenszerű sorrend',_subtitle,`exsheets shuffle')
_INCL(`highlight.m4')
<p>Az <a href=http://ctan.org/pkg/exsheets>exsheets</a> csomag által
biztosított feladatsor-sablonban a feladatok sorrendje véletlenszerűen
változtatható az alábbi kódsor alapján (a
<a href=https://www.ctan.org/pkg/ran_toks>ran_toks</a> csomag
segítségével):</p>
_highlight(`\documentclass{article}
\usepackage{exsheets}
\usepackage{ran_toks}
\begin{document}
\ranToks{exercises}{
  {
    \begin{question}
      First question.
    \end{question}
  }{
    \begin{question}
      Second question.
    \end{question}
  }{
    \begin{question}
      Third question.
    \end{question}
  }
}
\useRTName{exercises}
\useRanTok{1}
\useRanTok{2}
\useRanTok{3}
\end{document}',`tex')
