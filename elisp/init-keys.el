;;; -*- mode: emacs-lisp; -*-

;;; From GNU Emacs Extensions book.
(global-set-key (kbd "M-?") 'help-command)
(global-set-key (kbd "C-x ?") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "s-<f2>") 'jcm/edit-startup-file)
(define-key global-map (kbd "M-<f2>") 'jcm/dired-elisp)

(avy-setup-default)
(global-set-key (kbd "s-.") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "s-,") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(setq avy-background t)

(global-set-key [remap comment-dwim] #'comment-line)

;;(global-set-key (kbd "C-x C-b") #'ibuffer) ;; Do we want or use this?
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)

(provide 'init-keys)
