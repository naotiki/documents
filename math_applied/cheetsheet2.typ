#import "tips.typ": tips
#set text(font: "BIZ UDPGothic", 11pt)

#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "BIZ UDPGothic")

#show math.sum: it => math.display(it, cramped: false)

#let red(x) = text(fill: color.red, $#x$)

#let Fo = math.cal("F")

#show math.equation: set text(size: 15pt)
#tips(title: [周期$2 pi$の関数のフーリエ級数])[
  $
    f(x) & = c_0 + sum_(n=1)^infinity (a_n cos n x + b_n sin n x) \
     c_0 & = frac(1, 2 pi) integral_(-pi)^pi f(x) d x             \
     a_n & = frac(1, pi) integral_(-pi)^pi f(x) cos n x d x       \
     b_n & = frac(1, pi) integral_(-pi)^pi f(x) sin n x d x       \
  $
]







#tips(title: [周期$2 l$の関数のフーリエ級数])[
  $
    f(x) & = c_0 + sum_(n=1)^infinity (a_n cos frac(n pi x, l) + b_n sin frac(n pi x, l)) \
     c_0 & = frac(1, 2 l) integral_(-l)^l f(x) d x                                        \
     a_n & = frac(1, l) integral_(-l)^l f(x) cos frac(n pi x, l) d x                      \
     b_n & = frac(1, l) integral_(-l)^l f(x) sin frac(n pi x, l) d x                      \
  $
]

== 注意
/ $f(x)$が奇関数: $c_0 = 0, a_n = 0$ となるので、$b_n$のみ計算
/ $f(x)$が偶関数: $b_n=0$ となるので、$c_0, a_n$のみ計算
※フーリエ係数の式 $c_0,a_n,b_n$ の式は覚えなくていい。試験では与えられる。

#tips(title: [複素フーリエ級数])[
  $
    f(x) & = sum_(n=-infinity)^infinity c_n e^(i frac(n pi x, l))              \
     c_n & = frac(1, 2 l) integral_(-l)^l f(x) e^(red(-)i frac(n pi x, l)) d x \
  $
  $c_0$だけ$n=0$を代入して別で計算する場合が多い。
]


#pagebreak()
#tips(title: [フーリエ変換])[
  $
    F(u) = Fo[f(x)] = integral_(-infinity)^infinity f(x) e^(red(-)i u x) d x \
  $
]
#tips(title: [反転公式])[
  $
    f(x) = Fo^(-1)[F(u)] = frac(1, 2 pi) integral_(-infinity)^infinity F(u) e^(i u x) d u \
  $
]

#tips(title: [余弦変換、正弦変換])[
  $f(x)$が偶関数
  $
    F(u) = 2 integral_0^infinity f(x) cos u x d x \
    f(x) = frac(1, pi) integral_0^infinity F(u) cos u x d u \
  $
  #line(length: 100%, stroke: 1pt + gray)
  $f(x)$が奇関数、$S(u) = i F(u)$とする。
  $
    S(u) = 2 integral_0^infinity f(x) sin u x d x \
    f(x) = frac(1, pi) integral_0^infinity S(u) sin u x d u \
  $
]

#tips(title: [フーリエ変換の性質])[
  #set enum(numbering: "(I)", spacing: 1.25em, tight: false, number-align: center + horizon)
  + $Fo[c_1f_1(x)+c_2f_2(x)] = c_1F_1(u)+c_2F_2(u)$
  + $Fo[f(x-a)] = e^(-i a u)F(u)$
  + $Fo[e^(i a x)f(x)] = F(u-a)$
  + $Fo[f(a x)] = frac(1, abs(a))F(frac(u, a))$
  + $Fo[f^((n))(x)] = (i u)^n F(u)$
  + $Fo[(-i x)^n f(x)] = F^((n))(u)$
]
#pagebreak()
#tips(title: [たたみこみ])[
  $
    (f * g)(x) = f(x) * g(x) = integral_(-infinity)^infinity f(x red(-xi)) g(red(xi)) d red(xi) \
  $
]

#tips(title: [たたみこみのフーリエ変換])[
  $
    Fo[f(x) * g(x)] = F(u) G(u) \
  $
]
#pagebreak()

= 念の為書いておく
#tips(title: [オイラーの公式])[
  $
    e^(i theta) = cos theta + i sin theta
  $
  #line(length: 100%, stroke: 1pt + gray)
  $
    cos theta = frac(e^(i theta)+e^(-i theta), 2) \
    sin theta = frac(e^(i theta)-e^(-i theta), 2 i) \
  $
]

#tips(title: [加法定理])[
  $
    sin(alpha plus.minus beta) = sin alpha cos beta
    plus.minus cos alpha sin beta \
    cos(alpha plus.minus beta) = cos alpha cos beta
    minus.plus sin alpha sin beta \
  $
  #line(length: 100%, stroke: 1pt + gray)
  $
    sin alpha cos beta & =frac(1, 2){sin(alpha+beta)+sin(alpha-beta)}  \
    cos alpha sin beta & =frac(1, 2){sin(alpha+beta)-sin(alpha-beta)}  \
    cos alpha cos beta & =frac(1, 2){cos(alpha+beta)+cos(alpha-beta)}  \
    sin alpha sin beta & =-frac(1, 2){cos(alpha+beta)-cos(alpha-beta)}
  $
]

