;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "slack" "20250221.2334"
  "Slack client."
  '((websocket "1.12")
    (request   "0.3.2")
    (circe     "2.11")
    (alert     "1.2")
    (emojify   "1.2.1")
    (emacs     "25.1")
    (dash      "2.19.1")
    (s         "1.13.1")
    (ts        "0.3"))
  :url "https://github.com/emacs-slack/emacs-slack"
  :commit "1fb7d71e198a7a7f3accdcb20387e7ef991aa685"
  :revdesc "1fb7d71e198a"
  :keywords '("tools")
  :authors '(("yuya.minami" . "yuya.minami@yuyaminami-no-MacBook-Pro.local"))
  :maintainers '(("yuya.minami" . "yuya.minami@yuyaminami-no-MacBook-Pro.local")))
