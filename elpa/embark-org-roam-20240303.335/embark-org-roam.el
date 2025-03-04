;;; embark-org-roam.el --- Embark export buffer for org roam nodes  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Bram Adams

;; Author: Bram Adams <bram.adams@queensu.ca>
;; URL: https://github.com/bramadams/embark-org-roam
;; Package-Version: 20240303.335
;; Package-Revision: 5bc9efc33e74
;; Package-Requires: ((emacs "27.1") (embark "0.23") (org-roam "2.2.0"))
;; Keywords: outlines hypermedia

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides an embark export buffer for org roam nodes.

;;;; Usage

;; Use `embark-select' to select all org roam nodes of interest,
;; then use `embark-export', which will open a special org mode
;; buffer containing links to the selected nodes.

;;;; Tips

;; + You can customize whether the exported buffer is read-only using
;;   the `embark-org-roam-readonly' variable.

;;;; Credits

;; This package would not have been possible without the following
;; magnificent packages: org-roam [1] and embark [2].  Also a big
;; thanks to alphapapa for their Emacs package development
;; handbook [3]!
;;
;;  [1] https://github.com/org-roam/org-roam
;;  [2] https://github.com/oantolin/embark
;;  [3] https://github.com/alphapapa/emacs-package-dev-handbook

;;; Installation:

;;;;; MELPA

;; If you installed from MELPA, you're done.

;;;;; Manual

;; Install these required packages:

;; + embark
;; + org-roam

;; Then put this file in your load-path, and put this in your init
;; file:

;; (require 'embark-org-roam)

;;;;; Straight

;; Put this in your init file:

;; (use-package embark-org-roam
;;    :ensure t
;;    :straight (embark-org-roam
;;               :type git
;;               :host github
;;               :repo "bramadams/embark-org-roam")
;;    :after (org-roam embark)
;;    :demand t)

;;;;; Elpaca

;; Put this in your init file:

;; (use-package embark-org-roam
;;    :ensure t
;;    :elpaca (embark-org-roam
;;               :type git
;;               :host github
;;               :repo "bramadams/embark-org-roam")
;;    :after (org-roam embark)
;;    :demand t)

;;; Code:

;;;; Requirements

(require 'org-roam)
(require 'embark)


;;;; Customization

(defgroup embark-org-roam nil
  "Settings for `embark-org-roam'."
  :group 'org-roam
  :link '(url-link
          "https://github.com/bramadams/embark-org-roam/"))

(defcustom embark-org-roam-readonly nil
  "Whether the export buffer should be readonly.

When nil, the export buffer contains a checklist of LINKS to
org roam nodes, otherwise just a regular list of LINKS."
  :type 'boolean)


;;;; Public Functions

(define-obsolete-function-alias
  'embark-export-org-roam
  #'embark-org-roam-export
  "0.2"
  "Fixing discouraged naming of public function.")

(defun embark-org-roam-export (nodes)
  "Exporting selected org roam NODES to an org mode buffer.

Creates an org mode buffer listing LINKS to the provided nodes of
category `org-roam-node'."
  (let ((buf (generate-new-buffer "*Embark Export Org Roam*")))
    (with-current-buffer buf
      (let ((suffix (if (not embark-org-roam-readonly)
                        " [/]:"
                      ":")))
        (insert (propertize
                 (format "Links to selected org roam nodes%s\n" suffix)
                 'face list-matching-lines-buffer-name-face)))
      (dolist (node nodes)
        (let* ((node (cadr (text-properties-at 0 node)))
               (id (org-roam-node-id node))
               (description (org-roam-node-formatted node)))
          (if (not embark-org-roam-readonly)
              (insert "1. [ ] ")
            (insert "1. "))
          (insert (org-link-make-string
                   (concat "id:" id)
                   description))
          
          ;; increment enumeration
          (org-list-repair)
          (insert "\n")))
      (goto-char (point-min))
      (unless embark-org-roam-readonly
        (org-update-statistics-cookies 4))
      (org-mode)
      (if embark-org-roam-readonly
          (read-only-mode)))
    (pop-to-buffer buf)))


;; register as exporter for org roam nodes
(setf (alist-get 'org-roam-node embark-exporters-alist)
      #'embark-org-roam-export)


;;;; Footer

(provide 'embark-org-roam)
;;; embark-org-roam.el ends here
