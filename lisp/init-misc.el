;;; -*- mode: emacs-lisp; -*-

(add-to-list 'vc-handled-backends 'GIT)

(add-to-list 'auto-mode-alist '("\\.\\(cls\\|trigger\\)" . java-mode))

(require 'projectile)
(projectile-global-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))
(setq web-mode-markup-indent-offset 2)

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/magit/lisp"))
(require 'magit)
;;(setq magit-last-seen-setup-instructions "1.4.0")

(require 'linum)
(global-linum-mode)

(require 'etags-select)

(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

(global-set-key "\M-\C-y" 'kill-ring-search)

(require 'wgrep)

(require 'undo-tree)
(global-undo-tree-mode)

(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-c /") 'toggle-comment-on-line)

(global-unset-key (kbd "C-z"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'yasnippet)
(yas-initialize)
(yas-global-mode 1)

(setq-default indicate-empty-lines t)
(global-visual-line-mode)
(global-subword-mode)
(require 'smooth-scrolling)

;;(icomplete-mode 0)

(provide 'init-misc)
