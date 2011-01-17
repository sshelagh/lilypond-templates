;;; lilypond-other-templates.el --- 

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
;;; It will be loaded if the variable LilyPond-other-templates-p is t(rue).

;;; Code:


;;; drums
;; For the purposes of this template I'd better put it all in one buffer.  TODO: Make a file
;;       out of this bunch of text so it can be used by the drum and then destroy it? so
;;       it doesn't exist after the lilypond file is closed? too complex?

(define-skeleton LilyPond-drum-score
"Insert a template for a drum track."
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
"% For more information go to (info \"(lilypond)Percussion staves\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
" % \include \"drumpitch-init.ly\" " \n
"% The file in the other buffer is drumpitch-init.ly which has some drum note variables which are useful." \n
\n
> "#(define mydrums-style '(" \n
\n
> "(acousticbassdrum () #f -3)" \n
> "(bassdrum () #f -3)" \n
> "(sidestick cross #f 1)" \n
> "(acousticsnare () #f 1)" \n
> "(snare () #f 1)" \n
> "(handclap triangle #f 1)" \n
> "(electricsnare () #f 1)" \n
> "(lowfloortom () #f -4)" \n
> "(closedhihat cross \"stopped\" 3)" \n
> "(hihat cross #f 3)" \n
> "(highfloortom () #f -2)" \n
> "(pedalhihat cross #f -5)" \n
> "(lowtom () #f -1)" \n
> "(openhihat cross \"open\" 3)" \n
> "(halfopenhihat xcircle #f 3)" \n
> "(lowmidtom () #f 0)" \n
> "(himidtom () #f 2)" \n
> "(crashcymbala xcircle #f 5)" \n
> "(crashcymbal xcircle #f 5)" \n
> "(hightom () #f 4)" \n
> "(ridecymbala cross #f 5)" \n
> "(ridecymbal cross #f 5)" \n
> "(chinesecymbal mensural #f 5)" \n
> "(ridebell () #f 5)" \n
> "(tambourine () #f 6)" \n
> "(splashcymbal diamond #f 5)" \n
> "(cowbell triangle #f 5)" \n
> "(crashcymbalb cross #f 5)" \n
> "(vibraslap diamond #f 4)" \n
> "(ridecymbalb cross #f 5)" \n
> "))" \n
\n
> "#(define mypercussions-style '(" \n
\n
> "(tambourine () #f 6)" \n
> "(lobongo () #f -1)" \n
> "(openlobongo () \"open\" -1)" \n
> "(mutelobongo () \"stopped\" -1)" \n
> "(hibongo () #f 1)" \n
> "(openhibongo () \"open\" 1)" \n
> "(mutehibongo () \"stopped\" 1)" \n
\n
> "(loconga () #f -2)" \n
> "(openloconga () \"open\" -1)" \n
> "(muteloconga () \"stopped\" -1)" \n
> "(hiconga () #f 2)" \n
> "(openhiconga () \"open\" 2)" \n
> "(mutehiconga () \"stopped\" 2)" \n
\n
> "(hitimbale () #f 1)" \n
> "(lotimbale () #f -1)" \n
> "(hiagogo () #f 1)" \n
> "(loagogo () #f -1)" \n
> "(cabasa cross #f 6)" \n
> "(maracas cross #f 0)" \n
> "(shortwhistle cross staccato -2)" \n
> "(longwhistle cross  tenuto -2)" \n
> "(shortguiro cross staccato -4)" \n
> "(longguiro cross tenuto -4)" \n
> "(guiro cross #f 12)" \n
> "(cowbell triangle #f 5)" \n
> "(claves diamond #f 0)" \n
> "(hiwoodblock () #f -3)" \n
> "(lowoodblock () #f -4)" \n
> "(mutecuica diamond \"open\" 1)" \n
> "(opencuica diamond \"stopped\" 1)" \n
> "(triangle cross #f 0)" \n
> "(opentriangle cross \"open\" 0)" \n
> "(mutetriangle cross \"stopped\" 0)" \n
> "))" \n
\n
> "pulseone = \\drummode { " \n
> "\\time 4/4 " \n
> "\\tempo 4 = 120 " \n
> _ "%bd for example" \n
> "}" \n
\n
> "pulsetwo = \\drummode { " \n
> "\\time 4/4 " \n
> "\\tempo 4 = 120 " \n
> "INSERT NOTES" \n
> "}" \n
\n
> "pulsethree = \\drummode { " \n
> "\\time 4/4 " \n
> "\\tempo 4 = 120 " \n
> "INSERT NOTES" \n
> "}" \n
\n
"\\score {" \n
> "<< " \n
> "\\new DrumStaff \\with {" \n
> "drumStyleTable =  #(alist->hash-table mydrums-style)" \n
> "\\override DrumStaff #'TimeSignature #'style = #'()" \n
> "}" \n
> "<<" \n
> "\\set Staff.instrumentName = \"Drums\"" \n
> "\\override Score.MetronomeMark #'extra-offset = #'(-10 . 2.5)" \n
> "\\pulseone" \n
> ">>" \n
> "\\new DrumStaff \\with { " \n
> "drumStyleTable = #(alist->hash-table mypercussions-style)" \n
> "}" \n
\n
> "<<" \n
> "\\set Staff.instrumentName =  \\markup{ \\column {\"Bongos\"" \n
> "\\line {\"Congas\"} } \\hspace #1.0 }" \n
> "\\new DrumVoice { \\pulsetwo }" \n
> "\\override DrumStaff.VerticalAxisGroup #'minimum-Y-extent = #'(-8  . 8 )" \n
> ">>  " \n
\n
> "\\new DrumStaff \\with { " \n
> "drumStyleTable = #(alist->hash-table mypercussions-style)" \n
> "}" \n
\n
> "<<" \n
> "\\set Staff.instrumentName =  \\markup{ \\column {\"Percussions\"" \n
> "\\line {\"diverses\"} } \\hspace #1.0 }" \n
> "\\new DrumVoice { \\pulsethree }" \n
> "\\override DrumStaff.VerticalAxisGroup #'minimum-Y-extent = #'(-5  . 5 )" \n
> ">>  " \n
\n
> ">>  " \n
\n
> "\\layout {}" \n
\n
> "\\midi {" \n
> "\\context {" \n
> "\\Score" \n
> "tempoWholesPerMinute = #(ly:make-moment 120 4)" \n
> "}" \n
> "}" \n
> "}" \n
)
;; the following could profitably be made into a macro as it appears to be used quite often.
(defun LilyPond-drums ()
"Insert a template for drums and open drumpitch-init.ly in the other buffer."
(interactive)
(LilyPond-drum-score)
(cond ((string-match "linux" system-configuration)
       (let ((drums (car (split-string (shell-command-to-string "locate /drumpitch-init.ly")))))
	 (view-file-other-window drums)))
      ((string-match "bsd" system-configuration);trial
       (let ((drums (car (split-string (shell-command-to-string "locate /drumpitch-init.ly")))))
	 (view-file-other-window drums)))
      ((string-match "cygwin" system-configuration);trial
       (let ((drums (car (split-string (shell-command-to-string "locate /drumpitch-init.ly")))))
	 (view-file-other-window drums)))
      ((string-match "osx" system-configuration);trial
       (let ((drums (car (split-string (shell-command-to-string "locate /drumpitch-init.ly")))))
	 (view-file-other-window drums)))
      ((string-match "mingw" system-configuration)
        ;  (let ((drums (shell-command-to-string "dir c:\\ /s /b | find \"drumpitch-init.ly\""))))
	 ;(view-file-other-window drums))))
       (message "%s" "Sorry, I can't open drumpitch-init.ly on Windows"))))

;; Shows how to set up drum scores with different built-in styles. Find the reference to the different styles.
;; for (info "(lilypond) drummodes?")
;; drh = \drummode { cymc4.^"crash" hhc16^"h.h." hh hhc8 hho hhc8 hh16 hh hhc4 r4 r2 }
;; drl = \drummode { bd4 sn8 bd bd4 << bd ss >>  bd8 tommh tommh bd toml toml bd tomfh16 tomfh }
;; timb = \drummode { timh4 ssh timl8 ssh r timh r4 ssh8 timl r4 cb8 cb }
;; (info "(lilypond)Persussion staves")
;; \score {
;;   <<
;;     \new DrumStaff \with {
;;       drumStyleTable = #timbales-style
;;      % drumStyleTable = #congas-style
;;      % drumStyleTable = #bongos-style
;;      % drumStyleTable = #percussion-style
;;       \override StaffSymbol #'line-count = #2
;;       \override BarLine #'bar-size = #2
;;     } <<
;;\set Staff.instrumentName = #"timbales" 
;;       \timb
;;     >>
;;     \new DrumStaff <<
;;       \set Staff.instrumentName = #"drums"
;;       \new DrumVoice { \stemUp \drh }
;;       \new DrumVoice { \stemDown \drl }
;;     >>
;;   >>
;;   \layout { }
;;   \midi {
;;     \context {
;;       \Score
;;       tempoWholesPerMinute = #(ly:make-moment 120 4)
;;     }
;;   }
;; }
;;; jazz

(define-skeleton LilyPond-jazz-combo
"Insert template for jazz combo for horns, guitar, piano, bass, and drums. Place point at first insertion point"
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)FIXME\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
> "#(set-global-staff-size 16)" \n
> "\\include \"english.ly\"" \n
\n
" global = {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> "}"
\n
"% LilyPond example file by Amelie Zapf,"
\n
> "%%%%%%%%%%%% Some macros %%%%%%%%%%%%%%%%%%%" \n
\n
> "sl = {" \n
> "\\override NoteHead #'style = #'slash" \n
> "\\override Stem #'transparent = ##t" \n
> "}" \n
> "nsl = {" \n
> "\\revert NoteHead #'style" \n
> "\\revert Stem #'transparent" \n
> "}" \n
> "cr = \\override NoteHead #'style = #'cross" \n
> "ncr = \\revert NoteHead #'style" \n
\n
> "%% insert chord name style stuff here." \n
\n
> "jzchords = { }" \n
\n
\n
> "% ############ Horns ############" \n
\n
> "% ------ Trumpet ------" \n
> "trpt = \\transpose c d \\relative c'' {" \n
> "INSERT NOTES" \n
> "}" \n
> "trpharmony = \\transpose c' d {" \n
> "\\jzchords" \n
> "}" \n
> "trumpet = {" \n
> "\\global" \n
> "\\set Staff.instrumentName = #\"Trumpet\"" \n
> "\\clef treble" \n
> "<<" \n
> "\\trpt" \n
> ">>" \n
> "}" \n
\n
> "% ------ Alto Saxophone ------" \n
> "alto = \\transpose c a \\relative c' {" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
> "altoharmony = \\transpose c' a {" \n
> "\\jzchords" \n
> "}" \n
> "altosax = {" \n
> "\\global" \n
> "\\set Staff.instrumentName = #\"Alto Sax\"" \n
> "\\clef treble" \n
> "<<" \n
> "\\alto" \n
> ">>" \n
> "}" \n
\n
> "% ------ Baritone Saxophone ------" \n
> "bari = \\transpose c a' \\relative c {" \n
> "\\Key" \n
> "INSERT NOTES % eg. c1 c \\sl d4^\"Solo\" d d d \\nsl" \n
> "}" \n
> "bariharmony = \\transpose c' a \\chordmode {" \n
> "\\jzchords" \n
> "}" \n
> "barisax = {" \n
> "\\global" \n
> "\\set Staff.instrumentName = #\"Bari Sax\"" \n
> "\\clef treble" \n
> "<<" \n
> "\\bari" \n
> ">>" \n
> "}" \n
\n
> "% ------ Trombone ------" \n
> "tbone = \\relative c {" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
> "tboneharmony = \\chordmode {" \n
> "\\jzchords" \n
> "}" \n
> "trombone = {" \n
> "\\global" \n
> "\\set Staff.instrumentName = #\"Trombone\"" \n
> "\\clef bass" \n
> "<<" \n
> "\\tbone" \n
> ">>" \n
> "}" \n
\n
> "% ############ Rhythm Section #############" \n
\n
> "% ------ Guitar ------" \n
> "gtr = \\relative c'' {" \n
> "INSERT NOTES" \n
> "}" \n
> "gtrharmony = \\chordmode {" \n
> "\\jzchords" \n
> "CHORDS %eg s1 c2:min7+ d2:maj9" \n
> "}" \n
> "guitar = {" \n
> "\\global" \n
> "\\set Staff.instrumentName = #\"Guitar\"" \n
> "\\clef treble" \n
> "<<" \n
> "\\gtr" \n
> ">>" \n
> "}" \n
\n
> "%% ------ Piano ------" \n
> "rhUpper = \\relative c'' {" \n
> "\\voiceOne" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
> "rhLower = \\relative c' {" \n
> "\\voiceTwo" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
\n
> "lhUpper = \\relative c' {" \n
> "\\voiceOne" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
> "lhLower = \\relative c {" \n
> "\\voiceTwo" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
\n
> "PianoRH = {" \n
> "\\clef treble" \n
> "\\global" \n
> "\\set Staff.midiInstrument = \"acoustic grand\"" \n
> "<<" \n
> "\\new Voice = \"one\" \\rhUpper" \n
> "\\new Voice = \"two\" \\rhLower" \n
> ">>" \n
> "}" \n
\n
> "PianoLH = {" \n
> "\\clef bass" \n
> "\\global" \n
> "\\set Staff.midiInstrument = \"acoustic grand\"" \n
> "<<" \n
> "\\new Voice = \"one\" \\lhUpper" \n
> "\\new Voice = \"two\" \\lhLower" \n
> ">>" \n
> "}" \n
\n
> "piano = {" \n
> "<<" \n
> "\\set PianoStaff.instrumentName = #\"Piano\"" \n
> "\\new Staff = \"upper\" \\PianoRH" \n
> "\\new Staff = \"lower\" \\PianoLH" \n
> ">>" \n
> "}" \n
\n
> "% ------ Bass Guitar ------" \n
> "Bass = \\relative c {" \n
> "\\Key" \n
> "INSERT NOTES" \n
> "}" \n
> "bass = {" \n
> "\\global" \n
> "\\set Staff.instrumentName = #\"Bass\"" \n
> "\\clef bass" \n
> "<<" \n
> "\\Bass" \n
> ">>" \n
> "}" \n
\n
> "% ------ Drums ------" \n
> "up = \\drummode {" \n
> "INSERT NOTES %eg. hh4 <hh sn>4 hh <hh sn> hh <hh sn>4" \n
> "}" \n
\n
> "down = \\drummode {" \n
> "INSERT NOTES %eg.bd4 s bd s bd s bd s bd s bd s" \n
> "}" \n
\n
> "drumContents = {" \n
> "\\global" \n
> "<<" \n
> "\\set DrumStaff.instrumentName = #\"Drums\"" \n
> "\\new DrumVoice { \\voiceOne \\up }" \n
> "\\new DrumVoice { \\voiceTwo \\down }" \n
> ">>" \n
> "}" \n
\n
> "%%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%" \n
\n
> "\\score {" \n
> "<<" \n
> "\\new StaffGroup = \"horns\" <<" \n
> "\\new Staff = \"trumpet\" \\trumpet" \n
> "\\new Staff = \"altosax\" \\altosax" \n
> "\\new ChordNames = \"barichords\" \\bariharmony" \n
> "\\new Staff = \"barisax\" \\barisax" \n
> "\\new Staff = \"trombone\" \\trombone" \n
> ">>" \n
\n
> "\\new StaffGroup = \"rhythm\" <<" \n
> "\\new ChordNames = \"chords\" \\gtrharmony" \n
> "\\new Staff = \"guitar\" \\guitar" \n
> "\\new PianoStaff = \"piano\" \\piano" \n
> "\\new Staff = \"bass\" \\bass" \n
> "\\new DrumStaff { \\drumContents }" \n
> ">>" \n
> ">>" \n
\n
> "\\layout {" \n
> "\\context { \\RemoveEmptyStaffContext }" \n
> "\\context {" \n
> "\\Score" \n
> "\\override BarNumber #'padding = #3" \n
> "\\override RehearsalMark #'padding = #2" \n
> "skipBars = ##t" \n
> "}" \n
> "}" \n
\n
> "\\midi { }" \n
> "}" \n
)

(define-skeleton LilyPond-bagpipe-skeleton
"Insert a template for bagpipes and leave cursor at insertion point."
nil
"\\version \"2.11.23\" " \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Bagpipe\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
> "\\include \"bagpipe.ly\"" \n
"% If you are on Linux, the file in the other buffer is bagpipe.ly."\n
"%It has some useful variables to use." \n
> "\\layout {" \n
> "indent = 0.0\\cm" \n
> "\\context { \\Score \\remove \"Bar_number_engraver\" }" \n
> "}" \n
\n
> "{" \n
> "\\hideKeySignature" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4" \n
> "INSERT NOTES %eg. \\grg \\partial 4 a8. d16" \n
> "\\bar \"|.\"" \n
> "}" \n
)


(defun LilyPond-bagpipe ()
"Insert a template for bagpipes and open bagpipe.ly in other window.
Which has a number very useful variables for bagpipe music."
(interactive)
(LilyPond-bagpipe-skeleton)
(cond ((string-match "linux" system-configuration)
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /bagpipe.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "bsd" system-configuration);trial
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /bagpipe.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "cygwin" system-configuration);trial
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /bagpipe.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "osx" system-configuration);trial
       (let ((bagpipes (car (split-string (shell-command-to-string "locate /bagpipe.ly")))))
	 (view-file-other-window bagpipes)))
      ((string-match "mingw" system-configuration)
        ;  (let ((bagpipes (shell-command-to-string "dir c:\\ /s /b | find \"bagpipe.ly\""))))
	 ;(view-file-other-window bagpipes))))
       (message "%s" "Sorry, I can't open bagpipes.ly on Windows"))));this is simply cause I
					;cannot work out how to do it. 
;;  I did try this: ((string-match "mingw" system-configuration) (let ((bagpipes
;;  (shell-command-to-string "dir c:\\ /s /b | find \"bagpipe.ly\""))))
;;  (view-file-other-window bagpipes)) However emacs functions choke on the space between
;;  "Program Files" Hmm... maybe I shouldn't use split-string? I tried without
;;  splitstrings and it complains that bagpipe.ly doesn't exist, even tho' it finds it.
;;  and I am not skilled enough to get over this hurdle. som.


;(provide 'lilypond-other-templates)
;;; lilypond-other-templates.el ends here
