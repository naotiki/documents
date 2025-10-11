#set text(font: "BIZ UDPGothic")
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "BIZ UDPGothic")
#let def = $op(arrow.l.r.double.long,
     limits: #true)_("def")$

#set heading(numbering: "1.")
#show selector(heading.where(level: 2)).or(heading.where(level: 3)).or(heading.where(level: 4)): set heading(
  numbering: (..nums) => [(#nums.pos().slice(1).map(v=>[#v]).join("-"))],
)

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
$ a in A ; [a] = {b in A | (a,b) in R} $
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
  &arrow.l.r.double f"が全射"
$
== 単射 (写像が単射であるための条件)
$
  &f:A arrow B \
  &a_1, a_2 in A; f(a_1) = f(a_2) arrow.r.double a_1 = a_2 \
  &arrow.l.r.double f"が単射"
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
同じ値を入れたら結果は同じ
= 関数 $f:ZZ_13 arrow ZZ_13$は$f([a])=[3a+2]$で定義されている。$f$が単射であれば証明せよ。(矛盾なく定義されているかも含めて示せ)
まず、矛盾なく定義されているかを示す。\
$[a] = [b] arrow.double f([a]) = f([b])$を示せばよい。\
$
  &[3a+2] = [3b+2] "を証明するには"\
  &arrow 3a+2 equiv 3b+2 (mod 13) \
  &arrow 3a+2 - 3b-2 = 13l space (l in ZZ) "を示せば良い"\
  &(3a+2)-(3b+2) = 3a+2 - 3b-2 = 3(a-b) \
  &"仮定より" a equiv b (mod 13) arrow.double a - b = 13k\
  &therefore 3(a-b) = 13(3k) space (k in ZZ) qed
$
$f$が単射であることを示すため$[a],[b] in  ZZ_13$に対して$f([a])=f([b])$ならば$[a]=[b]$を示す。

仮定より、$3a+2 equiv 3b+2 (mod 13)$である。\
これより、
$
  &(3a+2) - (3b+2) = 13k therefore 3(a-b) = 13k\
  &arrow (a-b) = 13(a-b) - 4 times bold(3(a-b)) = 13(a-b) - 4 times 13k\
  &=13(a - b - 4k) \
  &therefore a equiv b (mod 13) \
  &arrow [a] = [b]\
  &"よって、fは単射" qed
$
= $f(x)=frac(a x+b,c x +d) space(a d - b c eq.not 0,c eq.not 0)$で定義される関数 \ $
                                                                             f:RR - {frac(-d,c)} arrow RR - {frac(a,c)} $ は全単射であることを示し、$f^(-1)$を求めよ。

== 単射
$f(x_1) = f(x_2)$とする
$
  &f(x_1) = frac(a x_1 + b, c x_1 + d) \
  &f(x_2) = frac(a x_2 + b, c x_2 + d) \
  &(a x_1 +b)(c x_2 + d) = (a x_2 + b)(c x_1 + d) \
  &arrow a x_1 c x_2 + b c x_2 + a d x_1 + b d = a x_2 c x_1 + b c x_1 + a d x_2 + b d \
  &arrow b c x_2 + a d x_1 - b c x_1 - a d x_2 = 0 \
  &arrow b c (x_2 - x_1) - a d (x_2 - x_1) = 0 \
  &arrow (b c - a d)(x_2 - x_1) = 0 \
  &"仮定より" b c - a d eq.not 0 \
  &arrow x_1 = x_2 qed
$
== 全射
$y=dots$を$x=dots$の式にする
$
  &y = frac(a x + b, c x + d) \
  &(c x + d)y = c x y + d y = a x + b\
  &arrow d y - b = a x - c x y = x(a-c y)\
  &therefore x = frac(d y - b, a - c y)
$
となる。
次に$x in RR - {frac(-d,c)}$かどうかを背理法で確かめる。
$
  &x = frac(-d,c)"と仮定する" \
  &frac(-d,c) = frac(d y - b, a - c y) \
  &arrow -d(a-c y) = c(d y - b) \
  &arrow -a d + c d y = c d y - b c \
  &arrow a d -b c = 0 "となり定義と矛盾" qed
$
== $f^(-1)$
$
  &f(x) = frac(a x + b, c x + d) = y\
  &f(f^(-1)(y)) = frac(a f^(-1)(y) + b, c f^(-1)(y) + d) = y\
  &arrow f^(-1)(y) = frac(d y - b, a - c y) space qed
$

= 以下を示せ
== 写像が全単射であることと逆写像が存在することは同値である
=== 写像が全単射ならば逆写像は存在する
写像 $f:A arrow B$において、\
$f$は全射より\
$forall b in B;exists a in A; (a,b) in f$\
$f$は単射より$a$は一つに定まる。よって
$
  &forall b in B; exists ! a in A; (b,a) in f^(-1) \
  &therefore "逆写像が存在する" qed
$
=== 逆写像が存在するならば写像が全単射である
つまり、$f: A arrow B$に対して、\
$f^(-1)$が写像$arrow.double f$は全単射\
を示す。\
$f^(-1)$が写像なので
$
  forall b in B ; f(f^(-1)(b))&=i_b (b)\
  &=b
$
よって、$f$は全射。

次に、$f$が単射であることを示す。\
$
  f(a_1) &= f(a_2) \
  f^(-1)(f(a_1)) &= f^(-1)(f(a_2)) \
  a_1 &= a_2
$
よってfは単射
== 2つの全射を合成すると全射になる。2つの単射を合成すると単射になる。
$g: A arrow B, f: B arrow C$とする。
=== 2つの全射を合成すると全射になる
$
  forall c in C; exists b in B; f(b) = c \
  forall b in B; exists a in A; g(a) = b \
  therefore f circle g(a) = f(g(a)) = c space qed
$
=== 2つの単射を合成すると単射になる
$
  &f(g(a_1)) = f(g(a_2)) space (f"は単射")\
  &arrow.double g(a_1) = g(a_2) space (g"は単射")\
  &arrow a_1 = a_2 qed
$

= $f$は$X arrow X$の写像である。以下の問に答えよ。
== $f circle f = i_x arrow.double f$は全単射である
=== $f circle f = i_x arrow.double f$は単射 を示す
$f(x_1) = f(x_2)$と仮定すると
$
  f(f(x_1)) = f(f(x_2)) \
  f circle f = i_x "より"\
  f(f(x_1)) = x_1 \
  f(f(x_2)) = x_2 \
  x_1 = x_2 qed
$
=== $f circle f = i_x arrow.double f$は全射 を示す
$
  f circle f = i_x "より"\
  f(f(x)) = x qed
$
== $f circle f = i_x arrow.double f^(-1) = f$
(1)より$f"は全単射" therefore f^(-1)"は写像"$
よって、
$
  f^(-1) circle f = i_x = f circle f \
  f circle f = i_x \
  f^(-1)(f circle f) = f^(-1) circle i_x = f^(-1) \
  f^(-1)(f circle f) = (f^(-1) circle f) circle f = i_x circle f = f\
  f^(-1) = f space qed
$
== $X={1,2,3}$とするとき、$f circle f = i_x$となる$f$の例を2つ挙げよ
$
  f(x) = x \
  f(x) = 4 - x
$
#pagebreak()
= 以下の概念を表す記号を書け
== $a$は集合$A$の要素である
$a in A$
== $R$は$A$と$B$の積集合の部分集合である
$R subset.eq A sect B$
== 集合$A$の任意の要素$n$に対して、$n$は3より大きい
$forall n in A;n>3$
== 集合$A$の任意の要素$a$に対して、集合$B$の要素$b$がただ一つ存在して$a$は$b$より大きい
$forall a in A;exists 1 b in B; a > b$

= $NN$上の順序関係 $prec.eq$を次にように定める$
a prec.eq b def a | b
$ 任意の$x,y in NN$に対してこの順序関係$prec.eq$に関する上限 $sup{x,y}$は$x$と$y$の最小公倍数であることを示せ
$sup{x,y} = z$とおくと\
$x prec.tilde z, y prec.tilde z$である。\
$arrow x | z,y|z$となるため、$z$は$x$と$y$の公倍数である。\
$z'$を$x,y$の公倍数とする。\
$x | z',y|z'$であるので\
$x prec.tilde z',y prec.tilde z'$\
よって$z'$は$x$と$y$の上界である\
$z$は最小の上界であるため、\
$z prec.tilde z' therefore z lt.eq z'$\
よって$z$は$x$と$y$の最小公倍数である\

= 以下の問に答えよ
== 任意の有限集合$A,B$に対して、$
  A approx.eq B def "AからBへの全単射が存在する"
$ とする。このとき、$A approx.eq B$は同値関係であることを示せ
=== 反射律 $A approx.eq A$ ?
恒等写像があるので、全単射。
=== 対象律 $A approx.eq B arrow.r.double B approx.eq A$ ?
全単射$f:A arrow B$があるとき、$f^(-1):B arrow A$が全単射なのでOK$qed$
=== 推移律 $ cases(
    delim:"(",
    reverse: #true,
    A approx.eq B,
    B approx.eq C,
  ) arrow.double A approx.eq C quest
$
$f:A approx.eq B, g:B approx.eq C$\
$f,g$が全単射ならば、$f circle g$も全単射なのでOK\

== ある集合の部分集合 $A,B$に対して、$
  A lt.eq B def A subset.eq B
$ とする。
=== $lt.eq$ は順序関係であることを示せ
==== 反射律
$A=A$より$A subset.eq A$ \
OK
==== 反対称律
$A subset.eq B and B subset.eq A$なら$A=B$
よって反対称律を満たす
==== 推移律
$A subset.eq B $のとき$forall a in A ;a in B$
$B subset.eq C$のとき$forall b in B ;b in C$
よって $forall a in A ;a in C$\
$A subset.eq C$\
よって推移律を満たす
=== $inf{A,B} = A sect B$を示せ
$A,B subset.eq X$とおく\
$inf{A,B}=max{Y subset.eq X | Y subset.eq A and Y subset.eq B}$\
・$A sect B$は${A,B}$の下界か？\
$(because) A sect B subset.eq A and A sect B subset.eq B$より真\

よって$
  inf{A,B} = max{Y subset.eq (A union B) | Y subset.eq A and Y subset.eq B} \
$
・$Y$が${A,B}$の下界$arrow.double Y subset.eq A sect B$か\
$
  (because) "仮定より" Y subset.eq A and Y subset.eq B \
  arrow Y subset.eq A sect B \
$
よって
$
  inf{A,B} = max{Y subset.eq (A union B) | Y subset.eq A sect B} \
$
また $A sect B subset.eq A union B$より
$
  inf{A,B} &= max{Y subset.eq A sect B } \
  &= A sect B qed
$

