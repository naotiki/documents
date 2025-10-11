#import "@preview/tablex:0.0.9": *


#let mainfont = "UDEV Gothic 35NF"

#let color1 = rgb("#6e7b8b") // LightSteelBlue4

#set text(font: mainfont, size: 10pt, lang: "ja", fill: black)

#set page(
  paper: "a4",
  //flipped: true,
  margin: (left: 1cm, right: 1cm, top: 0.5cm, bottom: 0.2cm),
  fill: white,
)

#show heading: it => [
  #set align(center)
  #set text(12pt, weight: "bold", font: mainfont)
  #block(it.body)
  #v(1pt)
]


#let keybind_table(header, e, color1, color2) = {
  box()[
    #tablex(
      columns: (13.2fr, 6.8fr),
      rows: (15pt, auto), // first, repeat for rest
      align: left + horizon,
      row-gutter: 0pt,
      stroke: none,
      auto-lines: false,
      fill: (col, row) => if calc.even(row) { color2 } else { white },
      colspanx(2, fill: color1)[#text(9pt, white)[*#header*]],
      ..e
        .map(row => (
          if row.keys().at(0) == "$twocolumn" {
            colspanx(2, align: center + horizon)[ #row.values().at(0) ]
          } else { (row.keys().at(0), row.values().at(0)) }
        ))
        .flatten(),
      hlinex(stroke: color1 + 2pt), //gutter-restrict: top
    )

  ]
}

#let k = yaml("keyboard.yaml")

= Emacs チートシート

#place(
  top + right,
  [
    #datetime.today().display()
  ],
)

#for j in k {
  let chap = j.keys().at(0)
  let entries = j.values().at(0)
  keybind_table(chap, entries, color1, color1.lighten(65%))
  v(3pt)
  v(1fr)
}
