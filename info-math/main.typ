
#set heading(numbering: "1.")
= 記号・用語の定義


== $a equiv b (mod n)$ の定義
$ a equiv b (mod n) arrow.l.r.double n | (a-b) $
== A上の関係Rが反射的、対称的、推移的、反対称的
=== 反射的
$ forall a in A ; (a,a) in R $
=== 対称的
$ (a,b) in R arrow.r.double (b,a) in R $
=== 推移的
$ (a,b) in R and (b,c) in R arrow.r.double (a,c) in R $
=== 反対称的
$ (a,b) in R and (b,a) in R arrow.r.double a = b $
== $A subset.eq B$
$ A subset.eq B arrow.r.double forall a in A;a in B $
== 同値類
RがA上の同値関係であるとき、
$ a in A : [a] = {b in A | (a,b) in R} $
== 対応
$ R in A times B arrow.l.r.double "RはAからBへの対応" $
== 写像 (対応が写像となるための条件)
$
  &"AからBへの写像" \
  &arrow.l.r.double forall a in A; exists! b in B; (a,b) in R
$

== 全射 (写像が全射であるための条件)
$
  &f:A arrow B \
  &forall b in B; exists a in A; (a,b) in f \
  &arrow.l.r.double "fが全射"
$
== 単射 (写像が単射であるための条件)
$
  &f:A arrow B \
  &forall a_1, a_2 in A; f(a_1) = f(a_2) arrow.r.double a_1 = a_2 \
  &arrow.l.r.double "fが単射"
$

== 合成写像
$
  f circle g &"が"f,g"の合成写像" \
  arrow.l.r.double &f: B arrow C, g: A arrow B \
  &forall a in A; f circle g(a) = f(g(a))
$

== 逆写像
$
  g:B arrow A "が"f: A arrow B "の逆写像" \
  b=f(a) arrow.l.r.double a=g(b)
$
== 恒等写像
$
  f:A arrow A; forall a in A; a = f(a) \
$
== $A - B$
$
  A - B = {a in A | a in.not B}
$
== 関係
$
  &R"は"A"から"B"への関係" \
  &arrow.l.r.double R subset.eq A times B
$
== 順序関係
$
  R subset.eq A times A \
  &"(反射的)"\ 
  &forall a in A; (a,a) in R \
  &"(推移的)"\ 
  &(a,b) in R and (b,c) in R arrow.r.double (a,c) in R \
  &"(反対称的)"\
  &forall a,b in A; (a,b) in R and (b,a) in R arrow.r.double a = b\
  &"このとき、"R"は順序関係"
$
== 上界、下界、上限、下限
$
  &"順序集合"(A,lt.eq),a in A "部分集合"B"において" \
  &"上界" \
  & forall b in B, b lt.eq a arrow.l.r.double a"は"B"の上界"\
  &"下界" \
  &forall b in B, a lt.eq b arrow.l.r.double a"は"B"の下界"\
  &"上限" \
  &sup B := min {a in A | a"は"B"の上界"} \ 
  &"下限" \
  &inf B := max {a in A | a"は"B"の下界"} \
$
== 和集合、積集合、直積集合
$
  &"和集合" \
  &A union B := {x | x in A or x in B} \
  &"積集合" \
  &A sect B := {x | x in A and x in B} \
  &"直積集合" \
  &A times B := {(a,b) | a in A and b in B} 
$

== 写像として矛盾なく定義されている
$
  &"対応"f"に対して" \
  &(a,b_1) in f ,(a,b_2) in f arrow.r.double b_1 = b_2 \
$