;;; frameshot-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from frameshot.el

(defvar frameshot-mode nil "\
Non-nil if Frameshot mode is enabled.
See the `frameshot-mode' command
for a description of this minor mode.")
(custom-autoload 'frameshot-mode "frameshot" nil)
(autoload 'frameshot-mode "frameshot" "\
Take screenshots of a frame.

This is a global minor mode.  If called interactively, toggle the
`Frameshot mode' mode.  If the prefix argument is positive, enable the
mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='frameshot-mode)'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(autoload 'frameshot-setup "frameshot" "\
Setup the selected frame using CONFIG and call `frameshot-setup-hook'.

Set variable `frameshot-config' to CONFIG, resize the selected
frame according to CONFIG, and call `frameshot-setup-hook'.  If
CONFIG is nil, then use the value of `frameshot-config' instead.
See `frameshot-config' for the format of CONFIG.

Also run `frameshot-setup-hook' and `frameshot-clear'.

When called interactively, then reload the previously loaded
configuration if any.

(fn &optional CONFIG)" t)
(autoload 'frameshot-default-setup "frameshot" "\
Setup the selected frame using `frame-default-config'." t)
(autoload 'frameshot-clear "frameshot" "\
Remove some artifacts, preparing to take a screenshot." t)
(autoload 'frameshot-take "frameshot" "\
Take a screenshot of the selected frame." t)
(register-definition-prefixes "frameshot" '("frameshot-"))

;;; End of scraped data

(provide 'frameshot-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; frameshot-autoloads.el ends here
