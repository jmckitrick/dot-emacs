;;; -*- mode: emacs-lisp; -*-

(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action #'projectile-dired))

(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(add-hook 'sgml-mode-hook 'emmet-mode)

(use-package magit
  :ensure t
  :bind (("C-c g" . magit-file-dispatch)))

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] #'easy-kill)
  (global-set-key [remap mark-sexp] #'easy-mark))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode -1)         ; DO WE WANT THIS?
  (diminish 'volatile-highlights-mode))

(use-package restclient
  :ensure t
  :mode (("\\.http$" . restclient-mode)))

(use-package eyebrowse
  :ensure t
  :config
  (progn
    (eyebrowse-mode t)))

;; Themes
(when (display-graphic-p)
  (require 'modus-themes)
  (use-package modus-themes
    :ensure
    :config
    (load-theme 'modus-operandi-tinted :no-confirm)
    :bind ("<f5>" . modus-themes-toggle))

  ;;(add-to-list 'initial-frame-alist '(undecorated . t))
  (add-to-list 'initial-frame-alist '(fullscreen . maximized)))

(when (display-graphic-p)
  (use-package moody
    :ensure t
    :config
    (setq x-underline-at-descent-line t)
    (moody-replace-mode-line-buffer-identification)
    (moody-replace-vc-mode)
    ;; (setq-default mode-line-format
    ;;               (delete '(vc-mode vc-mode) mode-line-format))
    (moody-replace-eldoc-minibuffer-message-function)))

(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(use-package smooth-scrolling)
(use-package smex)

(which-key-mode)
(diminish 'which-key-mode)
(diminish 'auto-revert-mode)
(diminish 'eldoc-mode)

(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))

(provide 'init-misc)
