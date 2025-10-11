#set text(font: "BIZ UDPGothic", 11pt)
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "BIZ UDPGothic")

#show math.sum: it => math.display(it, cramped: false)

#let La = math.cal("L")

#show math.equation: set text(size: 15pt)
= ラプラス変換表
#[
  #show math.equation: set text(size: 20pt)
  #table(
    columns: (1fr, 1fr),
    rows: 3.5em,
    align: center + horizon,
    [原関数], [像関数],
    [$1$], [$frac(1, s)$],
    [$t$], [$frac(1, t^2)$],
    [$t^n$], [$frac(n!, s^(n+1))$],
    [$e^(alpha t)$], [$frac(1, s-alpha)$],
    [$t e^(alpha t)$], [$frac(1, (s-alpha)^2)$],
    [$t^n e^(alpha t)$], [$frac(n!, (s-alpha)^(n+1))$],
    [$sin omega t$], [$frac(omega, s^2+omega^2)$],
    [$cos omega t$], [$frac(s, s^2+omega^2)$],
    [$e^(alpha t) sin omega beta$], [$frac(beta, (s-alpha)^2 + beta^2)$],
    [$e^(alpha t) cos omega beta$], [$frac(s-alpha, (s-alpha)^2 + beta^2)$],
    [$t sin omega t$], [$frac(2 omega s, (s^2+omega^2)^2)$],
    [$t cos omega t$], [$frac(s^2-omega^2, (s^2+omega^2)^2)$],
    [$sinh omega t$], [$frac(omega, s^2-omega^2)$],
    [$cosh omega t$], [$frac(s, s^2-omega^2)$],
    [$U(t-a)$], [$frac(e^(-a s), s)$],
    [$delta(t)$], [$1$],
  )
]

#pagebreak()

= ラプラス変換の法則・性質
== 相似性
$ La[f(a t)] = frac(1, a)F(s / a) $
=== 証明
$
  a t = tau "とおき、置換積分" \
  La[f(a t)] = integral_0^infinity e^(-s t) f(a t) d t =
  frac(1, a)integral_0^infinity e^(-frac(s, a) tau) f(tau) d tau
$
== 像関数の移動法則
$ La[e^(a t)f(t)] = F(s - a) $
=== 証明
$
  La[e^(a t)f(t)] = integral_0^infinity e^(-s t) e^(a t) f(t) d t =
  integral_0^infinity e^(-s t + a t) f(t) d t =
  integral_0^infinity e^(-(s-a)t) f(t) d t
$

== 原関数の移動法則
$ La[f(t-mu) U(t-mu)] = e^(-mu s)F(s) $
=== 証明
$
  La[f(t-mu) U(t-mu)] &= integral_mu^infinity e^(-s t) f(t-mu) d t\
  &= integral_0^infinity e^(-s (tau + mu)) f(tau) d tau \
  &= e^(-mu s) integral_0^infinity e^(-s tau) f(tau) d tau \
$

== 原関数の微分法則
$
  &La[f'(t)] = s F(s) - f(0) \
  &La[f''(t)] = s^2 F(s) - f(0)s - f'(0) \
  &La[f^((n))(t)] = s^n F(s) - f(0)s^(n-1) - f'(0)s^(n-2) - dots.c
  - f^((n-1))(0) wide "(高次)" \
$

== 像関数の微分法則
$
  La[t f(t)] &= -F'(s)\
  La[t^n f(t)] &= (-1)^n F^((n))(s) wide"(高次)"
$

== 原関数の積分法則
$
  La[integral_0^t f(tau) d tau] = frac(F(s), s) \
$

== 像関数の積分法則
$
  La[frac(f(t), t)] = integral_s^infinity F(sigma) d sigma \
$

= 微分方程式を解く
- 両辺の$La$を求めて $X(s) = dots$の形にし、逆ラプラス変換を行う。
= たたみこみ
区間 $[0, infinity)$で定義された2つの関数$f(t)$と$g(t)$のたたみこみは
$
  integral_0^t f(tau) g(t-tau) d tau = (f * g)(t) = f(t) * g(t)
$
== たたみこみのラプラス変換
$
  La[f(t) * g(t)] = La[f(t)] La[g(t)]
$
#pagebreak()
= 伝達関数・デルタ(#sym.delta)関数
定数係数非斉次線形微分方程式
$ y'' + a y' + b y = x(t), thick y(0)=0, thick y'(0) = 0 wide "(1)" $
において、$x(t)$を入力、$y(t)$を出力という。
(1)をラプラス変換すると、
$
  &s^2 Y(s) + a s Y(s)+ b Y(s) = X(s)\
  &therefore Y(s) = frac(X(s), s^2 + a s + b)
$
ここで
$
  H(s) = frac(1, s^2 + a s + b)
$
とおくと、$y(t)$は
$
  y(t) &= La^(-1)[H(s) X(s)]\
  &= La^(-1)[La[h(t)]La[x(t)]]\
  &= La^(-1)[La[h(t) * x(t)]] \
  &= h(t) * x(t)
$
$H(s)$は(1)の表す線形システムの*伝達関数*という。

== デルタ関数
デルタ関数は、$t=0$で無限大の値をとり、他の点では0となる関数である。
$
  delta(t) = lim_(epsilon arrow +0) phi_epsilon (t) = cases(
    infinity thick (t = 0),
    0 thick (t != 0)
  )
$
ラプラス変換すると1になる。
$
  La[delta(t)] = 1
$

#pagebreak()
= 加法定理復習コーナー
$
  sin(alpha plus.minus beta) = sin alpha cos beta
  plus.minus cos alpha sin beta \
  cos(alpha plus.minus beta) = cos alpha cos beta
  minus.plus sin alpha sin beta \
$
以上より以下が導出できる
$
  sin alpha cos beta&=frac(1, 2){sin(alpha+beta)+sin(alpha-beta)}\
  cos alpha sin beta&=frac(1, 2){sin(alpha+beta)-sin(alpha-beta)}\
  cos alpha cos beta&=frac(1, 2){cos(alpha+beta)+cos(alpha-beta)}\
  sin alpha sin beta&=-frac(1, 2){cos(alpha+beta)-cos(alpha-beta)}
$