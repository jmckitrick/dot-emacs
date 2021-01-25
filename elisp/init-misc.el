;;; -*- mode: emacs-lisp; -*-

(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action #'projectile-dired))

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
;; (use-package linum
;;   :config
;;   (global-linum-mode))
;;(global-display-line-numbers-mode)

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

;; (use-package yasnippet
;;   :config
;;   (yas-initialize)
;;   (yas-global-mode 1))

(setq-default indicate-empty-lines t)

(use-package smooth-scrolling)

(which-key-mode)
(diminish 'which-key-mode)

(diminish 'auto-revert-mode)

(use-package smex)

(diminish 'paredit-mode)
(diminish 'eldoc-mode)
(diminish 'yas-minor-mode)

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(windmove-default-keybindings)          ;conflicts with org mode?
(global-set-key (kbd "M-o") 'ace-window)

(use-package frog-jump-buffer
  :ensure t
  :config
  (global-set-key (kbd "s-b") 'frog-jump-buffer))

;; Enable emoji! 💩
(set-fontset-font
 t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

;; (use-package nav-flash
;;   :config
;;   (nav-flash-show))

;; experimental: try these out

(setq
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] #'easy-kill)
  (global-set-key [remap mark-sexp] #'easy-mark))

(global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; try expand-region ?

(provide 'init-misc)
