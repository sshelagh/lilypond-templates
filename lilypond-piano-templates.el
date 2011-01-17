;;; lilypond-piano-templates.el --- 

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
;;; It will be loaded if the variable LilyPond-piano-templates-p is t(rue).

;;; Code:

;;; piano 

(define-skeleton LilyPond-solo-piano
"Insert a simple piano staff."
nil
"\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n
"% For more information go to (info \"(lilypond)Piano music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
"global = {" \n
> "\\key "(skeleton-read "Key: ")\| "c  "(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| "4/4" \n
> "}" \n
> "upper = \\relative c'' {" \n
"\\global" \n
> _ \n
> "}" \n
\n
> " lower = \\relative c {" \n
"\\global"\n
> "INSERT NOTES" \n
> " }" \n
\n
"\\score {" \n
> "\\new PianoStaff <<" \n
> "\\set PianoStaff.instrumentName = \"Piano\"" \n
> "\\new Staff = \"upper\" \\upper" \n
> "\\new Staff = \"lower\" \\lower" \n
> ">>" \n
> "\\layout { }" \n
> "\\midi { }" \n
> "}" \n
)

;;;Piano and melody with lyrics



 (define-skeleton LilyPond-piano-melody-lyrics 
"Insert skeleton for melody with piano accompaniment."
nil
"\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Piano music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
"global = {"\n
> "\\key "(skeleton-read "Key: ")\| "c  "(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| "4/4" \n
> "}"
\n
"melody = \\relative c'' {" \n
> "\\clef \"treble\""\n
> _ \n
> "}" \n
\n
"text = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
"upper = \\relative c'' {" \n
> "\\clef \"treble\""\n
> "INSERT NOTES" \n
> "}" \n
\n
"lower = \\relative c {" \n
> "\\clef \"bass\""\n
> "INSERT NOTES" \n
> "}" \n
\n
"\\score {" \n
> "\\global" \n
> "<<" \n
> "\\new Voice = \"mel\" {" \n
> "\\autoBeamOff" \n
> "\\melody" \n
> "}" \n
\n
> "\\new Lyrics \\lyricsto mel \\text" \n
> "\\new PianoStaff <<" \n
> "\\new Staff = \"upper\" \\upper" \n
> "\\new Staff = \"lower\" \\lower" \n
> ">>" \n
> ">>" \n
\n
"\\layout {" \n
> "\\context { \\RemoveEmptyStaffContext }" \n
> "}" \n
\n
> "\\midi { }" \n
> "}" \n
)

;;;Piano centered lyrics


(define-skeleton LilyPond-piano-centered-lyrics
"Insert a skeleton for piano with centered lyrics"
nil
 "\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n
"% For more information go to (info \"(lilypond)Piano music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
"global = {" \n
> "\\key "(skeleton-read "Key: ")\| "c  "(skeleton-read "\\major or \\minor: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| "4/4" \n
> "}" \n
\n
"upper = \\relative c'' {" \n
> "\\global" \n
> _ \n
> "}" \n
\n
"lower = \\relative c {" \n
> " \\global" \n
> "INSERT NOTES" \n
> "}" \n
\n
> "text = \\lyricmode {" \n
> "LYRICS" \n
> "}" \n
\n
"\\score {" \n
> "\\new GrandStaff <<" \n
> "\\new Staff = upper { \\new Voice = \"singer\" \\upper }" \n
> "\\new Lyrics \\lyricsto \"singer\" \\text" \n
> "\\new Staff = lower {" \n
> "\\clef bass" \n
> "\\lower" \n
> "}" \n
> ">>" \n
\n
"\\layout {" \n
> "\\context { \\GrandStaff \\accepts \"Lyrics\" }" \n
> "\\context { \\Lyrics \\consists \"Bar_engraver\" }" \n
> "}" \n
\n
> " \\midi { }" \n
> "}" \n
)
;;;Piano centered dynamics

 
(define-skeleton LilyPond-piano-centered-dynamics
"Insert skeleton of piano staff with centered dynamics"
"\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
"% For more information go to (info \"(lilypond)Piano music\"). Place cursor after the last" \n
"% parenthesis and C-x C-e."    \n
\n
"global = {" \n
> "\\key "(skeleton-read "Key: ")\|"c "(skeleton-read "\\major, \\minor or \\dorian etc: ")\| " \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\| "4/4" \n
> "}"
\n
"upper = \\relative c'' {" \n
> "\\clef treble" \n
> "\\global" \n
> _ \n
> "}" \n
\n
"lower = \\relative c {" \n
> "\\clef bass" \n
> "\\global" \n
> "INSERT NOTES" \n
> "}" \n
\n
"dynamics = {" \n
> "DYNAMICS % for example s2\\fff\\> s4 s\\!\\pp" \n
> "}" \n
\n
"pedal = {" \n
> "s2\\sustainDown s2\\sustainUp" \n
> "}" \n
\n
"\\score {" \n
> "\\new PianoStaff <<" \n
> "\\new Staff = \"upper\" \\upper" \n
> "\\new Dynamics = \"dynamics\" \\dynamics" \n
> "\\new Staff = \"lower\" <<" \n
> "\\clef bass" \n
> "\\lower" \n
> ">>" \n
> "\\new Dynamics = \"pedal\" \\pedal" \n
> ">>" \n
"\\layout {" \n
> "\\context {" \n
> "\\type \"Engraver_group\"" \n
> "\\name Dynamics" \n
> "\\alias Voice % So that \\cresc works, for example." \n
> "\\consists \"Output_property_engraver\"" \n
\n
> "\\override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)" \n
> "pedalSustainStrings = #'(\"Ped.\" \"*Ped.\" \"*\")" \n
> "pedalUnaCordaStrings = #'(\"una corda\" \"\" \"tre corde\")" \n
\n
> "\\consists \"Piano_pedal_engraver\"" \n
> "\\consists \"Script_engraver\"" \n
> "\\consists \"Dynamic_engraver\"" \n
> "\\consists \"Text_engraver\"" \n
\n
> "\\override TextScript #'font-size = #2" \n
> "\\override TextScript #'font-shape = #'italic" \n
> "\\override DynamicText #'extra-offset = #'(0 . 2.5)" \n
> "\\override Hairpin #'extra-offset = #'(0 . 2.5)" \n
\n
> "\\consists \"Skip_event_swallow_translator\"" \n
\n
> "\\consists \"Axis_group_engraver\"" \n
> "}" \n
\n
"\\context {" \n
> "\\PianoStaff" \n
> "\\accepts Dynamics" \n
> "\\override VerticalAlignment #'forced-distance = #7" \n
> "}" \n
> "}" \n
> "}" \n
\n
"\\score {" \n
> "\\unfoldRepeats { " \n
> "\\new PianoStaff <<" \n
> "\\new Staff = \"upper\" << \\upper \\dynamics \\pedal >>" \n
> "\\new Staff = \"lower\" << \\lower \\dynamics \\pedal >>" \n
> "\\new Dynamics = \"pedal\" \\pedal" \n
> ">>" \n
\n
"\\midi {" \n
> "\\context {" \n
> "\\type \"Performer_group\"" \n
> "\\name Dynamics" \n
> "\\consists \"Piano_pedal_performer\"" \n
> "}" \n
\n
 "\\context {" \n
> "\\PianoStaff" \n
> "\\accepts Dynamics" \n
> "}" \n
> "}" \n
> "}" \n
)



(provide 'lilypond-piano-templates)
;;; lilypond-piano-templates.el ends here
