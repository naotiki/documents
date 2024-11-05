#let header(class, title, subtitle, grade) = {
  if class != none {
    align(
      center,
      text(14pt)[
        #text[*#class*]
      ],
    )
  }
  align(
    center,
    text(20pt)[
      #text[*#title*]
    ],
  )
  if subtitle != none {
    align(
      center,
      text(14pt)[
        #text[*#subtitle*]
      ],
    )
  }
  align(center)[
    #table(
      columns: (auto, auto),
      align: (right, left),
      stroke: none,
      [学籍番号], [22-413],
      [所属], [情報工学科],
      [学年], [#grade 年],
      [氏名], [川崎 直紀],
    )
  ]
}