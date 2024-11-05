

#let expr_report(date: datetime.today(),doc) = {
  let mainfont = "BIZ UDPMincho"
  show link: underline
  set text(font: mainfont, size: 10pt, lang: "ja")
  let title(body) = {
    set align(center)
    set block(spacing: 0.6em)
    set text(22pt, weight: "bold", font: mainfont)
    block(body)
  }
  set page(
    paper: "a4",
    columns: 1,

    margin: (
      left: 1.905cm,
      right: 1.905cm,
      top: 4.04cm,
      bottom: 2.54cm,
    ),

    numbering: "1",
    number-align: center + bottom,
    header: [
      #align()[
        #title(
          box[
            作業報告書 (#date.display("[year]年 [month]月 [day]日"))
          ],
        )
        #align(right + horizon)[
          #set text(15pt)
          #block[j22413 川崎 直紀]
        ]
      ]
    ],


    header-ascent: 15%,

    footer-descent: 0%,
    background: [
      #rect(stroke: rgb("#000000"), width: 100% - (1.905cm), height: 100% - (2.54cm))
    ],
  )
  doc
}


