;;; lilypond-vocal-templates.el --- 

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

;;; Commentary: this file is an add-on for lilypond-skeletons.el.
;;; It will be loaded if the variable LilyPond-vocal-templates-p is t(rue).

;;; Code:

;;; Vocal templates

;;; Vocal ensemble

(define-skeleton LilyPond-vocal-ensemble
"Insert form for vocal ensemble and place point at first insertion point"
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n
"% For more information go to (info \"(lilypond)Vocal music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
" global = {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> "}" \n
\n
"sopMusic = \\relative c'' {" \n
>   _ \n
> "}" \n
"sopWords = \\lyricmode {" \n
>  "LYRICS"\n
>"}" \n
\n
"altoMusic = \\relative c' {"\n
>  "INSERT NOTES" \n
> "}" \n
\n
"altoWords =\\lyricmode {"\n
>  "LYRICS"\n
> "}" \n
\n
"tenorMusic = \\relative c' {"\n
> "INSERT NOTES"\n
>"}" \n
\n
"tenorWords = \\lyricmode {"\n
> "LYRICS"\n
> "}" \n
\n
"bassMusic = \\relative c {"\n
>  "INSERT NOTES"\n
>"}" \n
\n
"bassWords = \\lyricmode {"\n
> "LYRICS"\n
> "}" \n
\n
"\score {"\n
> "\\new ChoirStaff << " \n
\n
> "\\new Lyrics = sopranos { s1 }" \n
> "\\new Staff = women <<" \n
> "\\new Voice =" \n
> " \"sopranos\" { \\voiceOne << \\global \\sopMusic >> }" \n
> "\\new Voice =" \n
> " \"altos\" { \\voiceTwo << \\global \\altoMusic >> }" \n
> ">>" \n
> "\\new Lyrics = \"altos\" { s1 }" \n
> "\\new Lyrics = \"tenors\" { s1 }" \n
> "\\new Staff = men <<" \n
> "\\clef bass" \n
> "\\new Voice =" \n
> " \"tenors\" { \\voiceOne <<\\global \\tenorMusic >> }" \n
> "\\new Voice =" \n
> "\"basses\" { \\voiceTwo <<\\global \\bassMusic >> }" \n
> ">>" \n
> "\\new Lyrics = basses { s1 }" \n
\n
> "\\context Lyrics = sopranos \\lyricsto sopranos \\sopWords" \n
> "\\context Lyrics = altos \\lyricsto altos \\altoWords" \n
> "\\context Lyrics = tenors \\lyricsto tenors \\tenorWords" \n
> "\\context Lyrics = basses \\lyricsto basses \\bassWords" \n
> ">>" \n
\n
> "\\layout {" \n
> "\\context {" \n
" % a little smaller so lyrics" \n
" % can be closer to the staff" \n
> "\\Staff" \n
> "\\override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)" \n
> "}" \n
> "}" \n
> "}" \n
)

;;; Homophonic score with polyphonic bits

(define-skeleton Lilypond-homophonic-with-polyphonic ;my goodness what a long name. How to shorten?
"Sometimes it is necessary in a mostly homophonic choral work to have a polyphonic section.
This snippet demonstrates how to have text centered  
between four voices on two staves, and then how to have each voice  
have its own text."
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
" global = {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> "}" \n
\n
> "\\version \"2.11.23\"" \n
> "global = {" \n
> "\\key c \\major" \n
> "\\time 4/4" \n
> "}" \n
\n
> "sopranomusic = { _ \\new Voice = \"sopranoupper\" {\\voiceOne  " \n
> "INSERT NOTES } }" \n
\n
> "altomusic = {INSERT NOTES " \n
> "\\new Voice = \"altolower\" {\\voiceTwo r4  " \n
> "INSERT NOTES } }" \n
\n
> "tenormusic = { INSERT NOTES " \n
> "\\new Voice = \"tenorupper\" {\\voiceOne INSERT NOTES  " \n
> "INSERT NOTES } }" \n
\n
> "bassmusic = { INSERT NOTES \\new Voice = \"basslower\" {\\voiceTwo INSERT NOTES } }" \n
> "choirtext = \\lyricmode { IN4 SERT4 -- LYRICS4 }" \n
> "sopranotext = \\lyricmode { a -- bove this voice }" \n
> "altotext = \\lyricmode { be -- low voice }" \n
> "tenortext = \\lyricmode { a -- bove this voice }" \n
> "basstext = \\lyricmode { voice }" \n
\n
> "\\score {" \n
> "\\new ChoirStaff <<" \n
> "\\new Staff = women <<" \n
> "\\new Voice = \"soprano\" {\\voiceOne \\sopranomusic}" \n
> "\\new Voice = \"alto\" {\\voiceTwo \\altomusic}" \n
> ">>  " \n
\n
> "\\context Lyrics \\choirtext" \n
> "\\new Staff = men << \\clef bass" \n
> "\\new Voice = \"tenor\" {\voiceOne \\tenormusic}" \n
> "\\new Voice = \"bass\" {\voiceTwo \\bassmusic}" \n
> ">>  " \n
\n
> "\\new Lyrics \\with {alignAboveContext=women} \\lyricsto sopranoupper  " \n
> "\\sopranotext" \n
> "\new Lyrics \\with {alignBelowContext=women} \\lyricsto altolower  " \n
> "\\altotext" \n
> "\\new Lyrics \\with {alignAboveContext=men} \\lyricsto tenorupper  " \n
> "\\tenortext" \n
> "\\new Lyrics \\with {alignBelowContext=men} \\lyricsto basslower  " \n
> "\\basstext" \n
> ">>  " \n
> "}" \n
)

(define-skeleton LilyPond-satb-aligned-contexts
"Insert form for satb score with piano reduction and place point at first insertion point"
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
" global = {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> "}" \n
\n
> "\\score {" \n
> "\\new ChoirStaff <<" \n
> "\\new Staff = women <<" \n
> "\\new Voice =" \n
> "\"sopranos\" { \\voiceOne << \\global \\sopMusic >> }" \n
> "\\new Voice =" \n
> "\"altos\" { \\voiceTwo << \\global \\altoMusic >> }" \n
> ">>" \n
\n
> "sopMusic = \\relative c'' {" \n
> "INSERT NOTES" \n
> "}" \n
> "sopWords = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "altoMusic = \\relative c' {" \n
> "INSERT NOTES" \n
> "}" \n
> "altoWords =\\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "tenorMusic = \\relative c' {" \n
> "INSERT NOTES" \n
> "}" \n
> "tenorWords = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "bassMusic = \\relative c {" \n
> "INSERT NOTES" \n
> "}" \n
> "bassWords = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "\\new Lyrics \\with {alignAboveContext=women} \\lyricsto sopranos \\sopWords" \n
> "\\new Lyrics \\lyricsto altos \\altoWords" \n
\n
> "\\new Staff = men <<" \n
> "\\clef bass" \n
> "\\new Voice =" \n
> "\"tenors\" { \\voiceOne <<\\global \\tenorMusic >> }" \n
> "\\new Voice =" \n
> "\"basses\" { \\voiceTwo <<\\global \\bassMusic >> }" \n
> ">>" \n
\n
> "\\new Lyrics \\with {alignAboveContext=men} \\lyricsto tenors \\tenorWords" \n
> "\\new Lyrics \\lyricsto basses \\bassWords" \n
> ">>" \n
\n
> "\\layout {" \n
> "\\context {" \n
"% a little smaller so lyrics" \n
"% can be closer to the staff" \n
> "\\Staff" \n
> "\\override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)" \n
> "}" \n
> "}" \n
> "}" \n
)

;;; Notes and lyrics

 
(define-skeleton LilyPond-melody-lyrics
"Insert simple melody skeleton with lyrics.
This example turns off automatic beaming, which is common for
vocal parts. If you want to use automatic beaming, you'll have to
change or comment out the relevant line."
 nil
> " \\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
" melody = \\relative c' {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> ("Sometimes we want to define clef: " "\\clef " str )\n
resume:
> _ \n
> " }" \n
\n
" text = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
"\\score{" \n
> " <<" \n
> "\\new Voice = \"one\" {" \n
> "\\autoBeamOff %Comment out this line for autobeaming." \n
> "\\melody" \n
> "}" \n
> "\\new Lyrics \\lyricsto \"one\" \\text" \n
> " >>" \n
" \\layout { }" \n
" \\midi { }" \n
> "}" \n
)

;;;Notes, lyrics, and chords.
 
(define-skeleton LilyPond-leadsheet
"Insert simple melody skeleton with lyrics and chords."
nil
> "\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
> "melody = \\relative c' {" \n
> "\\key "(skeleton-read "Key: ")\| " c"(skeleton-read "\\major, \\minor or \\ionian: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> ("Sometimes we want to define clef: " "\\clef " str )\n
resume:
> _ \n
 > "}" \n
\n
> "text = \\lyricmode {" \n
> "LYRICS" \n
> " }" \n
\n
> "harmonies = \\chordmode {" \n
> "CHORDS" \n
> "}" \n
\n
> "\\score {" \n
> "<<" \n
> "\\new ChordNames {" \n
> "\\set chordChanges = ##t" \n
> "\\harmonies" \n
> "}" \n
> "\\new Voice = \"one\" {" \n
> "\\autoBeamOff %Comment out this line for autobeaming." \n
> "\\melody" \n
> "}" \n
> "\\new Lyrics \\lyricsto \"one\" \\text" \n
> ">>" \n
> "\\layout { }" \n
> "\\midi { }" \n
> "}" \n
)

;;; Hymn template one set of lyrics for four parts.

(define-skeleton LilyPond-hymn
"Inserts a skeleton for a hymn-like vocal arrangement.
One set of lyrics and four parts."
nil
"\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
> "#(set-global-staff-size 20)" \n
> "\\include \"english.ly\" %put your own favoured language file in here eg. italiano.ly etc " \n
> "upperOne = " \n
> "\\relative a'{" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| "4/4" \n
\n
> "\\voiceOne" \n
> _ \n
> "}" \n
\n
> "upperTwo = \\relative a'{" \n
> "\\voiceTwo" \n
> "INSERT NOTES" \n
> "}" \n
\n
> "lowerOne = \\relative a {" \n
> "\\voiceOne" \n
> "INSERT NOTES" \n
> "}" \n
\n
> "lowerTwo = \\relative c {" \n
> "\\voiceTwo" \n
> "INSERT NOTES" \n
> "}" \n
\n
> "firstverse = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "secondverse = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "thirdverse = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "fourthverse = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "refrain = \\lyricmode {" \n
> "REFRAIN" \n
> "}" \n
\n
> "\\score{ " \n
> "\\context StaffGroup <<" \n
> "\\context Staff = \"upper\" " \n
\n
> "<<" \n
> "\\clef treble" \n
> "\\context Voice = \"one\" \\upperOne" \n
> "\\context Voice = \"two\" \\upperTwo " \n
> ">>" \n
\n
> "\\lyricsto \"one\" \\new Lyrics {" \n
> "\\set stanza = \"1. \"" \n
> "\\firstverse" \n
> "}" \n
\n
> "\\lyricsto \"one\" \\new Lyrics {" \n
> "\\set stanza = \"2. \"" \n
> "\\secondverse " \n
> "}" \n
\n
> "\\lyricsto \"one\" \\new Lyrics {" \n
> "\\set stanza = \"3. \"" \n
> "\\thirdverse " \n
> "}" \n
\n
> "\\context Staff = \"lower\" <<" \n
> "\\clef bass" \n
> "\\context Voice = \"one\" \\lowerOne" \n
> "\\context Voice = \"two\" \\lowerTwo" \n
> ">>" \n
> ">>" \n
\n
> "\\layout {" \n
> "\\context{\\Lyrics" \n
> "minimumVerticalExtent = #'(-0.5 . 3)" \n
> "}" \n
\n
> "\\context{\\StaffGroup" \n
> "\\remove \"Span_bar_engraver\"" \n
> "}" \n
\n
> "\\context{\\Staff" \n
> "minimumVerticalExtent = #'(-3 . 3)" \n
> "autoBeaming = ##t" \n
> "\\unset melismaBusyProperties " \n
> "}" \n
\n
> "\\context{\\Score" \n
> "barNumberVisibility = #all-invisible" \n
> "}" \n
> "}" \n
\n

> "\\midi { }" \n
> "}" \n
> "\\paper {" \n
> "linewidth = 6\\in " \n
> "indent = 0" \n
> "pagenumber = \"no\"" \n
> "}" \n
)

(define-skeleton LilyPond-gregorian-transcription
"Insert template for modern gregorian score and place cursor at first insertion point"
nil
"\\version \"2.11.23\" " \n FIXME There is a new template. four new templates. Separate file?
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\") and (info \"(lilypond)Ancient notation\")." \n
"% Place cursor after the last parenthesis and C-x C-e."    \n
\n
> "\\include \"gregorian-init.ly\"" \n
> "\\version \"2.11.23\"" \n
\n
> "chant = \\relative c' {" \n
> "\\set Score.timing = ##f" \n
> "INSERT NOTES \\divisioMinima" \n
> "INSERT NOTES \\divisioMaior" \n
> "INSERT NOTES \\finalis" \n
> "}" \n
\n
> "verba = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
> "\\score {" \n
> "\\new Staff <<" \n
> "\\new Voice = \"melody\" {" \n
> "\\chant" \n
> "}" \n
> "\\new Lyrics = \"one\" \\lyricsto melody \\verba" \n
> ">>" \n
\n
> "\\layout {" \n
> "\\context {" \n
> "\\Staff" \n
> "\\remove \"Time_signature_engraver\"" \n
> "\\remove \"Bar_engraver\"" \n
> "\\override Stem #'transparent = ##t" \n
> "}" \n
> "\\context {" \n
> "\\Voice" \n
> "\\override Stem #'length = #0" \n
> "}" \n
> "\\context {" \n
> "\\Score" \n
> "barAlways = ##t" \n
> "}" \n
> "}" \n
> "}" \n
)

(define-skeleton LilyPond-satb-piano-reduction
"Insert form for satb score with piano reduction and place point at first insertion point"
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Vocal music\") and (info \"(lilypond)Piano music\")." \n
"% Place cursor after the last parenthesis and C-x C-e."    \n
\n
" global = {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> "}" \n
\n
> "sopMusic = \\relative c'' {" \n
> _ \n
> "}" \n
> "sopWords = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
 \n
> "altoMusic = \\relative c' {" \n
> "INSERT NOTES" \n
> "}" \n
> "altoWords =\\lyricmode {" \n
> "LYRICS" \n
> "}" \n
 \n
> "tenorMusic = \\relative c' {" \n
> "INSERT NOTES" \n
> "}" \n
> "tenorWords = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
 \n
> "bassMusic = \\relative c {" \n
> "INSERT NOTES" \n
> "}" \n
> "bassWords = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
 \n
> "\\score {" \n
> "<<" \n
> "\\new ChoirStaff <<" \n
> "\\new Lyrics = sopranos { s1 }" \n
> "\\new Staff = women <<" \n
> "\\new Voice =" \n
> "\"sopranos\" { \\voiceOne << \\global \\sopMusic >> }" \n
> "\\new Voice =" \n
> "\"altos\" { \\voiceTwo << \\global \\altoMusic >> }" \n
> ">>" \n
> "\\new Lyrics = \"altos\" { s1 }" \n
> "\\new Lyrics = \"tenors\" { s1 }" \n
> "\\new Staff = men <<" \n
> "\\clef bass" \n
> "\\new Voice =" \n
> "\"tenors\" { \\voiceOne <<\\global \\tenorMusic >> }" \n
> "\\new Voice =" \n
> "\"basses\" { \\voiceTwo <<\\global \\bassMusic >> }" \n
> ">>" \n
> "\\new Lyrics = basses { s1 }" \n
 \n
> "\\context Lyrics = sopranos \\lyricsto sopranos \\sopWords" \n
> "\\context Lyrics = altos \\lyricsto altos \\altoWords" \n
> "\\context Lyrics = tenors \\lyricsto tenors \\tenorWords" \n
> "\\context Lyrics = basses \\lyricsto basses \\bassWords" \n
 \n
> "\\new PianoStaff <<" \n
> "\\new Staff <<" \n
> "\\set Staff.printPartCombineTexts = ##f" \n
> "\\partcombine" \n
> "<< \\global \\sopMusic >>" \n
> "<< \\global \\altoMusic >>" \n
\n
> "\\new Staff <<" \n
> "\\clef bass" \n
> "\\set Staff.printPartCombineTexts = ##f" \n
> "\\partcombine" \n
> "<< \\global \\tenorMusic >>" \n
> "<< \\global \\bassMusic >>" \n
 \n
 \n
 \n
> "\\layout {" \n
> "\\context {" \n
> "% a little smaller so lyrics" \n
> "% can be closer to the staff" \n
> "\\Staff" \n
> "\\override VerticalAxisGroup #'minimum-Y-extent = #'(-3 . 3)" \n
> "}" \n
> "}" \n
> "}" \n
)

;(provide 'lilypond-vocal-templates) I want it to be loaded not required.
;;; lilypond-vocal-templates.el ends here