;;; -*- mode: emacs-lisp; -*-

;;; CIDER
;;; C-c C-p eval in popup buffer
;;; C-c C-v C-b/C-c eval with context

;;; Clojure refactor
;;; C-c C-r - toggle ignore
;;; C-c C-r _ toggle ignore surrounding
;;; C-c C-r n s sort namespace

;;; Clojure
;;; C-: rotate keyword/string
;;; M-q indent sexp

;;; 2021 reminders
;;; M-w for easy-kill (then w, s, l)
;;; C-M-SPC easy-mark

;;; 2020 reminders
;;; C-v page down, M-v page up (for broken cursor key)
;;; No more shift-arrow for select. Use marks.
;;; Switch buffers with shift-arrow
;;; M-o ace jump window
;;; s-. jump to word first letter
;;; s-left/right/up/down next frame
;;; Projectile p to select project
;;; CIDER inspector
;;; C-SPC to set transient mode
;;; M-; comment-dwim
;;; exuberant ctags
;;; In tags xref mode, TAB to jump and close
;;; C-u C-x = to show info about a character
;;; M-x add-dir-local-v

;;; Quick tips/Reminders:
;;; C-M-q - reindent defun
;;; C-M-space - mark sexp
;;; C-' - splice
;;; M-' - wrap
;;; M-r - raise
;;; M-s - split
;;; C-w - kill-region
;;; M-? - help
;;; C-x-C-e - eval elisp
;;; C-c C-y - copy this function into REPL

;;; From GNU Emacs Extensions book.
(global-set-key (kbd "M-?") 'help-command)
(global-set-key (kbd "C-x ?") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "M-g") 'goto-line)

(define-key global-map (kbd "s-<f2>") 'jcm/edit-startup-file)
(define-key global-map (kbd "M-<f2>") 'jcm/dired-elisp)

(global-set-key [\M-f13] 'tags-search)
(global-set-key [\C-f13] 'jcm/tags-search-at-point)
(global-set-key [f13] 'tags-loop-continue)
(global-set-key [f6] 'tags-loop-continue)
(global-set-key [\C-f6] 'tags-loop-continue)

(global-set-key [f14] 'pop-tag-mark)

(global-set-key [(control tab)] 'bury-buffer)

(avy-setup-default)
(global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-,") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)

;;(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(global-set-key [remap comment-dwim] #'comment-line)

(provide 'init-keys)
