;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "org-page" "20241227.814"
  "Static site generator based on org mode."
  '((ht           "1.5")
    (simple-httpd "1.4.6")
    (mustache     "0.22")
    (htmlize      "1.47")
    (org          "8.0")
    (dash         "2.0.0")
    (cl-lib       "0.5")
    (git          "0.1.1"))
  :url "https://github.com/kelvinh/org-page"
  :commit "3641afab005b892b586a1e70da29201004c189c3"
  :revdesc "3641afab005b"
  :keywords '("org-mode" "convenience" "beautify")
  :authors '(("Kelvin Hu" . "iniDOTkelvinATgmailDOTcom"))
  :maintainers '(("Kelvin Hu" . "iniDOTkelvinATgmailDOTcom")))
