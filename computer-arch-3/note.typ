#set text(font: "BIZ UDPGothic", 11pt)
#let col = 16
#let b = range(1024, step: 1).map(it => {
  let content = array((str(it, base: 16),))

  if (calc.rem(it, col) == 0) {
    content.insert(0, table.cell(text(str(it), fill: white), fill: black.lighten(30%)))
  }
  return content
})

#[

  #set text(size: 9pt, font: "UDev Gothic 35NF")
  #table(
    columns: (auto, ..((1fr,) * col)),
    inset: 2pt,
    stroke: 0.2pt,
    align: right,
    ..b.flatten()
  )
]
