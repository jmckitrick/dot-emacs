;;; -*- mode: emacs-lisp; -*-

;;; Quick tips/Reminders:
;;; C-c w - copy sexp
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

;(keyboard-translate ?\( ?\[)
;(keyboard-translate ?\) ?\])
;(keyboard-translate ?\[ ?\()
;(keyboard-translate ?\] ?\))

;;; From GNU Emacs Extensions book.
(global-set-key (kbd "C-x C-m") 'execute-extended-command) ; C-m = RET
(global-set-key (kbd "C-c C-m") 'execute-extended-command) ; C-m = RET
(global-set-key (kbd "M-?") 'help-command)
(global-set-key (kbd "C-x ?") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "M-g") 'goto-line)
(define-key global-map (kbd "C-c C-g") 'goto-line)

(define-key global-map (kbd "%") 'goto-match-paren)
(define-key global-map (kbd "C-c w") 'copy-word)
(fset 'copy-sexp [?\C-\M-\ ?\M-w])      ; keyboard macro

(define-key global-map (kbd "<f2>") 'jcm-edit-startup-file)
(define-key global-map (kbd "M-<f2>") 'jcm-dired-elisp)

(global-set-key [\M-f13] 'tags-search)
(global-set-key [\C-f13] 'jcm-tags-search-at-point)
(global-set-key [f13] 'tags-loop-continue)
(global-set-key [f6] 'tags-loop-continue)
(global-set-key [\C-f6] 'tags-loop-continue)

(global-set-key [f14] 'pop-tag-mark)
(global-set-key [f15] 'etags-select-find-tag-at-point)
(global-set-key [\C-f15] 'etags-select-find-tag)

;;(define-key global-map (kbd "C-c i") 'increment-number-at-point)
;;(define-key global-map (kbd "C-c d") 'decrement-number-at-point)
;;(global-set-key [(control l)] 'centerer)
;;(global-set-key [(control tab)] 'bury-buffer)

;(define-key global-map (kbd "C-<f5>") 'cider-jack-in)
(define-key global-map (kbd "C-<f5>") 'nrepl-jack-in)

(provide 'jcm-keymaps)
