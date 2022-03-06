;;; -*- mode: emacs-lisp; -*-

;; ENABLE
(setq ring-bell-function 'ignore)
(setq kill-whole-line t)
(setq visible-bell t)
(delete-selection-mode t)
(show-paren-mode t)
(global-hl-line-mode t)
(column-number-mode t)
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))

;; DISABLE
(setq tooltip-mode nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))
;;(transient-mark-mode -1)

;; Editing settings.
(setq tab-width 4)            ;could be 4 or 8?
(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)
(setq fill-column 80)
(setq c-default-style "bsd"
      c-basic-offset 4
      track-eol t)
(c-set-offset 'case-label '+)

;; Dired settings.
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'top)
(setq find-grep-options "-q -i")
(setq dired-use-ls-dired nil)
(setq dired-dwim-target t)

;; Other settings.
(fset 'yes-or-no-p 'y-or-n-p)
(setq enable-local-variables :safe)

;; Scrolling settings
(setq ;;scroll-step 10
      scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
;; (setq-default scroll-up-aggressively 0.0
;;               scroll-down-aggressively 0.0)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode t))

;; Try this out.
(setq save-interprogram-paste-before-kill t)

;; Fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (shell-command-to-string "zsh -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; macos settings
(when (string-match "apple" system-configuration)
  (set-frame-font jcm/font nil t)
  (setq shell-file-name "/bin/zsh")
  (set-exec-path-from-shell-PATH))

;; Themes
(when window-system
  (use-package modus-themes
    :ensure
    :init
    (setq modus-themes-bold-constructs t
          modus-themes-mode-line '(moody)
          modus-themes-completions '((matches background)
                                     (selection accented)
                                     (popup accented))
          modus-themes-hl-line '(accented) ; intense underline
          ;;modus-themes-region '(bg-only)
          modus-themes-paren-match '(bold))
    (modus-themes-load-themes)
    :config
    ;;(modus-themes-load-vivendi)
    (modus-themes-load-operandi)
    :bind ("<f5>" . modus-themes-toggle))

  ;;(add-to-list 'initial-frame-alist '(undecorated . t))
  (add-to-list 'initial-frame-alist '(fullscreen . maximized)))

(recentf-mode 1)
(save-place-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indicate-empty-lines t)

(use-package smooth-scrolling)

(which-key-mode)
(diminish 'which-key-mode)

(diminish 'auto-revert-mode)

(use-package smex)

(diminish 'eldoc-mode)

;; check out eyebrowse
(use-package eyebrowse
  :ensure t
  :config
  (progn
    (eyebrowse-mode t)
    ;; (dotimes (n 10)
    ;;   ;;(global-unset-key (kbd (format "C-%d" n)))
    ;;   (global-unset-key (kbd (format "M-%d" n))))
    ;; (define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
    ;; (define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
    ;; (define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
    ))

;;(desktop-save-mode -1)

(use-package moody
  :ensure t
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function))

(use-package minions
  :ensure t
  :config
  (minions-mode 1))

(provide 'init-emacs)
