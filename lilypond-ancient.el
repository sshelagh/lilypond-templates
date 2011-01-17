;;; lilypond-ancient.el --- 

;; Copyright (C) 2008  Shelagh Manton <shelagh.manton@gmail.com>

;; Author: Shelagh Manton <shelagh.manton@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:

;;; Code:
 ;;; ancient template

(define-skeleton LilyPond-neomensural
"Insert the neomensural template exactly as in the documents as I don't know what is necessary"
nil
> "\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
"% I have used the template as I found it, as I am not an expert on what is required for ancient music, " \n
"% please read the info node on this subject." \n
"% For more information go to (info \"(LilyPond) Ancient notation \") Do C-x C-e after the parenthesis." \n 
\n \n
> "global = {" \n
> "\\set Score.skipBars = ##t" \n
\n
> "% incipit" \n
> "\\once \\override Score.SystemStartBracket #'transparent = ##t" \n
> "\\override Score.SpacingSpanner #'spacing-increment = #1.0 % tight spacing" \n
> "\\key f \\major" \n
> "\\time 2/2" \n
> "\\once \\override Staff.TimeSignature #'style = #'neomensural" \n
> "\\override Voice.NoteHead #'style = #'neomensural" \n
> "\\override Voice.Rest #'style = #'neomensural" \n
> "\\set Staff.printKeyCancellation = ##f" \n
> "\\cadenzaOn" \n
> "\\skip 1*10" \n
> "\\once \\override Staff.BarLine #'transparent = ##f" \n
> "\\bar \"\|\|\"" \n
> "\\skip 1*1 % need this extra \\skip such that clef change comes" \n
> "% after bar line" \n
> "\\bar \"\"" \n
\n
> "% main" \n
> "\\revert Score.SpacingSpanner #'spacing-increment % CHECK: no effect?" \n
> "\\cadenzaOff % turn bar lines on again" \n
> "\\once \\override Staff.Clef #'full-size-change = ##t" \n
> "\\set Staff.forceClef = ##t" \n
> "\\key g \\major" \n
> "\\time 4/4" \n
> "\\override Voice.NoteHead #'style = #'default" \n
> "\\override Voice.Rest #'style = #'default" \n
\n
> "% FIXME: setting printKeyCancellation back to #t must not" \n
> "% occur in the first bar after the incipit.  Dto. for forceClef." \n
> "% Therefore, we need an extra \\skip." \n
> "\\skip 1*1" \n
> "\\set Staff.printKeyCancellation = ##t" \n
> "\\set Staff.forceClef = ##f" \n
\n
> "\\skip 1*7 % the actual music" \n
\n
> "% let finis bar go through all staves" \n
> "\\override Staff.BarLine #'transparent = ##f" \n
\n
> "% finis bar" \n
> "\\bar \"\|.\"" \n
> "}" \n
\n
> "discantusNotes = {" \n
> "\\transpose c' c'' {" \n
> "\\set Staff.instrumentName = \"Discantus\"" \n
\n
> "% incipit" \n
> "\\clef \"neomensural-c1\"" \n
> "INSERT NOTES" \n
\n
> "% main" \n
> "\\clef \"treble\"" \n
> "INSERT NOTES" \n
> "}" \n
> "}" \n
\n
> "discantusLyrics = \\lyricmode {" \n
> "% incipit" \n
> "IV-" \n
\n
> "% main" \n
> "LYRICS" \n
> "}" \n
\n
> "altusNotes = {" \n
> "\\transpose c' c'' {" \n
> "\\set Staff.instrumentName = \"Altus\"" \n
\n
> "% incipit" \n
> "\\clef \"neomensural-c3\"" \n
> "INSERT NOTES" \n
\n
> "% main" \n
> "\\clef \"treble\"" \n
> "INSERT NOTES" \n
> "}" \n
> "}" \n
\n
> "altusLyrics = \\lyricmode {" \n
> "% incipit" \n
> "IV-" \n
\n
> "% main" \n
> "LYRICS" \n
> "}" \n
\n
> "tenorNotes = {" \n
> "\\transpose c' c' {" \n
> "\\set Staff.instrumentName = \"Tenor\"" \n
\n
> "% incipit" \n
> "\\clef \"neomensural-c4\"" \n
> "INSERT NOTES" \n
\n
> "% main" \n
> "\\clef \"treble_8\"" \n
> "INSERT NOTES" \n
> "}" \n
> "}" \n
\n
> "tenorLyrics = \\lyricmode {" \n
> "% incipit" \n
> "IV-" \n
\n
> "% main" \n
> "LYRICS" \n
> "}" \n
\n
> "bassusNotes = {" \n
> "\\transpose c' c' {" \n
> "\\set Staff.instrumentName = \"Bassus\"" \n
\n
> "% incipit" \n
> "\\clef \"bass\"" \n
> "INSERT NOTES" \n
\n
> "% main" \n
> "\\clef \"bass\"" \n
> "INSERT NOTES" \n
> "}" \n
> "}" \n
\n
> "bassusLyrics = \\lyricmode {" \n
> "% incipit" \n
> "IV-" \n
\n
> "% main" \n
> "LYRICS" \n
\n
> "\\score {" \n
> "\\new StaffGroup = choirStaff <<" \n
> "\\new Voice =" \n
> "\"discantusNotes\" << \\global \\discantusNotes >>" \n
> "\\new Lyrics =" \n
> "\"discantusLyrics\" \\lyricsto discantusNotes { \\discantusLyrics }" \n
> "\\new Voice =" \n
> "\"altusNotes\" << \\global \\altusNotes >>" \n
> "\\new Lyrics =" \n
> "\"altusLyrics\" \\lyricsto altusNotes { \\altusLyrics }" \n
> "\\new Voice =" \n
> "\"tenorNotes\" << \\global \\tenorNotes >>" \n
> "\\new Lyrics =" \n
> "\"tenorLyrics\" \\lyricsto tenorNotes { \\tenorLyrics }" \n
> "\\new Voice =" \n
> "\"bassusNotes\" << \\global \\bassusNotes >>" \n
> "\\new Lyrics =" \n
> "\"bassusLyrics\" \\lyricsto bassusNotes { \\bassusLyrics }" \n
> ">>" \n
> "\\layout {" \n
> "\\context {" \n
> "\\Score" \n
\n
> "% no bars in staves" \n
> "\\override BarLine #'transparent = ##t" \n
\n
> "% incipit should not start with a start delimiter" \n
> "\\remove \"System_start_delimiter_engraver\"" \n
> "}" \n
> "\\context {" \n
> "\\Voice" \n
\n
> "% no slurs" \n
> "\\override Slur #'transparent = ##t" \n
\n
> "% Comment in the below \"\\remove\" command to allow line" \n
> "% breaking also at those barlines where a note overlaps" \n
> "% into the next bar.  The command is commented out in this" \n
> "% short example score, but especially for large scores, you" \n
> "% will typically yield better line breaking and thus improve" \n
> "% overall spacing if you comment in the following command." \n
> "%\\remove \"Forbid_line_break_engraver\"" \n
> "}" \n
> "}" \n
> "}" \n
)


;; upperStaff = \context GregorianStaff = "upperStaff" <<
;;   \context GregorianVoice <<
;;     \set Score.timing = ##f
;; %   \set Score.forceAccidental = ##t %%%%%%%% FIXME: what happened to this property?

;;     \override Staff.StaffSymbol  #'line-count = #4

;;      \transpose c c {
;; 	\override Staff.KeySignature #'glyph-name-alist = #alteration-vaticana-glyph-name-alist
;; 	\override Staff.Accidental #'glyph-name-alist = #alteration-vaticana-glyph-name-alist
;; 	\override NoteHead  #'style = #'vaticana.punctum
;; 	\key es \major
;; 	\clef "vaticana-fa2"
;; 	c!1 des! e! f! ges!

;; 	\override NoteHead  #'style = #'vaticana.inclinatum
;; 	a! b! ces'
;; 	\override Staff.BarLine  #'bar-size = #3.0 \bar "|"
;; %	\break % 1 (8*1)

;; 	\override NoteHead  #'style = #'vaticana.quilisma
;; 	b! des'! ges! fes!
;; 	\breathe
;; 	\clef "vaticana-fa1"
;; 	\override NoteHead  #'style = #'vaticana.plica
;; 	es d
;; 	\override NoteHead  #'style = #'vaticana.reverse-plica
;; 	c d
;; 	\override Staff.BarLine  #'bar-size = #3.0 \bar "|"
;; %	\break %2 (8*1)

;; 	\override NoteHead  #'style = #'vaticana.punctum-cavum
;; 	es f
;; 	\override NoteHead  #'style = #'vaticana.lpes
;; 	g as
;; 	\override NoteHead  #'style = #'vaticana.upes
;; 	bes as
;; 	\override NoteHead  #'style = #'vaticana.vupes
;; 	g f
;; 	\override NoteHead  #'style = #'vaticana.linea-punctum
;; 	\override Staff.BarLine  #'bar-size = #2.0 \bar "|"
;; %	\break % 3 (8*1)

;; 	es d
;; 	\override NoteHead  #'style = #'vaticana.epiphonus
;; 	c d
;; 	\override NoteHead  #'style = #'vaticana.cephalicus
;; 	es f

;; 	\override Staff.KeySignature #'glyph-name-alist = #alteration-medicaea-glyph-name-alist
;; 	\override Staff.Accidental #'glyph-name-alist = #alteration-medicaea-glyph-name-alist
;; 	\override Staff.Custos  #'style = #'medicaea
;; 	\override NoteHead  #'style = #'medicaea.punctum
;; 	\clef "medicaea-fa2"
;; 	ces! des!
;; 	\override Staff.BarLine  #'bar-size = #3.0 \bar "|"
;; %	\break % 4 (8*1)

;; 	e! f! ges!
;; 	\clef "medicaea-do2"
;; 	\override NoteHead  #'style = #'medicaea.inclinatum
;; 	a! b! ces'!
;; 	\override NoteHead  #'style = #'medicaea.virga
;; 	b! a!
;; 	\override Staff.BarLine  #'bar-size = #3.0 \bar "|"
;; %	\break % 5 (8*1)

;; 	ges! fes!
;; 	\clef "medicaea-fa1"
;; 	\override NoteHead  #'style = #'medicaea.rvirga
;; 	e! des! ces!

;; 	\override Staff.KeySignature #'glyph-name-alist = #alteration-hufnagel-glyph-name-alist
;; 	\override Staff.Accidental #'glyph-name-alist = #alteration-hufnagel-glyph-name-alist
;; 	\override Staff.Custos  #'style = #'hufnagel
;; 	\override NoteHead  #'style = #'hufnagel.punctum
;; 	\clef "hufnagel-fa2"
;; 	ces! des! es!
;; 	\override Staff.BarLine  #'bar-size = #3.0 \bar "|"
;; %	\break % 6 (8*1)

;; 	fes! ges!
;; 	\clef "hufnagel-do2"
;; 	\override NoteHead  #'style = #'hufnagel.lpes
;; 	as! bes! ces'!
;; 	\override NoteHead  #'style = #'hufnagel.virga
;; 	bes! as!
;; 	\override Staff.BarLine  #'bar-size = #3.0 \bar "|"
;; %	\break % 7 (8*1)

;; 	ges! fes!
;; 	\clef "hufnagel-do-fa"
;; 	\override NoteHead  #'style = #'hufnagel.punctum
;; 	es! des! ces! des! es! fes!
;; 	\bar "||"
;; %	\break % 8 (8*1)

;; 	s32*1
;; %	\break % 12 (32*1)
;;     }
;;   >>
;; >>

;; lowerStaff = \context MensuralStaff = "lowerStaff" <<
;;   \context MensuralVoice <<
    
;;     % this is broken until further notice -- see refman
;;     % \override Staff.StaffSymbol  #'line-count = #5
;;     \applyOutput #'Staff #(outputproperty-compatibility (make-type-checker 'staff-symbol-interface) 'line-count 5)

;;      \transpose c c {
;; 	\set autoBeaming = ##f
;; 	\override NoteHead  #'style = #'neomensural
;; 	\override Rest  #'style = #'neomensural
;; 	\key a \major

;; % FIXME: lily crashes on some (invalid?) ligatures with:
;; %   ERROR: In procedure gh_scm2int:
;; %   ERROR: Wrong type argument in position 1: ()

;; % FIXME: lily emits "Programming error: Infinity or NaN encountered"
;; % on many ligatures such as BB.

;; 	cis'1 d'\breve gis'\breve e'\breve \[ e'\longa fis'\longa \]
;; 	\set Staff.forceClef = ##t
;; 	\clef "neomensural-c2"
;; 	cis1
;; 	\bar "|"
;; %	\break % 2 (16*1)

;; 	\[ g\breve dis''\longa \]
;; 	b\breve \[ a\longa d\longa \]
;; 	\clef "petrucci-c2"
;; %	\break % 4 (16*1)

;; 	fis1 ces1
;; 	\clef "petrucci-c2"
;; 	r\longa
;; 	\set Staff.forceClef = ##t
;; 	\clef "mensural-c2"
;; 	r\breve
;; 	\bar "|"
;; %	\break % 5 (8*1)

;; 	r2
;; 	\clef "mensural-g"
;; 	r4 r8 r16 r16
;; 	\override NoteHead  #'style = #'mensural
;; 	\override Stem  #'flag-style = #'mensural
;; 	\override Stem  #'thickness = #1.0
;; 	\override Rest  #'style = #'mensural
;; 	\clef "petrucci-f"
;; 	c8 b, c16 b, c32 b, c64 b, c64 b,
;; 	d8 e  d16 e  d32 e  d64 e  d64 e
;; 	r\longa
;; 	\set Staff.forceClef = ##t
;; 	\clef "petrucci-f"
;; 	r\breve
;; 	\bar "|"
;; %	\break % 6 (8*1)

;; 	r\breve 
;; 	\clef "mensural-f"
;; 	% FIXME: must set Stem flag-style to #'neomensural to avoid
;; 	% segmentation fault on r8/r16/r32.  (Strange: what has
;; 	% Stem flag-style to do with mensural rests?)
;; 	\override Stem  #'flag-style = #'neomensural
;; 	% FIXME: produces warnings about "flag `neomensurald4' (or 3) not found".
;; 	r2 r4 r8 r16 r16
;; 	\override Stem  #'flag-style = #'mensural
;; 	\set Staff.forceClef = ##t
;; 	\clef "mensural-f"
;; 	e\breve f g a1
;; 	\clef "mensural-g"
;; %	\break % 7 (8*1)

;; 	\[ bes'!\longa a'!\longa c''!\longa \]
;; 	e'1 d' c' d' \bar "|"
;; 	\bar "|"
;; %	\break % 9 (16*1)

;; 	bes'!\longa fis'!1 as'!1 ges'!\longa % lig
;; 	\set Staff.forceClef = ##t
;; 	\clef "mensural-g"
;; 	e'2 d' c' \bar "|"
;; %	\break % 11 (16*1)

;; 	\set Staff.forceClef = ##t
;; 	\clef "petrucci-g"
;; 	c'2 d' e' f'
;; 	\clef "petrucci-g"
;; 	g' as'! bes'! cis''!
;; 	bes'! as'! gis'! fis'!
;; 	\set Staff.forceClef = ##t
;; 	\clef "mensural-g"
;; 	es'! des'! cis'!1 \bar "||"
;; %	\break % 12 (8*1)
;;     }
;;   >>
;; >>

;; \paper {
;; 	line-thickness = #(/ staff-space 5.0)
;; }

;; \score {
;;     \context Score <<
;; 	\upperStaff
;; 	\lowerStaff
;;     >>
;;     \layout {
;; % do we want to keep these settings? -gp
;; 	line-width = 17.25\cm
;; 	textheight = 26.0\cm
;; 	indent = 0.0
;; 	\context {
;; 	    \Score
;; 	    \accepts MensuralStaff
;; 	    \accepts GregorianStaff
;; %	    timing = ##f %%%%%%%% FIXME: this has no effect
;; 	}
;; 	\context {
;; 	    \Voice
;; 	    \name MensuralVoice
;; 	    \alias Voice
;; 	    \remove Ligature_bracket_engraver
;; 	    \consists Mensural_ligature_engraver
;; 	    \override NoteHead #'style = #'mensural
;; %	    \override Stem #'flag-style = #'mensural %%%%%%%% FIXME: this core dumps
;; 	    \override Stem #'thickness = #1.0
;; 	    \override Rest #'style = #'mensural
;; 	    autoBeaming = ##f
;; 	}
;; 	\context {
;; 	    \Voice
;; 	    \name GregorianVoice
;; 	    \alias Voice
;; 	    \remove Ligature_bracket_engraver
;; %	    \consists Gregorian_ligature_engraver %%%%%%%% TODO: not yet implemented
;; 	    \override NoteHead #'style = #'vaticana.punctum
;; 	    autoBeaming = ##f
;; 	}
;; 	\context {
;; 	    \Staff
;; 	    \name MensuralStaff
;; 	    \alias Staff
;; 	    \accepts MensuralVoice
;; 	    \consists Custos_engraver
;; 	    \override TimeSignature #'style = #'mensural
;; 	    \override KeySignature #'glyph-name-alist = #alteration-mensural-glyph-name-alist
;; 	    \override Accidental #'glyph-name-alist = #alteration-mensural-glyph-name-alist
;; 	    \override Custos #'style = #'mensural
;; 	    \override Custos #'neutral-position = #3
;; 	    \override Custos #'neutral-direction = #-1
;; 	    clefGlyph = #"clefs.petrucci-c2"
;; 	    clefPosition = #-2
;; 	    clefOctavation = #0 
;; 	}
;; 	\context {
;; 	    \Staff
;; 	    \name GregorianStaff
;; 	    \alias Staff
;; 	    \accepts GregorianVoice
;; 	    \consists Custos_engraver
;; 	    \remove Time_signature_engraver
;; 	    \override StaffSymbol #'thickness = #2.0
;; 	    \override StaffSymbol #'line-count = #4
;; 	    \override KeySignature #'glyph-name-alist = #alteration-vaticana-glyph-name-alist
;; 	    \override Accidental #'glyph-name-alist = #alteration-vaticana-glyph-name-alist
;; 	    \override Custos #'style = #'vaticana
;; 	    \override Custos #'neutral-position = #4
;; 	    \override Custos #'neutral-direction = #-1
;; 	    clefGlyph = #"clefs.vaticana-do"
;; 	    clefPosition = #1
;; 	    clefOctavation = #0 
;; 	}
;; 	\context {
;; 	    \RemoveEmptyStaffContext
;; 	    \accepts MensuralVoice
;; 	    \accepts GregorianVoice
;;         }
;;     }
;; }

;; \include "gregorian-init.ly"

;; chant = \relative c' {
;;   \set Score.timing = ##f
;;   f4 a2 \divisioMinima
;;   g4 b a2 f2 \divisioMaior
;;   g4( f) f( g) a2 \finalis
;; }

;; verba = \lyricmode {
;;   Lo -- rem ip -- sum do -- lor sit a -- met
;; }

;; \score {
;;   \new Staff <<
;;     \new Voice = "melody" \chant
;;     \new Lyrics = "one" \lyricsto melody \verba
;;   >>
;;   \layout {
;;     \context {
;;       \Staff
;;       \remove "Time_signature_engraver"
;;       \remove "Bar_engraver"
;;       \override Stem #'transparent = ##t
;;     }
;;     \context {
;;       \Voice
;;       \override Stem #'length = #0
;;     }
;;     \context {
;;       \Score
;;       barAlways = ##t
;;     }
;;   }
;; }


;; global = {
;;   \set Score.skipBars = ##t

;;   % incipit
;;   \once \override Score.SystemStartBracket #'transparent = ##t
;;   \override Score.SpacingSpanner #'spacing-increment = #1.0 % tight spacing
;;   \key f \major
;;   \time 2/2
;;   \once \override Staff.TimeSignature #'style = #'neomensural
;;   \override Voice.NoteHead #'style = #'neomensural
;;   \override Voice.Rest #'style = #'neomensural
;;   \set Staff.printKeyCancellation = ##f
;;   \cadenzaOn % turn off bar lines
;;   \skip 1*10
;;   \once \override Staff.BarLine #'transparent = ##f
;;   \bar "||"
;;   \skip 1*1 % need this extra \skip such that clef change comes
;;             % after bar line
;;   \bar ""

;;   % main
;;   \revert Score.SpacingSpanner #'spacing-increment % CHECK: no effect?
;;   \cadenzaOff % turn bar lines on again
;;   \once \override Staff.Clef #'full-size-change = ##t
;;   \set Staff.forceClef = ##t
;;   \key g \major
;;   \time 4/4
;;   \override Voice.NoteHead #'style = #'default
;;   \override Voice.Rest #'style = #'default

;;   % FIXME: setting printKeyCancellation back to #t must not
;;   % occur in the first bar after the incipit.  Dto. for forceClef.
;;   % Therefore, we need an extra \skip.
;;   \skip 1*1
;;   \set Staff.printKeyCancellation = ##t
;;   \set Staff.forceClef = ##f

;;   \skip 1*7 % the actual music

;;   % let finis bar go through all staves
;;   \override Staff.BarLine #'transparent = ##f

;;   % finis bar
;;   \bar "|."
;; }

;; discantusNotes = {
;;   \transpose c' c'' {
;;     \set Staff.instrumentName = #"Discantus  "

;;     % incipit
;;     \clef "neomensural-c1"
;;     c'1. s2   % two bars
;;     \skip 1*8 % eight bars
;;     \skip 1*1 % one bar

;;     % main
;;     \clef "treble"
;;     d'2. d'4 |
;;     b e' d'2 |
;;     c'4 e'4.( d'8 c' b |
;;     a4) b a2 |
;;     b4.( c'8 d'4) c'4 |
;;     \once \override NoteHead #'transparent = ##t c'1 |
;;     b\breve |
;;   }
;; }

;; discantusLyrics = \lyricmode {
;;   % incipit
;;   IV-

;;   % main
;;   Ju -- bi -- |
;;   la -- te De -- |
;;   o, om --
;;   nis ter -- |
;;   ra, __ om- |
;;   "..." |
;;   -us. |
;; }

;; altusNotes = {
;;   \transpose c' c'' {
;;     \set Staff.instrumentName = #"Altus  "

;;     % incipit
;;     \clef "neomensural-c3"
;;     r1        % one bar
;;     f1. s2    % two bars
;;     \skip 1*7 % seven bars
;;     \skip 1*1 % one bar

;;     % main
;;     \clef "treble"
;;     r2 g2. e4 fis g | % two bars
;;     a2 g4 e |
;;     fis g4.( fis16 e fis4) |
;;     g1 |
;;     \once \override NoteHead #'transparent = ##t g1 |
;;     g\breve |
;;   }
;; }

;; altusLyrics = \lyricmode {
;;   % incipit
;;   IV-

;;   % main
;;   Ju -- bi -- la -- te | % two bars
;;   De -- o, om -- |
;;   nis ter -- ra, |
;;   "..." |
;;   -us. |
;; }

;; tenorNotes = {
;;   \transpose c' c' {
;;     \set Staff.instrumentName = #"Tenor  "

;;     % incipit
;;     \clef "neomensural-c4"
;;     r\longa   % four bars
;;     r\breve   % two bars
;;     r1        % one bar
;;     c'1. s2   % two bars
;;     \skip 1*1 % one bar
;;     \skip 1*1 % one bar

;;     % main
;;     \clef "treble_8"
;;     R1 |
;;     R1 |
;;     R1 |
;;     r2 d'2. d'4 b e' | % two bars
;;     \once \override NoteHead #'transparent = ##t e'1 |
;;     d'\breve |
;;   }
;; }

;; tenorLyrics = \lyricmode {
;;   % incipit
;;   IV-

;;   % main
;;   Ju -- bi -- la -- te | % two bars
;;   "..." |
;;   -us. |
;; }

;; bassusNotes = {
;;   \transpose c' c' {
;;     \set Staff.instrumentName = #"Bassus  "

;;     % incipit
;;     \clef "bass"
;;     r\maxima  % eight bars
;;     f1. s2    % two bars
;;     \skip 1*1 % one bar

;;     % main
;;     \clef "bass"
;;     R1 |
;;     R1 |
;;     R1 |
;;     R1 |
;;     g2. e4 |
;;     \once \override NoteHead #'transparent = ##t e1 |
;;     g\breve |
;;   }
;; }

;; bassusLyrics = \lyricmode {
;;   % incipit
;;   IV-

;;   % main
;;   Ju -- bi- |
;;   "..." |
;;   -us. |
;; }

;; \score {
;;   \new StaffGroup = choirStaff <<
;;     \new Voice =
;;       "discantusNotes" << \global \discantusNotes >>
;;     \new Lyrics =
;;       "discantusLyrics" \lyricsto discantusNotes { \discantusLyrics }
;;     \new Voice =
;;       "altusNotes" << \global \altusNotes >>
;;     \new Lyrics =
;;       "altusLyrics" \lyricsto altusNotes { \altusLyrics }
;;     \new Voice =
;;       "tenorNotes" << \global \tenorNotes >>
;;     \new Lyrics =
;;       "tenorLyrics" \lyricsto tenorNotes { \tenorLyrics }
;;     \new Voice =
;;       "bassusNotes" << \global \bassusNotes >>
;;     \new Lyrics =
;;       "bassusLyrics" \lyricsto bassusNotes { \bassusLyrics }
;;   >>
;;   \layout {
;;     \context {
;;       \Score

;;       % no bars in staves
;;       \override BarLine #'transparent = ##t

;;       % incipit should not start with a start delimiter
;;       \remove "System_start_delimiter_engraver"
;;     }
;;     \context {
;;       \Voice

;;       % no slurs
;;       \override Slur #'transparent = ##t

;;       % Comment in the below "\remove" command to allow line
;;       % breaking also at those barlines where a note overlaps
;;       % into the next bar.  The command is commented out in this
;;       % short example score, but especially for large scores, you
;;       % will typically yield better line breaking and thus improve
;;       % overall spacing if you comment in the following command.
;;       %\remove "Forbid_line_break_engraver"
;;     }
;;   }
;; }


;;(provide 'lilypond-ancient)
;;; lilypond-ancient.el ends here
