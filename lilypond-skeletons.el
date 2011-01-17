;;; lilypond-skeletons.el --- Adds a menu for easy access to LilyPond templates.

;; Copyright (C) 2007,2008 Shelagh Manton <shelagh.manton@gmail.com>

;; Author: Shelagh Manton <shelagh.manton@gmail.com>

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
;; 
;; This is intended to be a library of skeletons for use with
;; LilyPond-mode. Put the following into your  .emacs file
;; (add-hook 'Lilypond-mode-hook (lambda () (abbrevs-mode 1))) if you want to
;; use abbrevs and the following to load the file in lilypond-mode.
;; (add-hook 'Lilypond-mode-hook (lambda () (load-library "/path/to/your/lilypond-skeletons.el")))
;; or (eval-after-load "LilyPond-mode" (load-library "/path/to/your/lilypond-skeletons.el"))

;; There are two ways to use the structural skeletons.  You can just
;; call them (eg. M-x LilyPond-slur) as you write a LilyPond file and enter
;; the notes where the cursor is placed after inserting the skeleton or
;; you can select the notes you wish to enclose in the lilypond
;; structure and then call the LilyPond-whatever function and the notes will
;; be placed in the right place.  Things that are optional can be ignored and RET safely
;; and the next interactive skeleton is presented, where possible I have put reasonable defaults.

;;; History:

;; Initial revision


(require 'lilypond-mode)

;;; Set up variables so other files can be loaded in. If wanted.
;;; They default to true so at first people can know what is available.

(defcustom LilyPond-vocal-templates-p t
"Do you want the vocal templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-vocal-templates-p) (load-library "lilypond-vocal-templates"))

(defcustom LilyPond-piano-templates-p t
"Do you want the piano templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-piano-templates-p) (load-library "lilypond-piano-templates"))

(defcustom LilyPond-parts-templates-p t
"Do you want the parts templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-parts-templates-p) (load-library "lilypond-parts-templates"))

(defcustom LilyPond-educational-templates-p t
"Do you want the parts templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-educational-templates-p) (load-library "lilypond-educational-templates"))

(defcustom LilyPond-string-templates-p t
"Do you want the string templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-string-templates-p) (load-library "lilypond-string-templates"))

(defcustom LilyPond-other-templates-p t
"Do you want the parts templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-other-templates-p) (load-library "lilypond-other-templates"))

(defcustom LilyPond-ancient-templates-p t
"Do you want the ancient templates loaded and in the menu."
:type 'boolean
:group 'LilyPond)

(if (symbol-value LilyPond-ancient-templates-p) (load-library "lilypond-ancient"))
;;; Code:
; I took out the lilypond-book stuff as that is not in lilypond format but uses the latex stuff. It does not belong here.
;;; Headers
 
(define-skeleton LilyPond-header
"Interactively inserts header for Lilypond file.
You need to decide where it goes as you can put a header block
the last thing in a \score block, or by itself in the .ly
file. There are some basic defaults if you don't know what to
put, and if you don't want a section just RET. Lilypond markup is
acceptable in these strings. There is an opportuntity to define
your own personalised header. See LilyPond-myheader."
 nil
"\\header {" \n
> "title = \""(skeleton-read "Title is: ") "\" " \n
> "composer = \""(skeleton-read "Composer is: ")\| (user-full-name) "\" " \n
> "copyright = \""(skeleton-read "Copyright: ") \| "Public Domain\" " \n
> ( "Optional, Maintainer is: " "maintainer = \"" str "\" " \n)
resume:
> ( "Optional, Words by: " "poet = \"" str "\" " \n) ;;subprompt
resume:
> ( "Optional, Subtitle is: " "subtitle = \"" str "\" " \n);;subprompt
resume:
> ( "Optional, Arranger is: " "arranger = \"" str "\" " \n) ;;subprompt
resume:
> ( "Optional, Tempo is: " "meter = \"" str "\" "\n )
resume:
> ( "Optional, Instrument?: " "instrument =  \"" str "\" "\n)
resume:
> ( "Optional, Dedicated to: " "dedication = \"" str "\" "\n)
resume:
> ( "Optional, And at the bottom of the last page?: " "tagline = \"" str " "(format-time-string "%d %b %Y")"\"")\n
resume:
> "}" \n
)
 
 (define-skeleton LilyPond-myheader
 "Interactively inserts personal header for Lilypond files.
  You need to change this to make it useful for you. Of course you may delete
 lines which are not applicable to your case. I suggest you copy this to your
 init-file and change it as necessary"
 " "
 "\\header" \n
 > "{" \n
 > "title = \"" (skeleton-read "Title is: ") "\" " \n ; leave this line.
 > "composer = \"" (user-full-name) "\" " \n
 > "copyright = \" YOUR DEFAULT COPYRIGHT CLAUSE \" " \n
 > "poet = \" YOUR POETS NAME \" " \n ; no words? get rid of this line.
 > ( "Subtitle is: " "subtitle = \"" str "\" " \n); sometimes we might want a subtitle
  resume:
 > "arranger = \" YOUR ARRANGERS NAME \" " \n
 > ( "Optional, Tempo is: " "meter = \"" str "\" "\n )
 resume:
 > "tagline = \" WHAT YOU WANT ON THE BOTTOM OF THE LAST PAGE "(format-time-string "%b %Y")"\""  \n
 > "}" \n
 )

;;; variables
 
(define-skeleton LilyPond-global
"A simple global variable"
nil
"global = {"\n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\|" \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4" \n
> ("Sometimes we want to define clef: " "\\clef " str )\n
resume:
> "}" \n
)

(define-skeleton LilyPond-global-min
"An even simpler global variable"
nil
"global = {"\n
> "\\key "(skeleton-read "Key: ")\|" c "(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4" \n
> "}" \n
)

;;Define your own variables. Might be useful for beginners?
(define-skeleton LilyPond-variable
"Define a variable for lilypond"
nil
(skeleton-read "Name of variable: ") " = {"\n
> _ \n
>"}" \n
)

;;; Templates

;;;Notes only. Leave these ones in the main library.

(define-skeleton LilyPond-melody
"Insert simple melody skeleton.
Suitable for a solo instrument or a melodic fragment" nil
> "\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"melody = \\relative c' {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> ("Sometimes we want to define clef: " "\\clef " str )\n
resume:
> _ \n
> "}" \n
\n
"\\score {" \n
> "\\new Staff \\melody" \n
> "\\layout { }" \n
> "\\midi {}" \n
> "}" \n
)

;;;Notes and chords

(define-skeleton LilyPond-melody-chords
"Insert simple melody skeleton with chords"
nil
> "\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
> "melody = \\relative c' {" \n
> "\\key "(skeleton-read "Key: ")\|" c"(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| " 4/4" \n
> ("Sometimes we want to define clef: " "\\clef " str ) resume: \n
> _ \n
> "}" \n
\n
> "harmonies = \\chordmode {" \n
> "CHORDS %for example c d:dim e:sus4 (not real music!)" \n
> "}" \n
\n
> "\\score {" \n
> "<<" \n
> "\\new ChordNames {" \n
> "\\set chordChanges = ##t" \n
> "\\harmonies" \n
> "}" \n
> "\\new Staff \\melody" \n
> ">>" \n
\n
> "\\layout{ }" \n
> "\\midi { }" \n
> "}" \n
)

;;; various useful skeletons

;;transpose skeleton. where the key to transpose from and to are asked
;;for. I left out the braces as sometimes variables are used.
(define-skeleton LilyPond-transpose-region
"Insert region into a transpose asking for key from and to."
nil
"\\transpose "(skeleton-read "From: ")" "(skeleton-read "To: ")" " _
)

(define-skeleton LilyPond-tuplet
"Wrap a region in or insert a triplet or tuplet"
nil
"\\times "(skeleton-read "Duration of notes/Number of notes eg:2/3 ") " { " _ " } " ;note in future the syntax is likely to use \tuplet not \times.
)

(define-skeleton LilyPond-slur
"Wrap a region in a slur structure"
nil
"( " _ ")"
)

(define-skeleton LilyPond-phrase
"Insert a phrasing slur"
nil
"\\( " _ "\\) "
)

(define-skeleton LilyPond-manual-beams
"Insert manual beams"
nil
"[ " _ "] "
)

(define-skeleton LilyPond-partial
"Insert a \\partial "
nil
"\\partial "(skeleton-read "Length of note*number of notes eg: 8*5 ")" " _ " \|" )

(define-skeleton LilyPond-cadenza
"Insert or wrap a region"
nil
"\\cadenzaOn " _ " \\cadenzaOff "
)

(define-skeleton LilyPond-crescendo
"Insert a crescendo"
nil
"\\< " _ "\\! "
)

(define-skeleton LilyPond-trill
"Insert a trill"
nil
"\\startTrillSpan " _ "\\stopTrillSpan "
)

(define-skeleton LilyPond-pedal
" "
nil
"\\sustainDown " _ "\\sustainUp "
)

(define-skeleton LilyPond-horizontal-bracket
"Insert analysis brackets or wrap a region in analysis brackets.
Put  \\Staff \\consists \"Horizontal_bracket_engraver\" in the layout block."
nil
"\\startGroup " _ "\\stopGroup "
)

(define-skeleton LilyPond-sostenuto
"Insert or wrap a region with sostenuto pedal."
nil
"\\sostenutoDown" _ "\\sostenutoUp "
)

(define-skeleton LilyPond-relative
"Insert a relative block or wrap a region in one."
nil
"\\relative { " _ " } "
)

(define-skeleton LilyPond-repeat
"Insert a repeat structure without an alternate ending."
nil
"\\repeat "(skeleton-read "volta, unfold, tremolo, percent: ")" "(skeleton-read "how many times? ") " { " _ " } "
)

(define-skeleton LilyPond-repeat-alternate
"Insert a repeat structure with an alternate ending.
Uses volta."
nil
"\\repeat volta "(skeleton-read "how many times? ") " { " _ " } " \n
> "\\alternative {" \n
> "{ INSERT NOTES } { INSERT NOTES } { ANY MORE? }"\n
> "}" \n
)

(define-skeleton LilyPond-text-spanner
"Insert a text spanner.  Some tweaks are #'edge-text
#'dash-period #'style #'edge-height #'dash-fraction
#'thickness. You can have more than one \override tweak.

 Some examples of TextSpanner tweaks.
     \override TextSpanner  #'dash-period = #2
     \override TextSpanner  #'dash-fraction = #0.0
     \override TextSpanner  #'style = #'dashed-line
     \override TextSpanner  #'edge-height = #'(1 . -2)
     \override TextSpanner  #'dash-period = #10
     \override TextSpanner  #'dash-fraction = #.5
     \override TextSpanner  #'thickness = #10"
  nil
("What kind of text spanner? For example; edge-text, style, or dash-period?:  ""\\override TextSpanner  #'"str" = #"(skeleton-read "What value; can be a number, 'string or '(list): "))\n
>" SINGLE NOTE \\startTextSpan " _ " \\stopTextSpan"
)

(define-skeleton LilyPond-concurrency-block
"Insert a << >> block or wrap a region in << >>."
nil
"<< " \n
_ \n
> ">>" \n
)

(define-key LilyPond-mode-map "\C-cy" 'LilyPond-transpose-region)
(define-key LilyPond-mode-map "\C-ce" 'LilyPond-partial)
(define-key LilyPond-mode-map "\C-ct" 'LilyPond-tuplet)
(define-key LilyPond-mode-map "\C-cj" 'LilyPond-slur)
(define-key LilyPond-mode-map "\C-cz" 'LilyPond-phrase)
(define-key LilyPond-mode-map "\C-cw" 'LilyPond-manual-beams)
(define-key LilyPond-mode-map "\C-cc" 'LilyPond-cadenza)
(define-key LilyPond-mode-map "\C-cs" 'LilyPond-crescendo)
(define-key LilyPond-mode-map (kbd "C-c x 4") 'LilyPond-trill)
(define-key LilyPond-mode-map "\C-ce" 'LilyPond-pedal)
(define-key LilyPond-mode-map "\C-cu" 'LilyPond-sostenuto)
(define-key LilyPond-mode-map (kbd "C-c x 1") 'LilyPond-repeat)
(define-key LilyPond-mode-map (kbd "C-c x 2") 'LilyPond-repeat-alternate)
(define-key LilyPond-mode-map "\C-cn" 'LilyPond-text-spanner)
(define-key LilyPond-mode-map "\C-ch" 'LilyPond-header)
(define-key LilyPond-mode-map "\C-cg" 'LilyPond-tags-section)
(define-key LilyPond-mode-map "\C-cv" 'LilyPond-variable)
(define-key LilyPond-mode-map "\C-cr" 'LilyPond-relative)
(define-key LilyPond-mode-map (kbd "C-c x 3") 'LilyPond-global)
(define-key LilyPond-mode-map "\C-c<" 'LilyPond-concurrency-block)

(easy-menu-define LilyPond-skeletons-menu 
   LilyPond-mode-map
   "Menu used in LilyPond mode."
   (append '("Templates")
	   ;; experimental trying to abstract out some sections of the file.
	   '(("Simple Templates"
	      [ "Simple Melody" LilyPond-melody :keysequence nil :help "Use lpm as an abbrev" ]
	      [ "Melody with Chords" LilyPond-melody-chords :keysequence nil :help "Use lpmc as an abbrev"]))
	   '(("Vocal Templates" :visible LilyPond-vocal-template-p 
	      [ "Melody with Lyrics" LilyPond-melody-lyrics :keysequence nil :help "Use lpml as an abbrev"]
	      [ "Leadsheet" LilyPond-leadsheet :keysequence nil :help "Use lpls as an abbrev"]
	      [ "Vocal Ensemble" LilyPond-vocal-ensemble :keysequence nil :help "Use lpve as an abbrev"]
	      [ "SATB & Piano Reduction" LilyPond-satb-piano-reduction :keysequence nil]
	      [ "SATB aligned contexts" LilyPond-satb-aligned-contexts :keysequence nil]
	      [ "Homophonic with Polyphonic Sections" Lilypond-homophonic-with-polyphonic :keysequence nil]
	      [ "Hymn Template" LilyPond-hymn :keysequence nil]
	      ))
	   '(("Ancient Music Templates" :visible LilyPond-ancient-templates-p
	       [ "Gregorian" LilyPond-gregorian-transcription :keysequence nil]
	       [ "Ancient Notation Style" LilyPond-neomensural :keysequence nil]
	      ;[ "Mensural" Haven't written it yet.
	      ;[ "Modern gregorian" Haven't written it yet.
	       ))
	   '(("Piano Templates" :visible LilyPond-piano-templates-p
	      [ "Solo Piano" LilyPond-solo-piano :keysequence nil]
	      [ "Piano with Lyrics" LilyPond-piano-melody-lyrics :keysequence nil]
	      [ "Piano with Centred Lyrics" LilyPond-piano-centered-lyrics :keysequence nil]
	      [ "Piano with Centred Dynamics" LilyPond-piano-centered-dynamics :keysequence nil]
	      ))
	   '(("Stringed Instruments" :visible LilyPond-string-templates-p
	      [ "Guitar & Fret Diagrams" LilyPond-guitar-frets :keysequence nil]
	      [ "String Quartet" LilyPond-string-quartet :keysequence nil]
	      [ "Strings & Tab" LilyPond-tabular :keysequence nil]
	      [ "Banjo Tablature" LilyPond-banjo-tab :keysequence nil]
;	      [ "Lute Tablature" LilyPond-lute-tab :keysequence nil] ;Shame as it looks like this will not happen soon.
	      ))
	   '(("Parts extraction" :visible LilyPond-parts-templates-p
	     [ "String Quartet with Parts" LilyPond-string-quartet-parts :keysequence nil]
	     [ "Parts file" LilyPond-sub-buffer :keysequence nil]
	     [ "Score file" LilyPond-score-buffer :keysequence nil]
	     [ "Tags Section" LilyPond-tags-section :keysequence nil]
	     ))
 	  '(("Other Templates" :visible LilyPond-other-templates-p
	     [ "Bagpipe" LilyPond-bagpipe :keysequence nil]
	     [ "Drum score" LilyPond-drums :keysequence nil]
	     ;[ "Specialist Drum score" LilyPond-special-drums :keysequence nil]
	     [ "Jazz Combo" LilyPond-jazz-combo :keysequence nil]
	     ))
	  '(("Music Education Aids" :visible LilyPond-educational-templates-p 
	     ["Blank Staff (treble clef)" blank-treble-clef :keysequence nil]
	     ["Blank Staff (no clef)" blank-staff :keysequence nil]
	     ["Blank Piano Staff" blank-piano :keysequence nil]
	     ["Blank Tablature Staff" blank-tab :keysequence nil]
	     ["Learning Treble Clefs" learning-clefs :keysequence nil]
	     ["Easy Notes for learners" LilyPond-easynotes :keysequence nil]
	     ))
 	  '([ "Title Header" LilyPond-header t])
	  '([ "Transpose Region" LilyPond-transpose-region t])
 	  '([ "Partial" LilyPond-partial :keys "C-c e"])
 	  '([ "Tuplet" LilyPond-tuplet t])
 	  '([ "Slur" LilyPond-slur t ])
 	  '([ "Phrase" LilyPond-phrase t ])
 	  '([ "Manual Beams" LilyPond-manual-beams t])
 	  '([ "Cadenza" LilyPond-cadenza t])
 	  '([ "Crescendo" LilyPond-crescendo t])
 	  '([ "Trill" LilyPond-trill t])
 	  '([ "Pedal" LilyPond-pedal t])
 	  '([ "Sostenuto" LilyPond-sostenuto t])
 	  '([ "Simple Repeat" LilyPond-repeat t])
	  '([ "Repeat with Alternate" LilyPond-repeat-alternate t])
 	  '([ "Text Spanner" LilyPond-text-spanner t])
 	  '([ "Relative" LilyPond-relative t])
	  '([ "Concurrency" LilyPond-concurrency-block t])
	  '("-----")
 	  '([ "Global Variable" LilyPond-global t])
 	  '([ "General Variable" LilyPond-variable t])
 	  ))

 (if (featurep 'xemacs)  (easy-menu-add LilyPond-skeletons-menu LilyPond-mode-map));apparently this makes the menu run in Xemacs too. 


;; font-lock-add-keywords So the words to replace are obvious.

(font-lock-add-keywords 'LilyPond-mode '(("\\<\\(ANY\\|CHORDS\\|DYNAMICS\\|F\\(?:IVE\\|OUR\\)\\|INSERT\\|LYRICS\\|MORE\\|NOTES?\\|ONE\\|PART\\|REFRAIN\\|SI\\(?:NGLE\\|X\\)\\|T\\(?:HREE\\|WO\\)\\)\\>" 1 font-lock-warning-face prepend))) 
;;"\\<[[:upper:]]+\\>" ;this one is too general.

 ;; I'm inclined to think that this is superfluous. However, people might like abbrevs and
 ;; they should know how to do them if they want them.
 (defvar LilyPond-mode-abbrev-table
   (let ((ac abbrevs-changed))
        (define-abbrev LilyPond-mode-abbrev-table "lpml" ""
	  'LilyPond-melody-lyrics)
	(define-abbrev LilyPond-mode-abbrev-table "lpmc" ""
	  'LilyPond-melody-chords)
	(define-abbrev LilyPond-mode-abbrev-table "lpve" ""
	  'LilyPond-vocal-ensemble)
;;     (define-abbrev LilyPond-mode-abbrev-table "lpgm" ""
;;       'LilyPond-global-min)
;;     (define-abbrev LilyPond-mode-abbrev-table "lpbk" ""
;;       'LilyPond-book-skeleton)
;;     (define-abbrev LilyPond-mode-abbrev-table "lpsn" ""
;;       'LilyPond-snippet)
;;     (define-abbrev LilyPond-mode-abbrev-table "lpbc" ""
;;       'LilyPond-block-comment)
;;     ;;You get the idea. However, the keybindings are probably better to learn.
  (setq abbrevs-changed ac)
  LilyPond-mode-abbrev-table))


(provide 'lilypond-skeletons)

;;; lilypond-skeletons.el ends here




;;; Put in the links to the info files for all the templates that I can.
;;; redo the ancient templates and maybe the jazz template.
;;; Another idea is to make a template wizard like I imagine lilypondtools works like and
;;; insert appropriate skeletons depending on the questions answered. Some of the framework
;;; may all ready be useful.