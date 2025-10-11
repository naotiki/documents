
#import "./tips.typ": tips
#set text(font: "BIZ UDPGothic", 11pt)

#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "BIZ UDPGothic")

#show math.sum: it => math.display(it, cramped: false)

#let C(n, k) = [$attach(C, bl: n, br: k)$]
#let nCk = C($n$, $k$)
#let Xavg = math.overline("X")
#let xavg = math.overline("x")
#let ph = math.accent("p", math.hat)
#let Ph = math.accent("P", math.hat)
= 確率分布

#table(
  columns: (auto, 1fr),
  rows: 3em,
  align: horizon + center,
  [], [連続型],
  [確率分布], [$P(a<=X<=b) = integral_a^b f(x) d x$],
  [平均 $E[X]$], [$integral_(-infinity)^infinity x f(x) d x$],
  [分散 $V[X]$], [$E[(X-mu)^2] = integral_(-infinity)^infinity (x - E[X])^2 f(x) d x$],
)

#tips(title: [平均と分散の性質])[
  - $E[a X + b] = a E[X] + b$
  - $V[X] = E[X^2] - (E[X])^2$
  - $V[a X + b] = a^2 V[X]$
]

== 正規分布
$
  f(x) & = frac(1, sqrt(2 pi) sigma) exp(-frac((x-mu)^2, 2 sigma^2)) \
       & = N(mu, sigma^2)
$
※ $exp(A) = e^A$
#tips(title: [正規分布])[
  正規分布 *$N(mu, sigma^2)$*において
  - 平均 $E[X] = mu$
  - 分散 $V[X] = sigma^2$
]

#tips(title: [上側確率・下側確率の性質])[
  #set enum(numbering: "(I)", spacing: 1.25em, tight: false, number-align: center + horizon)
  一般の確率分布で成立
  + $P(X> - infinity) = 1$
  + $P(a<= X <= b)= P(X>=a)-P(X>=b)$
  + $P(X<=c) = 1 - P(X>=c)$
  #line(length: 100%, stroke: gray)
  正規分布など $X = mu$に関して対象な分布で成立
  #set enum(start: 4)
  + $P(X<=mu-a) = P(X>=mu+a)$
]

#tips(title: [正規分布の標準化])[
  $X$が$N(mu, sigma^2)$のとき、$X$を標準化した$Z = frac(X - mu, sigma)$は標準正規分布$N(0, 1)$に従い

  $
    P(X<=c) = P(Z <= frac(c - mu, sigma))
  $
]

== 確率変数の関数
#tips(title: [平均・分散の性質])[
  - $E[a X_1 + b X_2 +c ] = a E[X_1] + b E[X_2] + c$
  #line(length: 100%, stroke: gray)
  $X_1$と$X_2$が独立なら
  - $E[X_1 X_2] = E[X_1] E[X_2]$
  - $V[a X_1 +b X_2] = a^2 V[X_1] + b^2 V[X_2]$
]

=== ※独立とは
$
  P(a<= X_1 <= b, c<= X_2 <= d) = P(a<= X_1 <= b) P(c<= X_2 <= d)
$
が成り立つこと


== 統計量
#tips(title: [統計量])[
  - 標本平均 $Xavg = frac(1, n)sum_(i=1)^n X_i (= frac(X_1+X_2+ dots.c +X_n, n))$

  - 標本分散 $S^2 = frac(1, n) sum_(i=1)^n (X_i - Xavg)^2$

  - 普遍分散 $U^2 = frac(1, n-1)sum_(i=1)^n (X_i-Xavg)^2 = frac(n, n-1)S^2$
]
#tips(title: [標本平均の平均と分散])[
  母平均が$mu$、母分散が$sigma^2$の母集団から大きさ$n$の標本を抽出したとき、その標本平均$Xavg$の平均と分散は
  - $E[Xavg] = mu$
  - $V[Xavg] = frac(sigma^2, n)$

]

#tips(title: [中心極限定理])[
  確率変数$X_1,X_2, dots ,X_n$が互いに独立で、平均$mu$、分散$sigma^2$の同じ分布に従うとする。この場合、$n$が大きいとき、標本平均$Xavg$は近似的に正規分布 $N(mu,frac(sigma^2, n))$に従う
]

#tips(title: [t分布])[
  一般に、$T$ が自由度 $n$ の $t$ 分布に従うとき、ある $a space(0<a<1)$ に対し、
  $
    P(T >= t_(n)(alpha)) = alpha
  $
  となる $t_(n)(alpha)$ を 自由度$n$の$t$ 分布の上側 $alpha$ 点という。
]
#pagebreak()
= 推定、検定

#tips(title: [母平均の区間推定])[
  === 標本が大きい場合
  大きさ$n$の無作為標本の標本平均の実現値を$xavg$、普遍分散の実現値を$u^2$とする。
  十分に$n$が大きい場合、母平均$mu$は確率$1 - alpha$で次の区間に含まれる。
  $
    xavg - z_(alpha/2) sqrt(frac(u^2, n)) <= mu <= xavg + z_(alpha/2) sqrt(frac(u^2, n))
  $
  $
    P(Z>z_(alpha/2)) = frac(alpha, 2) space "(逆分布関数表を用いて求める)"
  $
  #line(length: 100%, stroke: gray)
  === 標本が小さい場合(nが大きくない場合)
  正規母集団$N(mu, sigma^2)$に対して、大きさ$n$の無作為標本の標本平均の
  実現値を$xavg$、不偏分散の実現値を$u^2$とすると、母平均$mu$の信頼係数
  $1 - alpha$の信頼区間は次のようになる。
  $
    xavg - t_(n-1)(frac(alpha, 2)) sqrt(frac(u^2, n)) <= mu <= xavg + t_(n-1)(frac(alpha, 2)) sqrt(frac(u^2, n))
  $
]

#tips(title: [母比率の区間推定])[
  *二項母集団*から大きさ$n$の無作為標本を抽出し、その標本比率(標本平均)の実現値を$ph$とする。十分に$n$が大きいとき、母比率 $p$の信頼係数$1 - alpha$の信頼区間は次のようになる。
  $
    ph - z_(alpha/2) sqrt(frac(ph(1-ph), n)) <= p <= ph + z_(alpha/2) sqrt(frac(ph(1-ph), n))
  $
]

= 仮説と検定
+ 有意水準$alpha$を定める。
+ 帰無仮説$H_0$と対立仮説$H_1$を設定する。
+ $H_0$を仮定して、検定統計量$X$の実現値xを求める。
+ $p$値を求めて$H_0$を棄却するかどうかを決定する。
  - $p$値は、$X$が$x$より外れる確率
  - $p$値が有意水準$alpha$以下ならば、帰無仮説を棄却する。
// 第1種の誤り、第2種の誤り
#table(
  columns: (auto, 1fr, 1fr),
  rows: 3em,
  align: horizon + center,
  [], [$H_0$が真], [$H_0$が偽($H_1$が真)],
  [$H_0$を受容], [正しい], [第2種の誤り],
  [$H_0$を棄却], [第1の誤り], [正しい],
)

== いろいろな検定
= 仮説と検定
+ 有意水準$alpha$を定める。
+ 帰無仮説$H_0$と対立仮説$H_1$を設定する。
+ $H_0$を仮定して、検定統計量$X$の実現値xを求める。
+ $p$値を求めて$H_0$を棄却するかどうかを決定する。
  - $p$値は、$X$が$x$より外れる確率
  - $p$値が有意水準$alpha$以下ならば、帰無仮説を棄却する。
// 第1種の誤り、第2種の誤り
#let frac(..args) = [#math.frac(..args)<explicit-frac>]
#show math.frac: it => {
  if it.has("label") and it.label == <explicit-frac> {
    it
  } else {
    it.num + sym.slash + it.denom
  }
}

#table(
  columns: (auto, auto,auto),
  rows: 3em,
  align: horizon + center,
  [], [検定統計量], [確率分布],
  [母平均(正規母集団で母分散が未知)], [
    $
      T = frac(Xavg - mu, sqrt(U^2/ n)) \
    $
  ], [自由度 $n-1$の$t$分布],
  [母平均の差(正規母集団で母分散が未知)], [
    $
      T = frac(Xavg_1 - Xavg_2, sqrt(U^2_1/ n_1 + U^2_2/ n_2)) \
    $
  ],[近似的に自由度dの$t$分布], [母比率],
   [
    $
      Z = frac(Ph - p_0, sqrt(p_0 q_0 / n)) \
    $
  ], [近似的に標準正規分布],
  
)

$
  d = frac((U^2_1/ n_1 + U^2_2/ n_2)^2, frac((U^2_1/ n_1)^2,n_1-1) + frac((U^2_2/ n_2)^2,n_2-1))
$