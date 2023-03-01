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

;;;; XXX TODO clean this up
;;;; Everything below this line is being evaluated
;;;; and should eventually be moved to the appropriate module.

(windmove-default-keybindings)          ; conflicts with org mode?

(when (display-graphic-p)
  ;; Enable emoji! 💩
  (set-fontset-font
   t 'emoji '("Apple Color Emoji" . "iso10646-1") nil 'prepend)
  ;; other stuff for window mode
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")))))

(setq
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil
 initial-scratch-message nil
 initial-major-mode 'fundamental-mode)

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] #'easy-kill)
  (global-set-key [remap mark-sexp] #'easy-mark))

(global-diff-hl-mode 1)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(global-set-key (kbd "C-x C-b") #'ibuffer)

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode 1)
  (diminish 'volatile-highlights-mode))

(use-package restclient
  :ensure t
  :mode (("\\.http$" . restclient-mode)))

(provide 'init-misc)
