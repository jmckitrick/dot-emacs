;;; -*- mode: emacs-lisp; -*-

(add-to-list 'vc-handled-backends 'GIT)

(add-to-list 'auto-mode-alist '("\\.\\(cls\\|trigger\\)" . java-mode))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package js2-mode)

(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx-activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))
;(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
;(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))
(setq web-mode-markup-indent-offset 2)

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/magit/lisp"))
(use-package magit)
;;(setq magit-last-seen-setup-instructions "1.4.0")

(use-package linum
  :config
  (global-linum-mode))

(use-package etags-select)

;;;; EVERYTHING BELOW THIS LINE IS BEING EVALUATED
;;;; AND SHOULD EVENTUALLY BE MOVED TO THE APPROPRIATE MODULE.

(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

(global-set-key "\M-\C-y" 'kill-ring-search)

(use-package wgrep)

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  :diminish
  undo-tree-mode)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-c /") 'toggle-comment-on-line)

(global-unset-key (kbd "C-z"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package yasnippet
  :config
  (yas-initialize)
  (yas-global-mode 1))

(setq-default indicate-empty-lines t)

(global-visual-line-mode)
(diminish 'visual-line-mode)

(global-subword-mode)
(diminish 'subword-mode)

(use-package smooth-scrolling)

(which-key-mode)
(diminish 'which-key-mode)

(diminish 'auto-revert-mode)

;(use-package aggressive-indent)
;(global-aggressive-indent-mode -1)

(provide 'init-misc)
