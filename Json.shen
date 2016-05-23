\*
Usage:
  (from-json [get hello 0] "{ \"hello\" : [1,2,3,4] }") => 1
  ((from-json [set hello 0] "{ \"hello\" : [1,2,3,4] }") (+ 1)) => [object [(@p hello [2 2 3 4])]]
*\

(load "Json-Lenses.shen")
(load "Json-Parser.shen")