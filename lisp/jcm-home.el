;;; -*- mode: emacs-lisp; -*-

;;; Functions

(defun jcm-setup-tramp ()
  "Setup cnacompass proxy for tramp."
  (interactive)
  (add-to-list 'tramp-default-proxies-alist
			   '("cnacompass.org" nil "/ssh:jcm@mynode:")))

;;; General

(require 'php-mode)
(require 'tramp)
(jcm-setup-tramp)

(mapc (lambda (f) (autoload f "jcm-slime" "" t))
      '(jcm-start-slime
        jcm-start-slime-beta
        jcm-start-slime-remote))

;;; Keymaps

(define-key global-map (kbd "<f5>") 'jcm-start-slime)
;;(define-key global-map (kbd "C-<f5>") 'jcm-start-slime-beta)
(define-key global-map (kbd "M-<f8>") 'jcm-start-slime-remote)

;;; Hooks

(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)

(provide 'jcm-home)
