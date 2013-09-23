\version "2.10.10"
global = {
}
leadMusic = \relative c'' {
  | r c a c | a4 c8 c8( b2)
  | r4 c a c | c4. b8 \bar "|."

}
leadWords =\lyricmode {
  Our love will last as long, as this song is -- n't.
}

\score {
  \new ChoirStaff <<
    \chords { c2 a:m7 | d:m7 g:7 | c2 a:m7 | d4.:m7 g8:7  }
    \new Staff = leadStaff <<
      \clef "G"
      \new Voice =
      "leads" {
        \key c \major
        \time 4/4
        \leadMusic
      }
    >>
    \new Lyrics = leads { s1 }
    \context Lyrics = leads \lyricsto leads \leadWords
  >>

  \layout {
    \context {
    }
  }
}
