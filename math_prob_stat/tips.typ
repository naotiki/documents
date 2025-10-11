#let tips(title: content, body) = pad(top: 10pt, block(
  fill: blue.lighten(90%),
  radius: 4pt,
  stroke: 1.5pt + blue.darken(50%),
  width: 100%,
)[
  #place(top + left, dy: -10pt, dx: 10pt)[
    #block(
      fill: luma(200),
      radius: 100%,
      inset: (x:12pt,y:6pt),
    )[
      #box(circle(fill: blue.darken(20%), radius: 4pt, outset: 1.25pt))
      *#title*
    ]

  ]
  #pad(top: 15pt, bottom: 10pt, x: 15pt)[
    #body
  ]
])
