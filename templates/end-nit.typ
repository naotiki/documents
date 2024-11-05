#let end_nit() = {
  set text(font: "BIZ UDPGothic", size: 13pt, lang: "ja")
  block(
    [
      #set align(center + horizon)
      #text(30pt)[終]\
      制作・著作\
      #line(length: 3cm)
      #stack(dir: ltr)[
        #circle[
          #set align(center + horizon)
          _N_
        ]
      ][
        #circle[
          #set align(center + horizon)
          _I_
        ]
      ][
        #circle[
          #set align(center + horizon)
          _T_
        ]
      ]
    ],
  )
}