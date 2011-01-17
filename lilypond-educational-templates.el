;;; lilypond-educational.templates.el --- 

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
;;; It will be loaded if the variable LilyPond-educational-templates-p is t(rue).

;;; Code:this file is an add-on for lilypond-skeletons.el.
;;; It will be loaded if the variable LilyPond-educational-templates-p is t(rue).

;;; education helpers

;;Blank pages of music

(define-skeleton blank-treble-clef
"Insert blank staffs with treble clefs.
You will be able to change sizes of staffs easily."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n
\n
"% Uncomment the next line if you want a landscape page." \n
"% Of course change the paper setting to \"letter\" if need be." \n
"%#(set-default-paper-size \"a4\" 'landscape)" \n
" #(set-global-staff-size 14) % larger numbers mean larger staffs." \n
\n
> "emptymusic = {" \n
> "\\repeat unfold 6 % Change this for more lines." \n
> "{ s1\\break }" \n
> "\\bar \"|.\"" \n
> "}" \n
\n
> "\\score {" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t" \n
> "defaultBarType = #\"\"" \n
> "\remove Bar_number_engraver" \n
\n
> "\new Staff \emptymusic" \n
\n
> "\\layout{ indent = #0 }" \n
\n
> "}" \n
\n
)

(define-skeleton blank-staff
"Just blank music staffs."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
\n
" % Uncomment the next line if you want a landscape page." \n
" % Of course change the paper setting to \"letter\" if need be." \n
" % #(set-default-paper-size \"a4\" 'landscape)" \n
" #(set-global-staff-size 16) % larger numbers mean larger staffs." \n
\n
> "emptymusic = {" \n
> "\\repeat unfold 6 % Change this for more or less lines." \n
> "{ s1\\break }" \n
> "\\bar \"|.\"" \n
> "}" \n
\n
> "\\score {" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t" \n
> "\\override Clef #'transparent = ##t" \n
> "defaultBarType = #\"\"" \n
> "\\remove Bar_number_engraver" \n
> "} " \n
\n
> "\\new Staff \\emptymusic" \n
\n
> "\\layout{ indent = #0 }" \n
> "}" \n
)

(define-skeleton blank-piano
"Just the piano staffs."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
\n
"% Uncomment the next line if you want a landscape page." \n
"% Of course change the paper setting to \"letter\" if need be." \n
"%#(set-default-paper-size \"a4\" 'landscape)" \n
" #(set-global-staff-size 16) % larger numbers mean larger staffs." \n
\n
> "emptymusic = {" \n
> "\\repeat unfold 6 % Change this for more or less staffs." \n
> "{ s1\\break }" \n
> "\\bar \"|.\"" \n
> "}" \n
\n
> "\\score {" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t" \n
> "defaultBarType = #\"\"" \n
> "\remove Bar_number_engraver" \n
> "} " \n
\n
> "\\new PianoStaff << " \n
> "\\new Staff = \"upper\" \\emptymusic" \n
> "\\new Staff = \"lower\" \\emptymusic" \n
> ">>" \n
\n
> "\\layout{ indent = #0 }" \n
> "}" \n
)

(define-skeleton blank-tab
"Insert blank tablature staffs."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
\n
"% Uncomment the next line if you want a landscape page." \n
"% Of course change the paper setting to \"letter\" if need be." \n
"% #(set-default-paper-size \"a4\" 'landscape)" \n
" #(set-global-staff-size 16) % larger numbers mean larger staffs." \n
\n
> "emptymusic = {" \n
> "\\repeat unfold 6 % Change this for more or less staffs." \n
> "{ s1\\break }" \n
> "\\bar \"|.\"" \n
> "}" \n
\n
> "\\score {" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t" \n
> "defaultBarType = #\"\"" \n
> "\remove Bar_number_engraver" \n
> "} " \n
> "\\new TabStaff <<" \n
"% This does the standard Tablature for guitar with six strings." \n
"% Uncomment whichever one suits your stringed instrument, if it's not a guitar." \n
"%\\set TabStaff.stringTunings = #bass-tuning" \n
"%\\set TabStaff.stringTunings = #guitar-open-g-tuning" \n
"%\\set TabStaff.stringTunings = #mandolin-tuning" \n
"%\\set TabStaff.stringTunings = #banjo-c-tuning" \n
"%\\set TabStaff.stringTunings = #(four-string-banjo banjo-c-tuning)" \n
\n
> "\\emptymusic" \n
> ">>" \n
\n
> "\\layout{ indent = #0 }" \n
\n
> "}" \n
)

(define-skeleton learning-clefs
" Make a page of trable clefs for children to practice writing."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n 
\n
> "\\layout{ indent = #0 }" \n
\n
> "violinsettings = {" \n
 "%I don't want to change the Clef's size " \n
> "\\override Staff.Clef #'full-size-change = ##t" \n
 "%I'd like many violin cleffs" \n
> "\\override Staff.Clef #'break-visibility = ##(#t #t #t)" \n
 "%Let the Clef's color grey, so children can redraw it with" \n
 "%a pencil" \n
> "\\override Staff.Clef #'color = #(x11-color 'grey80)" \n
> "}" \n
 "%----------------------------------------------" \n
 "%The big violins" \n
 "%----------------------------------------------" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t defaultBarType = #\"\"" \n
> "\\remove Bar_number_engraver" \n
> "} <<" \n
> "" \n
> "" \n
> "\\new Staff {" \n
> "\\override Staff.StaffSymbol #'staff-space = #4" \n
> "\\override Staff.Clef #'font-size = #+12 s1" \n
 "% Let the first violin black" \n
> "\\violinsettings" \n
> "s1 s1 s1 s1 s1 \\break" \n
> "s1 s1 s1 s1 \\break" \n
> "}" \n
> ">>" \n
> "" \n
 "%----------------------------------------------" \n
 "%The medium-sized  violins" \n
 "%----------------------------------------------" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t defaultBarType = #\"\"" \n
> "\\remove Bar_number_engraver" \n
> "} <<" \n
> "" \n
> "\\new Staff {" \n
> "\\override Staff.StaffSymbol #'staff-space = #2 \\override" \n
> "Staff.Clef #'font-size = #+6 s1" \n
> "\\violinsettings" \n
> "s1 s1 s1 s1 s1 s1 s1 \\break" \n
> "s1 s1 s1 s1 s1 s1 \\break" \n
> "}" \n
> ">>" \n
> " " \n
 "%----------------------------------------------" \n
 "%The normal-sized violins" \n
 "%----------------------------------------------" \n
> "\\new Score \\with {" \n
> "\\override TimeSignature #'transparent = ##t defaultBarType = #\"\"" \n
> "\\remove Bar_number_engraver" \n
> "} <<" \n
> "" \n
> "\\new Staff {" \n
> "s1" \n
> "\\violinsettings" \n
> "s1 s1 s1 s1 s1 s1 s1 s1 s1 s1 s1 \\break s1 s1 s1 s1 s1 s1" \n
> "\\break" \n
> "}" \n
> ">>" \n
)

(define-skeleton LilyPond-easynotes
"Inserts a template for use with easynotes.
It uses large staffs and large noteheads to make full use of the easynote font.
I can't say that the output is great, no matter how it is tweaked."
nil
> "\\version \"2.11.35\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n
"% For more information go to (info \"(lilypond)Educational use\"). Put your cursor after the " \n
"% last parentheses and C-x C-e." \n
\n
" #(set-default-paper-size \"a4\" 'landscape)" \n
" #(set-global-staff-size 40) % larger numbers mean larger staffs." \n
\n
> "easynotemusic = {" \n
> "\\set fontsize = #-1 " \n
> "\\setEasyHeads " \n
> _ \n
> "}" \n
\n
> "\\score {" \n
> "\\new Staff \\easynotemusic" \n
\n
> "\\layout{ indent = #0 }" \n
\n
> "}" \n
\n
)

;(provide 'lilypond-educational.templates) I want it to be loaded not required.
;;; lilypond-educational.templates.el ends here
