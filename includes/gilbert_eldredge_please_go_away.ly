\version "2.10.10"
global = {
}
\header {
  %title = "Chorus"
  %composer = "R. C. Mc Pherson James T. Brymn 1902"
}
leadMusic = \relative c'' {
  d4. f,8 g4 f | e d' c2 | c4. ees,8 f4 ees | d c' bes2 |
  bes4. bes8 ees4 ees | d4. f,8 g4 f | e d'8 c~ c g fis g | bes4 a g f |
  d'4. f,8 g4 f | e4. d'8 c2 | c4. ees,8 f4 ees | d4. c'8 bes2 |
  bes4. bes8 ees4 ees | d4. f,8 g4 f | g2 d'8 c d4 | bes2~ bes8 r r4 |
  \bar ":|"

}
leadWords =\lyricmode {
  Please go way and let me sleep Don't dis -- turb my slum -- ber deep,
  I would rath -- er sleep than eat; For sleep to me is such a treat, treat, treat, I
  nev -- er had a dream so nice, Thought I was in Par -- a -- dise,
  Wak -- in' up makes me feel cheap so Please let _ me sleep.
}

\score {
  \new ChoirStaff <<
    \chords {
      bes2 g:7 | c1:7 | f:7 | bes |
      g2:m ees:m | bes g:7 | c1:7 | f:7 |

      bes2 g:7 | c1:7 | f:7 | bes |
      g2:m ees:m | bes g:7 | c2:7 f:7 | bes1 |
    }
    \new Staff = leadStaff <<
      \clef "G"
      \new Voice =
      "leads" {
        \key bes \major
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
