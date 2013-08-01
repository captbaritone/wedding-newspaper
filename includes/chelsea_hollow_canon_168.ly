\version "2.10.10"
\header {
  %composer =  \markup \center-column { "Henery Montan Berton (1767-1844)" }
  meter = \markup { Allegro risoluto }
}
global = {
}
leadMusic = \relative c' {
  f4^"1." f f f |
  g g g g |
  a\downbow a a a |
  bes bes bes c8 bes |
  a4^"2." c a f |
  e g e c |
  f\downbow f f f |
  g g g g |
  a1^"3." |
  g |
  f2\downbow f |
  f4 g8 f e4 g |
  c1^"4." |
  bes |
  a\downbow |
  g |
  f2^"5." r4 c'8 c |
  c4 c r c8 c |
  c4\downbow c r8 c c c |
  c2 r8 c c c |
  c4^"6." c8 c c,4 c |
  r c'8 c c,4 c |
  r8\downbow c' c c c,2 |
  r8 c' c c c,2 |
  c'^"7." c |
  c c |
  c\downbow c |
  c c |
  c1^"8." |
  c |
  c~\downbow |
  c
  \bar ":|"
}

\score {
  \new ChoirStaff <<
    \new Staff = leadStaff <<
      \clef "G"
      \new Voice =
      "leads" {
        \key f \major
        \time 2/2
        \leadMusic
      }
    >>
    \new Lyrics = leads { s1 }
  >>

  \layout {
    \context {
    }
  }
}
