;;; latex-math-preview-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from latex-math-preview.el

(let ((loads (get 'latex-math-preview 'custom-loads))) (if (member '"latex-math-preview" loads) nil (put 'latex-math-preview 'custom-loads (cons '"latex-math-preview" loads)) (put 'applications 'custom-loads (cons 'latex-math-preview (get 'applications 'custom-loads)))))
(defvar cl-struct-latex-math-preview-symbol-tags)
(with-suppressed-warnings ((lexical math image args func display source cl-tag-slot)) (eval-and-compile (cl-defsubst latex-math-preview-symbol-p (cl-x) (declare (side-effect-free error-free) (pure t)) (and (memq (type-of cl-x) cl-struct-latex-math-preview-symbol-tags) t)) (define-symbol-prop 'latex-math-preview-symbol 'cl-deftype-satisfies 'latex-math-preview-symbol-p)) (cl-defsubst latex-math-preview-symbol-source (cl-x) "Access slot \"source\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 1))) (cl-defsubst latex-math-preview-symbol-display (cl-x) "Access slot \"display\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 2))) (cl-defsubst latex-math-preview-symbol-func (cl-x) "Access slot \"func\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 3))) (cl-defsubst latex-math-preview-symbol-args (cl-x) "Access slot \"args\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 4))) (cl-defsubst latex-math-preview-symbol-image (cl-x) "Access slot \"image\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 5))) (cl-defsubst latex-math-preview-symbol-math (cl-x) "Access slot \"math\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 6))) (defalias 'copy-latex-math-preview-symbol #'copy-sequence) (cl-defsubst make-latex-math-preview-symbol (&cl-defs (nil (cl-tag-slot) (source) (display) (func) (args) (image) (math)) &key source display func args image math) "Constructor for objects of type `latex-math-preview-symbol'." (declare (side-effect-free t)) (record 'latex-math-preview-symbol source display func args image math)))
(autoload 'latex-math-preview-expression "latex-math-preview" "\
Preview a TeX maths expression at (or surrounding) point.
The `latex-math-preview-function' variable controls the viewing method.
The LaTeX notations which can be matched are $...$, $$...$$ or
the notations which are stored in `latex-math-preview-match-expression'." t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" "\


(fn USE-CUSTOM-CONVERSION &optional OUTPUT)" t)
(autoload 'latex-math-preview-insert-mathematical-symbol "latex-math-preview" "\
Insert LaTeX mathematical symbols with displaying.

(fn &optional NUM)" t)
(autoload 'latex-math-preview-insert-text-symbol "latex-math-preview" "\
Insert symbols for text part with displaying.

(fn &optional NUM)" t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" "\
Insert LaTeX mathematical symbols with displaying.

(fn &optional NUM)" t)
(autoload 'latex-math-preview-last-symbol-again "latex-math-preview" "\
Insert last symbol which is inserted by `latex-math-preview-insert-symbol'" t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" "\
Display beamer frame at current position." t)
(register-definition-prefixes "latex-math-preview" '("latex-math-preview-"))

;;; End of scraped data

(provide 'latex-math-preview-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; latex-math-preview-autoloads.el ends here
