;;; lilypond-parts-templates.el --- 

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
;;; It will be loaded if the variable LilyPond-parts-templates-p is t(rue).

;;; Code:

(define-skeleton LilyPond-string-quartet-parts
"Insert the master skeleton for a string quartet."
nil
 '(setq v1 (buffer-name))
> "%%%%% " v1 \n
> "\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n
\n
"global = {" \n
> "\\key "(skeleton-read "Key: ")\| " c"(skeleton-read "\\major or \\minor: ")\|" \\major" \n
> "\\time "(skeleton-read "Time, needs to be of form N/N: ")\|" 4/4" \n
> "}" \n
>  \n
> "Violinone = \\new Voice { \\relative c''{" \n
> "\\set Staff.instrumentName = \"Violin 1\"" \n
> _ \n
> "\\bar \"|.\" }}   %*********************************" \n
\n
> "Violintwo = \\new Voice { \\relative c''{" \n
> "\\set Staff.instrumentName = \"Violin 2\"" \n
> "INSERT NOTES" \n
> "\\bar \"|.\" }}   %*********************************" \n
\n
> "Viola = \\new Voice { \\relative c' {" \n
> "\\set Staff.instrumentName = \"Viola\"" \n
> "\\clef alto" \n
> "INSERT NOTES" \n
> "\\bar \"|.\" }}   %*********************************" \n
\n
> "Cello = \\new Voice { \\relative c' {" \n
> "\\set Staff.instrumentName = \"Cello\"" \n
> "\\clef bass" \n
> "INSERT NOTES" \n
> "\\bar \"|.\"}}   %**********************************" \n
\n
> "music = {" \n
> "<<" \n
> "\\tag #'score \\tag #'vn1 \\new Staff { << \\global \\Violinone >> }" \n
> "\\tag #'score \\tag #'vn2 \\new Staff { << \\global \\Violintwo>> }" \n
> "\\tag #'score \\tag #'vla \\new Staff { << \\global \\Viola>> }" \n
> "\\tag #'score \\tag #'vlc \\new Staff { << \\global \\Cello>> }" \n
> ">>" \n
> "}" \n
\n
> "% You can call M-x LilyPond-sub-buffer in new  buffer and get the related parts files." \n
> "% And call M-x LilyPond-score-buffer in new  buffer and get the related score.ly file." \n
> "% It needs to be called score.ly or you need to change the \\tag #'score to whatever the name is." \n
> "% If you name the parts files things like vn1.ly etc all will be well. If you name" \n
> "% them some other name you will need to change the name of the \\tags in this file." \n
)

(define-skeleton LilyPond-tags-section
"Add a section for making parts files and instruction."
nil
> "music = {" \n
> "<<" \n
> "\\tag #'score \\tag #'vn1 \\new Staff { << \\global \\PART ONE >> }" \n
> "\\tag #'score \\tag #'vn2 \\new Staff { << \\global \\PART TWO >> }" \n
> "\\tag #'score \\tag #'vla \\new Staff { << \\global \\PART THREE >> }" \n
> "\\tag #'score \\tag #'vlc \\new Staff { << \\global \\PART FOUR >> }" \n
> ">>" \n
> "}" \n
\n
> "% You can call M-x LilyPond-sub-buffer in new  buffer and get the related parts files." \n
> "% And call M-x LilyPond-score-buffer in new  buffer and get the related score.ly file." \n
> "% It needs to be called score.ly or you need to change the \\tag #'score to whatever the name is." \n
> "% If you name the parts files things like vn1.ly etc all will be well. If you name" \n
> "% them some other names you will need to change the name of the \\tags in this file." \n
> "% You will need to change the variables for the music expression variables appropriately." \n
)

(define-skeleton LilyPond-score-buffer
"Inserts a skeleton for the score.ly file for doing parts."
"What is the master file? "
> "%%%%% score.ly" \n
> "\\version \"2.11.23\"" \n
"Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
> "\\include \"" str "\"" \n
> "#(set-global-staff-size 14)" \n
\n
> "\\score {" \n
> "\\new StaffGroup \keepWithTag #'score \music" \n
> "\\layout {" _ "}" \n
> "\\midi { }" \n
> "}" \n
)

(define-skeleton LilyPond-sub-buffer
"Insert a buffer with skeleton to another related buffer"
"What is your master file name? "
'(setq v1 (buffer-name))
> "%%%%% " v1 \n
> "\\version \"2.11.23\"" \n
"% Use convert-ly to update this file if the version is different to the lilypond you use." \n \n
> "\\include \"" str "\"" \n
\n
> "\\score {" \n
'(setq v2 (substring v1 0 -3))
> "\\keepWithTag #'" v2 " \\music" \n
> "\\layout {" _ " }" \n
> "}" \n
)


;(provide 'lilypond-parts-templates)
;;; lilypond-parts-templates.el ends here
