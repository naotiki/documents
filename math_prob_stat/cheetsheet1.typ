#set text(font: "BIZ UDPGothic")
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "BIZ UDPGothic")

#show math.sum: it => math.display(it, cramped: false)

#let C(n, k) = [$attach(C, bl: n, br: k)$]
#let nCk = C($n$, $k$)
#let loves = math.class(
  "relation",
  sym.suit.heart,
)

= 確率
== 期待値(平均)
$ E = x_1 p_1 + x_2 p_2 + dots.c + x_n p_n wide (sum_(i=1)^n p_i = 1) $
== 条件付き確率
事象Aが起こったという条件のもとで事象Bの起こる条件付き確率
$ P_A (B)= frac(P(A inter B), P(A)) $
== 確率の乗法定理
$ P(A inter B) = P(A)P_A (B) = P(B)P_B (A) $
== 事象の独立
- 事象$A$と事象$B$は互いに独立 $arrow.l.r.double.long P(A inter B) = P(A)P(B)$
- 事象$A_1, A_2, dots.c, A_n$は独立\ $arrow.l.r.double.long A_1, A_2, dots.c, A_n$から任意にとった組 $A_i, A_j, A_k, dots.c$について
$ P(A_i inter A_j inter A_k inter dots.c) = P(A_i)P(A_j)P(A_k) dots.c $
== 反復試行の確率
試行 $T$を1回行うとき、事象$A$の起こる確率を$p$とする。この試行を独立に$n$回行うとき、事象$A$が$k$回起こる確率は

$ nCk p^k q^{n-k} wide (q = 1- p, space k=0,1,2,...,n) $

== ベイズの定理
事象$A_1, A_2, dots.c, A_n$が互いに排反で、\
$ A_1 union A_2 union dots.c union A_n = Omega, P(A_k)>0 wide (k=1,2, dots.c, n) $
とする。\
このとき、$P(B) > 0$である事象$B$について次が成り立つ。

$ P_B (A_k) = frac(P(A_k)P_A_k (B), P(B)) = frac(P(A_k)P_A_k (B), sum_(i=1)^n P(A_i)P_A_i (B)) wide (k=1,2, dots.c, n) $

#pagebreak()
= 1次元
== 平均
$ overline(x) = frac(1, n) sum_(i=1)^n x_i $
== 平均の性質
$y = a x + b$のとき $overline(y) = a overline(x) + b$
== 分散
$
  v_x &= frac(1, n)sum_(i=1)^n (x_i - overline(x))^2 \
  &= overline(x^2) - overline(x)^2
$
== 標準偏差
$ s_x = sqrt(v_x) $
== 分散と標準偏差の性質
- $y=a x+b$のとき
  - $v_y = a^2 v_x$
  - $s_y = |a| s_x$
= 2次元
== 共分散
$s_(x y) = frac(1, n) sum_(i=1)^n (x_i-overline(x))(y_i-overline(y))$
$s_(x y) = overline(x y) - overline(x) thin overline(y)$
== 相関係数
$r = frac(s_(x y), s_x s_y) = frac(sum_(i=1)^n (x_i-overline(x))(y_i-overline(y)), sqrt(sum_(i=1)^n (x_i - overline(x))^2) sqrt(sum_(i=1)^n (y_i - overline(y))^2))$

== 最小二乗法
回帰直線を求めるとき、$y = a x + b$の形で近似する。
最小二乗法では、$n$個のデータ$(x_i, y_i)$に対して、次の式を最小化する。
$ S = sum_(i=1)^n (y_i - (a x_i + b))^2 $
== 回帰直線
回帰直線の方程式を$y = a x + b$ と置くとき

$ a=frac(s_(x y), s_x^2), wide b=overline(y)-a overline(x) $

#pagebreak()

= 確率変数と確率分布

#table(
  columns: (auto, 1fr, 1fr),
  rows: 3em,
  align: horizon + center,
  [], [離散型], [連続型],
  [確率分布], [$P(X=x_i)=p_i$], [$P(a<=X<=b) = integral_a^b f(x) d x$],
  [平均 $E[X]$], [$sum_(i=1)^n x_i p_i$], [$integral_(-infinity)^infinity x f(x) d x$],
  [分散 $V[X]$], [$sum_(i=1)^n (x_i - E[X])^2 p_i$], [$integral_(-infinity)^infinity (x - E[X])^2 f(x) d x$],
)
== 平均と分散の性質
- $E[a X + b] = a E[X] + b$
- $V[a X + b] = a^2 V[X]$
- $V[X] = E[X^2] - (E[X])^2$

== 二項分布 $B(n,p)$
繰り返し行ってもそれぞれの起こる確率が変わらないとき、その試行をベルヌーイ試行という。
ベルヌーイ試行を$n$回行うとき、事象$A$が起こる回数を$X$とすると、$X$は$0,1,2, dots.c, n$の値をとる確率変数になる。1回の試行で事象$A$の起こる確率を$p$とおくと、$X=k$となる確率は
$ P(X=k) = nCk p^k q^(n-k) $

これが成り立つとき、$X$の確率分布を*二項分布*といい、$X$は二項分布$B(n,p)$に従うという。
=== 平均,分散
$ E[X] = n p ,wide V[X] = n p q $
== ポアソン分布 $P_o (λ)$
$ P(X=k) = e^(-lambda) frac(lambda^k, k!) $
で表されるとき、$X$の確率分布を*ポアソン分布*といい、$P_o (λ)$で表す。
=== 平均,分散
$ E[X] = lambda,wide V[X] = lambda $

== 確率密度関数 $f(x)$
確率変数 $X$ が区間 $[x, x + Delta x]$ に入る確率を区間幅で割った量。
積分すると確率になる。
$ f(x) = lim_(Delta x arrow 0) frac(1, Delta x) P(x <= X <=x + Delta x) $

#pagebreak()
= マクローリン展開
無限回微分可能な$f(x)$は以下のように近似できる
$
  f(x) &= f(0) + f'(0)x + frac(f''(0)x^2, 2!) + dots.c \
  &= sum_(k=0)^infinity f^((k))(0) frac(x^k, k!)
$

