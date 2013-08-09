\version "2.10.10"
%%% Function: rhythmMark
%%% ============================================================
%%%  Purpose: print a sophisticated rehearsal mark e.g
%%%           for rhythm directives
%%%    Usage: \rhythmMark label music1 music2
%%% ------------------------------------------------------------
%%% Variable: label (string)
%%% ------------------------------------------------------------
%%% Variable: music1 (ly:music)
%%% ------------------------------------------------------------
%%% Variable: music2 (ly:music)
%%% ------------------------------------------------------------
%%%  Example: \rhythmMark #"Swing" \rhyMarkIIEighths
%%%                 \rhyMarkSlurredTriplets
%%% ------------------------------------------------------------
%%% Constants:
%%%           rhythmMarkStaffReduce = #-3
%%%           rhythmMarkLabelFontSize = #-2
%%% ------------------------------------------------------------
%%%  Comment: see below for predefined values for music1&2
%%% ============================================================

rhythmMarkStaffReduce = #-3
rhythmMarkLabelFontSize = #-2

rhythmMark = #(define-music-function (parser location label musicI musicII ) (string? ly:music? ly:music?)
   #{
      \mark \markup {
        \line \general-align #Y #DOWN {
          \combine
            \italic \fontsize #rhythmMarkLabelFontSize $label
            \transparent \italic \fontsize #rhythmMarkLabelFontSize f

          \score {                     % 2nd column in line
            \new Staff \with {
              fontSize = #rhythmMarkStaffReduce
              \override StaffSymbol #'staff-space = #(magstep rhythmMarkStaffReduce)
              \override StaffSymbol #'line-count = #0
              \override VerticalAxisGroup #'Y-extent = #'(-0.85 . 4)
            }

            {
              \relative { \stemUp $musicI }
             
%             \override Score.SpacingSpanner #'strict-note-spacing = ##t
              \once \override Score.TextScript #'Y-offset = #-0.4
              s4.^\markup{ \halign #-1 \italic "=" }
              
              \relative { \stemUp $musicII }
            } 
            
            \layout {
              ragged-right= ##t
              indent = 0
              \context {
                \Staff
                \remove "Clef_engraver"
                \remove "Time_signature_engraver"
              }
            } % layout end

          } % Score end

        } % line end
      } % markup end
   #})

%%% Function: rhythmMarkC
%%% ============================================================
%%%  Purpose: print a sophisticated rehearsal mark e.g for
%%%           rhythm directives in a column (music on top)
%%%    Usage: \rhythmMarkC label music1 music2
%%% ------------------------------------------------------------
%%% Variable: label (string)
%%% ------------------------------------------------------------
%%% Variable: music1 (ly:music)
%%% ------------------------------------------------------------
%%% Variable: music2 (ly:music)
%%% ------------------------------------------------------------
%%%  Example: \rhythmMarkC #"Swing" \rhyMarkIIEighths
%%%                 \rhyMarkSlurredTriplets
%%% ------------------------------------------------------------
%%% Constants:
%%%           rhythmMarkCStaffReduce = #-4
%%%           rhythmMarkCLabelFontSize = #-2
%%% ------------------------------------------------------------
%%%  Comment: see below for predefined values for music1&2
%%% ============================================================

rhythmMarkCStaffReduce = #-4
rhythmMarkCLabelFontSize = #-2

rhythmMarkC = #(define-music-function (parser location label musicI musicII ) (string? ly:music? ly:music?)
   #{
      \mark \markup
      {
        \combine

          \line {
            \hspace #0
            \translate #'(-0.1 . -3.25) \italic \fontsize #rhythmMarkCLabelFontSize $label
          } % end Line

          \line \vcenter {

              \score {                 % 1st column in line

                \new Staff \with {
                  fontSize = #rhythmMarkCStaffReduce
                  \override StaffSymbol #'staff-space = #(magstep rhythmMarkCStaffReduce)
                  \override StaffSymbol #'line-count = #0 
                  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
                }

                \relative { \stemUp $musicI }

                \layout {
                  ragged-right= ##t
                  indent = 0
                  \context {
                    \Staff
                    \remove "Clef_engraver"
                    \remove "Time_signature_engraver" }
                } % layout

              } % 1st score

              \hspace #-0.1            % 2nd column in line

                                       % 3rd column in line
              \italic \fontsize #rhythmMarkCStaffReduce "="

              \score {                 % 4th column in line

                \new Staff \with {
                  fontSize = #rhythmMarkCStaffReduce
                  \override StaffSymbol #'staff-space = #(magstep rhythmMarkCStaffReduce)
                  \override StaffSymbol #'line-count = #0 
                  \override VerticalAxisGroup #'Y-extent = #'(0 . 0)  % td
                }

                \relative {
                  \stemUp $musicII
                }

                \layout {
                  ragged-right= ##t
                  indent = 0
                  \context {
                    \Staff
                    \remove "Clef_engraver"
                    \remove "Time_signature_engraver" }
                } % layout

              } % 2nd score end

            } % line end
          % end combine
        } % markup end
   #})

%%% predefined ly:music-Variables for use
%%% in function rhythmMark and rhythmMarkC
%%% ============================================================
rhyMarkI = { b'1*1/8 }

rhyMarkII = { b'2*1/4 }

rhyMarkIV = { b'4*1/2 }

rhyMarkEighth = { b'8 }

rhyMarkIIEighths = {
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4) % tight
  \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 3 16) % even
  b'8[ b8]
}
rhyMarkTriplets = {
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 2) % super-tight
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4) % tight
  \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 3 16) % even
  \times 2/3 { b'4 b8 }
}
rhyMarkSlurredTriplets = {
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4) % tight
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 5 32) % slighty tighter as even
  \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 8) % even
  \times 2/3 { b'8 ~ b8 b8 }
}
rhyMarkDottedEighths = {
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4) % tight
  \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 3 16) % even
  % \override Score.SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 8) % loose
  { b'8.[ b16*2] }
}
global = {
}
leadMusic = \relative c'' {
  \rhythmMark "" \rhyMarkIIEighths \rhyMarkTriplets
  c8. c16 c8. c16 a4 r8. c,16 |
  c'8. d16 c8. bes16 a4 r8. c,16 |
  c'2 d8. c16 bes8. a16 |
  bes8 g4. r4 c,8. c16 |

  bes'4 bes8. bes16 g4 c,8. c16 |
  bes'8. c16 bes8. a16 g2 |
  r8. c16 c4 c8. bes16 a8. g16 |
  a8 f4. r8. f16 g8. f16 |

  r4 d' bes d8. bes16 |
  r8 des4( c8) bes4 r |

  % Tripplets
  \times 2/3 { c8 c a }
  bes8. b16
  \times 2/3 { c8 c a }
  bes8. b16 |
  c8 ees8~ ees d~ d c~ c4 |
  \times 2/3 { bes8 c bes }
  \times 2/3 { a bes a }
  \times 2/3 { g a g }
  \times 2/3 { f g g }
  e4^"molto rit." c' c,2\fermata |
  \bar ":|"

}
leadWords =\lyricmode {
  All the lit -- tle boys, and all the lit -- tle girls, 
    the're all go -- ing to their nam -- mies.
  All the birds and the bees and the flow -- ers and the trees,
    the're all go -- ing too their nam -- mies. 
  The're go -- ing, nam -- mies in their jam -- mies,
    da da da da, duh da da da da, duh da da! da! da!
    da da da da da da da da da da da da da da da
}

\score {
  \new ChoirStaff <<
    \chords { f1 | s | s | c:7| s | s | s | f | bes | bes:m | f | s | c:7 | s }
    \new Staff = leadStaff <<
      \clef "G"
      \new Voice =
      "leads" {
        \key f \major
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
