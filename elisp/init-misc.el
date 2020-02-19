;;; -*- mode: emacs-lisp; -*-

;(add-to-list 'vc-handled-backends 'GIT)

(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  ;;:diminish (projectile-mode . "Proj")
  )

(use-package js2-mode)

(use-package web-mode)
;; XXX Move these to work, consult, etc?
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)

(use-package magit)
;;(setq magit-last-seen-setup-instructions "1.4.0")

(use-package linum
  :config
  (global-linum-mode))
;;(global-display-line-numbers-mode)

;;;; WAS BEING EVALUATED BUT IS NOW DISABLED
;;;; AND SLATED FOR REMOVAL IF NOT NEEDED.
;;(use-package etags-select)

;; (autoload 'kill-ring-search "kill-ring-search"
;;   "Search the kill ring in the minibuffer."
;;   (interactive))

;; (global-set-key "\M-\C-y" 'kill-ring-search)

;; (use-package wgrep)

;; (use-package undo-tree
;;   :config
;;   (global-undo-tree-mode)
;;   :diminish
;;   undo-tree-mode)

;; (defun toggle-comment-on-line ()
;;   "comment or uncomment current line"
;;   (interactive)
;;     (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; (global-set-key (kbd "C-c /") 'toggle-comment-on-line)

;(global-visual-line-mode)
;(diminish 'visual-line-mode)

;(global-subword-mode -1)
;(diminish 'subword-mode)

;(use-package aggressive-indent)
;(global-aggressive-indent-mode -1)

;; What does this do?
;;(global-unset-key (kbd "C-z"))

;;;; EVERYTHING BELOW THIS LINE IS BEING EVALUATED
;;;; AND SHOULD EVENTUALLY BE MOVED TO THE APPROPRIATE MODULE.

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package yasnippet
  :config
  (yas-initialize)
  (yas-global-mode 1))

(setq-default indicate-empty-lines t)

(use-package smooth-scrolling)

(which-key-mode)
(diminish 'which-key-mode)

(diminish 'auto-revert-mode)

;; TEMP FIX
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(use-package smex)

(diminish 'paredit-mode)
(diminish 'eldoc-mode)
(diminish 'yas-minor-mode)
;;(diminish-undo 'projectile-mode)

(provide 'init-misc)
