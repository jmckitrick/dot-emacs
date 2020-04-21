;;; -*- mode: emacs-lisp; -*-

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files org-directory)

(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-reverse-note-order t)

(provide 'init-org)
