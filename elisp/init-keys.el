;;; -*- mode: emacs-lisp; -*-

;;; From GNU Emacs Extensions book.
(global-set-key (kbd "M-?") 'help-command)
(global-set-key (kbd "C-x ?") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

;;(define-key global-map (kbd "M-g") 'goto-line)

(define-key global-map (kbd "s-<f2>") 'jcm/edit-startup-file)
(define-key global-map (kbd "M-<f2>") 'jcm/dired-elisp)

;; (global-set-key [\M-f13] 'tags-search)
;; (global-set-key [\C-f13] 'jcm/tags-search-at-point)
;; (global-set-key [f13] 'tags-loop-continue)
;; (global-set-key [f6] 'tags-loop-continue)
;; (global-set-key [\C-f6] 'tags-loop-continue)

;;(global-set-key [f14] 'pop-tag-mark)

;;(global-set-key [(control tab)] 'bury-buffer)

(avy-setup-default)
(global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-,") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(setq avy-background t)

;;(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(global-set-key [remap comment-dwim] #'comment-line)

(provide 'init-keys)
