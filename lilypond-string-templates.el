;;; lilypond-string-templates.el --- 

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

;;; Commentary:this file is an add-on for lilypond-skeletons.el.
;;; It will be loaded if the variable LilyPond-string-templates-p is t(rue).

;;; Code:



;; String quartets
(define-skeleton LilyPond-string-quartet
"Insert a skeleton for a string quartet"
nil
> "\\version \"2.11.23\"" \n 
"%Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"global = {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\|" \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4" \n
> "}" \n
\n
 "violinOne = \\new Voice { \\relative c''{" \n
> "\\set Staff.instrumentName = \"Violin 1\"" \n
> _  \n
> "\\bar \"|.\" }"\n
> "}" \n
\n
> " violinTwo = \\new Voice { \\relative c''{" \n
> "\\set Staff.instrumentName = \"Violin 2\"" \n
> "INSERT NOTES" \n
> "\\bar \"|.\" }" \n
> "}" \n
\n
 "viola = \\new Voice { \\relative c' {" \n
> "\\set Staff.instrumentName = \"Viola\"" \n
> "\\clef alto" \n
> "INSERT NOTES" \n
> "\\bar \"|.\" }"\n
> "}" \n
\n
> "cello = \\new Voice { \\relative c' {" \n
> "\\set Staff.instrumentName = \"Cello\"" \n
> "\\clef bass" \n
> "INSERT NOTES" \n
> "\\bar \"|.\"}" \n
> "}" \n
\n
"\\score {" \n
> "\\new StaffGroup <<" \n
> "\\new Staff << \\global \\violinOne >>" \n
> "\\new Staff << \\global \\violinTwo >>" \n
> "\\new Staff << \\global \\viola >>" \n
> "\\new Staff << \\global \\cello >>" \n
> " >>" \n
\n
> "\\layout { }" \n
> "\\midi { }" \n
> "}" \n
)

(define-skeleton LilyPond-banjo-tab
"Insert banjo tabular staffs that can be easily changed to different tunings."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
"% For more information go to (info \"(lilypond)Banjo tablatures\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
> "global = {"\n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4"
> "}" \n
\n
> "stringmusic = { \\global " \n
> _ \n
> "}" \n
\n
> "\\score { <<" \n
> "\\new Staff " \n
> "\\stringmusic " \n
\n
> "\\new TabStaff <<" \n
" % The following can be uncommented if you want all stems down and horizontal beams." \n
> "% \\stemDown " \n
> "% \\override Beam #'damping = #100000" \n
\n
"% Uncomment the following if you want to hide the stems and beams." \n
> "% \\override TabStaff.Stem #'transparent = ##t " \n
> "% \\override TabStaff.Beam #'transparent = ##t " \n
\n
> "\\set TabStaff.tablatureFormat = #fret-number-tablature-format-banjo" \n
"% Uncomment whichever one suits your banjo." \n
"%\\set TabStaff.stringTunings = #banjo-open-g-tuning" \n
"%\\set TabStaff.stringTunings = #banjo-c-tuning" \n
"%\\set TabStaff.stringTunings = #banjo-modal-tuning" \n
"%\\set TabStaff.stringTunings = #banjo-open-d-tuning" \n
"%\\set TabStaff.stringTunings = #banjo-open-dm-tuning" \n
"%\\set TabStaff.stringTunings = #(four-string-banjo banjo-c-tuning) % Replace what banjo tuning you need here." \n
\n
> "\\stringmusic" \n
> ">>" \n
> ">>" \n
\n
> "\\layout{ indent = #0 }" \n
\n
> "}" \n
)


;; \set TabStaff.minimumFret = #8
;; \stemDown
;; \override Beam #'damping = #100000


(define-skeleton LilyPond-lute-tab
"Insert a form for tablature for lute.
 This one is not in the menu as it is not right."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
\n
"% Sadly the following function doesn't work." \n
> "#(define (fret-letter-tablature-format string context event)" \n
> "(make-string 1 (integer->char" \n
> "(+ (char->integer #\\a)" \n
> "(- (pitch-semitones pitch)" \n
> "(list-ref tuning (- string 1)))))))" \n
\n
> "tablature = {" \n
>  _ " % for example<g'\\1 c'\\2 g\\3 b,\\4>4  " \n
> "}" \n
\n
> "\\score { " \n
> "\\context TabStaff { <<" \n
> "% lutes are tuned g c f a d g" \n
> "\\set TabStaff.stringTunings =  #'(7 0 -7 -15 -22 -29)" \n
> "% let's not print the stems here" \n
> "\\override TabStaff.Stem  #'transparent = ##t" \n
> "\\override TabStaff.Beam #'transparent = ##t " \n
> "% use letters instead of numbers for the fret names." \n
> "% However the function doesn't work at the moment." \n
> "% \\set TabStaff.tablatureFormat = #fret-letter-tablature-format" \n \n
> "\\set TabStaff.TabNoteHead #'extra-offset = #'(0 . 0.5)" \n
> "\\tablature" \n
> " >>" \n
> "}" \n
> "}" \n
)

(define-skeleton LilyPond-guitar
"This inserts a skeleton for guitar score with additional tablature staff."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
"% For more information go to (info \"(lilypond)Guitar\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
> "global = {"\n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4"
> "}" \n
\n
> "stringmusic = { \\global " \n
> _ \n
> "}" \n
\n
> "\\score { <<" \n
> "\\context Staffgroup <<" \n
> "\\context Staff " \n
> "\\clef \"G_8\"" \n
> "\\stringmusic " \n
\n
> "\\context TabStaff <<" \n
" % The following can be uncommented if you want all stems down and horizontal beams." \n
> "% \\stemDown " \n
> "% \\override Beam #'damping = #100000" \n
\n
"% Uncomment the following if you want to hide the stems and beams." \n
> "% \\override TabStaff.Stem #'transparent = ##t " \n
> "% \\override TabStaff.Beam #'transparent = ##t " \n
\n
"% Uncomment whichever one suits your tuning." \n
"%\\set TabStaff.stringTunings = #guitar-tuning" \n
"%\\set TabStaff.stringTunings = #guitar-open-g-tuning" \n
\n
> "\\stringmusic" \n
> ">>" \n
> ">>" \n
> ">>" \n
\n
> "\\layout{ indent = #0 }" \n
\n
> "}" \n
)



(define-skeleton Lilypond-ukelele
"Inserts a template for ukelele with tablature."
nil ;is this worthwhile? maybe should be four string instrument.
"FIXME" \n )

(define-skeleton Lilypond-guitar-frets-lyrics
"Inserts a template for guitar with fret diagrams, chord names and lyrics."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly if this is not the version of lilypond you have." \n
> "\\include \"simple-chord-frets.ly\""\n
\n
"% For more information on fret diagram markup go to (info \"(lilypond) Fret diagrams\")" \n
"% and (info \"(lilypond) Overview of text markup commands\"). Put your cursor after" \n
"% the last parenthesis and C-x C-e." \n
\n
> "verseI = \\lyricmode {" \n
> "\\set stanza = \"1.\"	" \n
> "LYRICS" \n
> "}" \n
\n
> "verseII = \\lyricmode {" \n
> "\\set stanza = \"2.\"	" \n
> "LYRICS" \n
> "}" \n
\n
> "theChords = \\new ChordNames {" \n
> "\\chordmode {" \n
> "% insert the chords for chordnames here" \n
> "INSERT CHORDS" \n
> "}" \n
> "}" \n
\n
> "staffMelody = \\new Staff  {" \n
> "\\context Voice = \"voiceMelody\" {" \n
> "\\key c \\major" \n
> "\\clef \"G_8\"" \n
> "\\relative c' { " \n
> "% Type notes and fret diagram markups here " \n
> "INSERT NOTES" \n
> "}" \n
> "}" \n
> "}" \n
\n
\n
> "\\score {" \n
> "<<" \n
> "\\theChords" \n
> "\\staffMelody" \n
> "\\context Lyrics = \"lyricsI\" \\lyricmode  {" \n
> "\\lyricsto \"voiceMelody\" \\verseI " \n
> "}" \n
> "\\context Lyrics = \"lyricsII\" \\lyricmode  {" \n
> "\\lyricsto \"voiceMelody\" \\verseII " \n
> "}" \n
\n
> ">>  " \n
\n
> "\\midi {" \n
> "}" \n
\n
> "\\layout {" \n
> "}" \n
> "}" \n
\n
> "\\paper {" \n
> "}" \n
\n
)

(defun LilyPond-guitar-frets ()
"Insert a template for bagpipes and open simple-chord-frets.ly in other window.
Which has a number of fret-diagrams already done for you."
(interactive)
(Lilypond-guitar-frets-lyrics)
(cond ((string-match "linux" system-configuration)
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /simple-chord-frets.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "bsd" system-configuration);trial
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /simple-chord-frets.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "cygwin" system-configuration);trial
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /simple-chord-frets.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "osx" system-configuration);trial
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /simple-chord-frets.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "mingw" system-configuration)
       (message "%s" "Sorry, I can't open simple-chord-frets.ly on Windows"))))

;(provide 'lilypond-string-templates)
;;; lilypond-string-templates.el ends here


