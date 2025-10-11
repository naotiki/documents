#let mainfont = "BIZ UDPGothic"

#set text(font: mainfont, lang: "ja")
#set page(paper: "presentation-4-3", margin: 2cm)

#let verbs = yaml("verbs.yaml")

#let invisibles = ()//("conjugation", "japanese")
#let blank(content, key, width: 100%, height: auto) = {
  if key in invisibles {
    return box(width: width, height: height, fill: gray.transparentize(60%), "")
  }
  set text(fill: orange)
  content
}

= 助動詞
== 助動詞活用表
// 助動詞の配列
#let auxiliaries = (
  verbs.können,
  verbs.müssen,
  verbs.dürfen,
  verbs.wollen,
  verbs.sollen,
  verbs.mögen,
  verbs.möchte,
)
#let row = (
  "ich",
  "du",
  "er/sie/es",
  "wir",
  "ihr",
  "sie",
  "Sie",
)


#table(
  columns: (auto, ..auxiliaries.map(_ => auto)),
  fill: (x, y) => {
    if (y == 1 or y == 3) {
      red.lighten(85%)
    }
    if (y == 2) {
      green.lighten(85%)
    }

    if (y == 5) {
      blue.lighten(85%)
    }

  },
  "",..auxiliaries.map(auxiliary => [*#auxiliary.de*]),
  ..row.map(r => {
    (
      strong(r),
      ..auxiliaries.map(auxiliary => {
        blank(auxiliary.conjugation.at(r), "conjugation")
      }),
    )
  }).flatten(),
  [*意味*],..auxiliaries.map(auxiliary => blank(auxiliary.ja, "japanese")),
)
- ich,erは同じ
- duはich,erに*st*を付ける。\ (mussはmussstではなくmusst)
- ihrは少し変則ありだがその他は -e,-st,-t,-en,-t,-en,-en と同じ
== 助動詞の注意
- 助動詞は2番目の位置、本動詞は最後の位置に置かれる。
- 本動詞は活用しない。分離動詞も分離させない。
*例*
- Peter #underline[*kann*] gut Fußball #underline[*spielen*]. (ピーターはサッカーが上手い。)
== 疑問文
- 2番目の位置にある助動詞と主語を入れ替える。
*例*
- #underline[*Kann*] Peter gut Fußball #underline[*spielen*]? (ピーターは上手にサッカーができるの？)


/* #stack(
dir: ltr,
..auxiliaries.map(word => {
let verb = word
verb-table(verb, highlight: ("ich", "du", "er", "ihr"))
}),
) */

#pagebreak()
#set page(paper: "iso-b5", flipped: true)
#let words = yaml("words.yaml")
#let word_list(words, columns: (auto, auto)) = {
  let chunked = words.chunks(int(calc.round(words.len() / columns.len())))
  grid(
    columns: columns,
    gutter: 3em,
    ..chunked.map(chunk => {
      for w in chunk {
        [- #w.de #h(1fr) #blank(w.ja, "japanese")]
      }
    })
  )
}
= 専攻
== 名詞
#word_list(words.subjects.words)
== 例文
- Was möchtest du an der Uni studieren. (#blank("大学で何を専攻したいですか。","japanese"))
- Ich möchte an der Uni ( ) studieren. (#blank("私は大学で(   )を専攻したいです。","japanese"))
#pagebreak()
= 疑問文
== 名詞
#word_list(words.questions.words)
== 例文
- Wer ist das? (#blank("誰ですか。","japanese"))
- Von wann bis wann studierst du an der Uni? (#blank("いつからいつまで大学で勉強しますか。","japanese"))
= 曜日
== 名詞
#word_list(words.dayOfWeek.words)
== 例文
- Welchen Tag magst du am besten? (#blank("何曜日が一番好きですか。","japanese"))
- Ich mag am besten ( ) (#blank("私は(   )が一番好きです。","japanese"))
#pagebreak()
= 1日の時間
== 名詞
#word_list(words.day.words)
#pagebreak()
= 時間
== 時刻の答え方
Q. Wie spät ist es?  (何時ですか。) \
A. Es ist ( ) *Uhr*.  (( )時です。)\
※Uhrは省略される場合がある。
== offiziell
24h制
- 1:00 (#blank([Es ist #underline[*ein*] Uhr],"de"))
- 8:20 (#blank([Es ist *acht* Uhr *zwanzig*],"de"))
- 10:20 (#blank([Es ist *zehn* Uhr *zwanzig*],"de"))
== inoffiziell
12h制
- 1:00 (#blank([Es ist #underline[*ein*] Uhr],"de"))
- 6:55 (#blank([Es ist *fünf vor* sieben.],"de"))
- 7:05 (#blank([Es ist *fünf nach* sieben.],"de"))
- 9:15 (#blank([Es ist *Viertel nach* neun.],"de"))
- 9:45 (#blank([Es ist *Viertel vor* zehn.],"de"))
- 5:30 (#blank([Es ist *halb sechs*.],"de"))
- 12:00 (#blank([Es ist *zwölf* Uhr],"de"))
- 12:55 (#blank([Es ist *fünf vor* #underline([*eins*]).],"de"))
- 13:29 (#blank([Es ist eins vor halb zwei.],"de"))
#pagebreak()
= 前置詞
- 時間 (#blank([um],"prefix"))
- 曜日 (#blank([am],"prefix"))
- 月 (#blank([im],"prefix"))
- 季節 (#blank([im],"prefix"))
- 西暦 (#blank([*なし*],"prefix"))
= 数字(復習)
- 1-10 (#blank([eins, zwei, drei, vier, fünf, sechs, sieben, acht, neun, zehn],"number"))
- 11-20 (#blank([elf, zwölf, dreizehn, vierzehn, fünfzehn, sechzehn, siebzehn, achtzehn, neunzehn, zwanzig],"number"))
- 21-29 (#blank([einundzwanzig, zweiundzwanzig, dreiundzwanzig, vierundzwanzig, fünfundzwanzig, sechsundzwanzig, siebenundzwanzig, achtundzwanzig, neunundzwanzig],"number"))
- 30 (#blank([dreißig],"number"))
- 40 (#blank([vierzig],"number"))
- 50 (#blank([fünfzig],"number"))
- 60 (#blank([sechzig],"number"))
- 70 (#blank([siebzig],"number"))
- 80 (#blank([achtzig],"number"))
- 90 (#blank([neunzig],"number"))
- 100 (#blank([hundert],"number"))
- 1000 (#blank([tausend],"number"))

#pagebreak()
= 食べ物
== 名詞
#word_list(words.foods.words)
== 例文
- Was schmeckt dir gut? (#blank("何が美味しいですか。","japanese"))
- ( ) schmeckt mir gut. (#blank("(   )が美味しいです。","japanese"))
#pagebreak()
#for word in verbs.values() {
  [= #word.de ]
  let w = word.conjugation.pairs().chunks(3)
  let verbArray = w.at(0).zip(w.at(1))

  verbArray.push((([], []), w.at(2).flatten()))

  [
    #set text(size: 15pt)
    #table(
      columns: (1fr, 2fr, 1fr, 2fr),
      ..verbArray.map(pair=>{
        pair.map(p=>(
          strong(p.at(0)),blank([
            #if type(word.highlight) == array and p.at(0) in word.highlight {
              set text(fill: red)
              strong(underline(p.at(1)))
            }else{
              p.at(1)
            }
          ],"conjugation")
        ))
      }).flatten(),
      /* [*ich*], word.conjugation.ich, [*wir*], word.conjugation.wir,
      [*du*], word.conjugation.du, [*ihr*], word.conjugation.ihr,
      [*er*], word.conjugation.er, [*sie*], word.conjugation.sie,
      [], [], [*Sie*], word.conjugation.Sie, */
    )
  ]

  [== 意味]
  underline(strong(blank(word.ja, "japanese", width: 50%, height: 1.5em)))
  linebreak()
  word.at("memo", default: [])


  [== 例]

  for sentence in word.examples {
    list.item([
      #eval(sentence.de, mode: "markup") \
      (#blank(sentence.ja,"japanese",width: 70%,height: 1.2em))
    ])
  }
  pagebreak(weak: true)
}

