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
(setq save-interprogram-paste-before-kill t)
(recentf-mode 1)
(save-place-mode 1)
(desktop-save-mode 1)
(setq-default indicate-empty-lines t)

;; DISABLE
(setq tooltip-mode nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))
;;(transient-mark-mode -1)
(setq use-dialog-box nil)

;; Editing settings.
(setq tab-width 4)
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

;; Scrolling settings
(setq ;;scroll-step 10
 scroll-margin 0
 scroll-conservatively 1000
 scroll-preserve-screen-position t)
;; (setq-default scroll-up-aggressively 0.0
;;               scroll-down-aggressively 0.0)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode t))

;; Other settings.
(fset 'yes-or-no-p 'y-or-n-p)
(setq enable-local-variables :safe)
(setq
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 sentence-end-double-space nil
 initial-scratch-message nil
 initial-major-mode 'fundamental-mode)

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

(when (display-graphic-p)
  ;; Enable emoji! 💩
  (set-fontset-font
   t 'emoji '("Apple Color Emoji" . "iso10646-1") nil 'prepend)
  ;; other stuff for window mode
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b")))))

(windmove-default-keybindings)          ; conflicts with org mode?
(global-diff-hl-mode 1)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-emacs)
