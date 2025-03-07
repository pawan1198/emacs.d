;;; lui-irc-colors.el --- Add IRC color support to LUI

;; Copyright (C) 2005  Jorgen Schaefer

;; Author: Jorgen Schaefer <forcer@forcix.cx>

;; This file is part of Lui.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
;; 02110-1301  USA

;;; Commentary:

;; This tells LUI how to display IRC colors:
;; ^B - Bold
;; ^_ - Underline
;; ^V - Inverse
;; ^] - Italic
;; ^^ - Strikethrough
;; ^Q - Monospace
;; ^O - Return to normal
;; ^C1,2 - Colors

;; The colors are documented at http://www.mirc.co.uk/help/color.txt
;; and https://modern.ircdocs.horse/formatting.html

;;; Code:

(require 'lui)

(defgroup lui-irc-colors nil
  "LUI IRC colors faces."
  :group 'circe)

(defface lui-irc-colors-monospace-face
  '((t :inherit fixed-pitch))
  "Face used for inverse video."
  :group 'lui-irc-colors)

(defface lui-irc-colors-inverse-face
  '((t :inverse-video t))
  "Face used for inverse video."
  :group 'lui-irc-colors)

(defface lui-irc-colors-strike-through-face
  '((t :strike-through t))
  "Face used for inverse video."
  :group 'lui-irc-colors)

(defface lui-irc-colors-spoiler-hover-face
  '((((type graphic) (class color) (background dark))
     :foreground "black")
    (((type graphic) (class color) (background light))
     :foreground "white")
    (t :inverse-video t))
   "Face used when hovering over text marked as spoiler"
   :group 'lui-irc-colors)

(defun lui-irc-defface (face property on-dark on-light fallback doc)
  (custom-declare-face
   face
   `((((type graphic) (class color) (background dark))
      ,property ,on-dark)
     (((type graphic) (class color) (background light))
      ,property ,on-light)
     (t ,property ,fallback))
   doc
   :group 'lui-irc-colors))

(defun lui-irc-deffaces-for-color (number on-dark on-light fallback name)
  (lui-irc-defface
   (intern (format "lui-irc-colors-fg-%d-face" number))
   :foreground
   on-dark on-light fallback
   (concat "Face used for foreground IRC color "
	   (number-to-string number) " (" name ")."))
  (lui-irc-defface
   (intern (format "lui-irc-colors-bg-%d-face" number))
   :background
   on-light on-dark fallback
   (concat "Face used for background IRC color "
	   (number-to-string number) " (" name ")."))
  (lui-irc-defface
   (intern (format "lui-irc-colors-spoiler-bg-%s-face" number))
   :background
   on-dark on-light fallback
   (concat "Face used for spoiler background IRC color "
	   (number-to-string number) " (" name ").")))

(defun lui-irc-defface-bulk (colors)
  (dotimes (n (length colors))
    (apply 'lui-irc-deffaces-for-color n (elt colors n))))

(lui-irc-defface-bulk
 [("#ffffff" "#585858" "white"    "white")
  ("#a5a5a5" "#000000" "black"    "black")
  ("#9b9bff" "#0000ff" "blue4"    "blue")
  ("#40eb51" "#006600" "green4"   "green")
  ("#ff9696" "#b60000" "red"      "red")
  ("#d19999" "#8f3d3d" "red4"     "brown")
  ("#d68fff" "#9c009c" "magenta4" "purple")
  ("#ffb812" "#7a4f00" "yellow4"  "orange")
  ("#ffff00" "#5c5c00" "yellow"   "yellow")
  ("#80ff95" "#286338" "green"    "light green")
  ("#00b8b8" "#006078" "cyan4"    "teal")
  ("#00ffff" "#006363" "cyan"     "light cyan")
  ("#a8aeff" "#3f568c" "blue"     "light blue")
  ("#ff8bff" "#853885" "magenta"  "pink")
  ("#cfcfcf" "#171717" "dimgray"  "grey")
  ("#e6e6e6" "#303030" "gray"     "light grey")])

(defvar lui-irc-colors-regex
  "\\(\x02\\|\x03\\|\x16\\|\x0F\\|\x11\\|\x1D\\|\x1E\\|\x1F\\)"
  "A regular expression matching IRC control codes.")

;;;###autoload
(defun enable-lui-irc-colors ()
  "Enable IRC color interpretation for Lui."
  (interactive)
  (add-hook 'lui-pre-output-hook 'lui-irc-colors))

(defun disable-lui-irc-colors ()
  "Disable IRC color interpretation for Lui."
  (interactive)
  (remove-hook 'lui-pre-output-hook 'lui-irc-colors))

(defun lui-irc-colors ()
  "Add color faces for IRC colors.
This is an appropriate function for `lui-pre-output-hook'."
  (goto-char (point-min))
  (let ((start (point))
        (boldp nil)
        (monospacep nil)
        (inversep nil)
        (italicp nil)
        (strikethroughp nil)
        (underlinep nil)
        (fg nil)
        (bg nil))
    (while (re-search-forward lui-irc-colors-regex nil t)
      (lui-irc-propertize start (point)
                          boldp monospacep inversep italicp
                          strikethroughp underlinep
                          fg bg)
      (let ((code (match-string 1)))
        (replace-match "")
        (setq start (point))
        (cond
         ((string= code "\x02")
          (setq boldp (not boldp)))
         ((string= code "\x11")
          (setq monospacep (not monospacep)))
         ((string= code "\x16")
          (setq inversep (not inversep)))
         ((string= code "\x1D")
          (setq italicp (not italicp)))
         ((string= code "\x1E")
          (setq strikethroughp (not strikethroughp)))
         ((string= code "\x1F")
          (setq underlinep (not underlinep)))
         ((string= code "\x0F")
          (setq boldp nil
                inversep nil
                italicp nil
                underlinep nil
                fg nil
                bg nil))
         ((string= code "\x03")
          (if (looking-at "\\([0-9][0-9]?\\)\\(,\\([0-9][0-9]?\\)\\)?")
              (progn
                (setq fg (string-to-number (match-string 1))
                      bg (if (match-string 2)
                             (string-to-number (match-string 3))
                           bg))
                (setq fg (if (and fg (not (= fg 99))) (mod fg 16) nil)
                      bg (if (and bg (not (= bg 99))) (mod bg 16) nil))
                (replace-match ""))
            (setq fg nil
                  bg nil)))
         (t
          (error "lui-irc-colors: Can't happen!")))))
    (lui-irc-propertize (point) (point-max)
                        boldp monospacep inversep italicp
                        strikethroughp underlinep fg bg)))

(defun lui-irc-propertize (start end boldp monospacep inversep italicp strikethroughp underlinep fg bg)
  "Propertize the region between START and END."
  (let ((faces nil)
        (mouse-faces nil))
    (when boldp
      (push 'bold faces))
    (when monospacep
      (push 'lui-irc-colors-monospace-face faces))
    (when inversep
      (push 'lui-irc-colors-inverse-face faces))
    (when italicp
      (push 'italic faces))
    (when underlinep
      (push 'underline faces))
    (when fg
      (push (lui-irc-colors-face 'fg fg) faces))
    (when bg
      (if (= fg bg)
          (progn
            (push (lui-irc-colors-spoiler-face 'bg bg) faces)
            (push (lui-irc-colors-spoiler-face 'bg bg) mouse-faces)
            (push 'lui-irc-colors-spoiler-hover-face mouse-faces))
        (push (lui-irc-colors-face 'bg bg) faces)))
    (when faces
      (add-face-text-property start end (nreverse faces)))
    (when mouse-faces
      (add-text-properties start end `(mouse-face ,(nreverse mouse-faces))))))

(defun lui-irc-colors-face (type n)
  "Return a face appropriate for face number N.
TYPE is either \\='fg or \\='bg."
  (if (and (<= 0 n)
           (<= n 15))
      (intern (format "lui-irc-colors-%s-%s-face" type n))
    'default-face))

(defun lui-irc-colors-spoiler-face (type n)
  "Return a spoiler face appropriate for face number N.
TYPE is either \\='fg or \\='bg."
  (if (and (<= 0 n)
           (<= n 15))
      (intern (format "lui-irc-colors-spoiler-%s-%s-face" type n))
    'default-face))

(provide 'lui-irc-colors)
;;; lui-irc-colors.el ends here
