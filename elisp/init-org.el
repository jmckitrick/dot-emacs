;;; -*- mode: emacs-lisp; -*-

;; agenda mode:
;; SPC/TAB/RET
;; d day
;; t todo
;; q/x
;; C-c C-s schedule
;; C-c C-w refile
;; a archive
;; C-c C-c context dependent

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-switchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files `(,org-directory))
(setq org-refile-targets '((nil . (:maxlevel . 3))
                           (org-agenda-files . (:maxlevel . 3))))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-startup-indented t)

(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-reverse-note-order t)

(provide 'init-org)
