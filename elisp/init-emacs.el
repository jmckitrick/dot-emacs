;;; -*- mode: emacs-lisp; -*-

;; ENABLE
(setq ring-bell-function 'ignore)
(setq kill-whole-line t)
(setq visible-bell t)
(transient-mark-mode t)
(delete-selection-mode t)
(show-paren-mode t)
(global-hl-line-mode 1)
(column-number-mode t)

;; DISABLE
(setq tooltip-mode nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(if (fboundp 'tool-bar-mode) (tool-bar-mode 0))

;; Editing settings.
(setq tab-width 4)            ;could be 4 or 8?
(setq-default indent-tabs-mode nil)
(setq fill-column 80)
(setq c-default-style "bsd"
      c-basic-offset 4
      track-eol t)
(c-set-offset 'case-label '+)
(setq js-indent-level 2)

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
(setq scroll-step 10
      scroll-margin 1
      scroll-conservatively 1000
      scroll-preserve-screen-position nil)
(setq-default scroll-up-aggressively 0.0
              scroll-down-aggressively 0.0)

;; Try this out.
(setq save-interprogram-paste-before-kill t)

;; Fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (shell-command-to-string "zsh -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; OSX settings
(when (string-match "apple" system-configuration)
  (defun jcm-set-carbon-prefs (config)
    "Set up emacs for carbon.
Possible CONFIG values:
small  = skinny, max height for MacBook
fat    = short and fat for MacBook
chunky = short and wider
pairs  = short and fat for MacBook
tall   = centered, max height for Cinema
wide   = two panes, max height for Cinema
wider  = two panes, max height for Pro
widest = three panes, max height for Cinema
pro    = three panes, max height for Pro
eyes   = one pane, max height for Pro, large font"
    (interactive)
    (cl-flet ((set-dims (width height left top)
                        (set-frame-position (selected-frame) (cdr left) (cdr top))
                        (set-frame-size (selected-frame) (cdr width) (cdr height))))
      (let ((width-one '(width . 96))   ; 88
	    (width-one-one '(width . 110))
            (width-two '(width . 176))
            (width-three '(width . 210))
            (width-full '(width . 270))
            (width-eyes '(width . 160))
            (height-small '(height . 49)) ; 47
            (height-tall '(height . 73))
            (left-full '(left . 0))
            (left-pad '(left . 4))
            (left-over '(left . 60))
            (left-out '(left . 130))
            (left-less '(left . 280))   ; 240
            (left-one '(left . 320))
            (left-eyes '(left . 400))
            (left-test '(left . 600))
            (left-two '(left . 640))
            (top '(top . 24)))          ; 16? 24?
        (cl-case config
          (small  (set-dims width-one   height-small left-less top))
          (fat    (set-dims width-two   height-small left-full top))
          (chunky (set-dims width-eyes  height-small left-over top))
          (pairs  (set-dims width-two   height-small left-full top))
          (tall   (set-dims width-one   height-tall  left-two  top))
          (wide   (set-dims width-two   height-tall  left-full top))
          (wider  (set-dims width-three height-tall  left-out  top))
          (widest (set-dims width-full  height-tall  left-full top))
          (pro    (set-dims width-full  height-tall  left-pad  top))
          (eyes   (set-dims width-eyes  height-tall  left-eyes top))

          (retina    (set-dims '(width . 120) height-small left-eyes top))
          (tj-medium (set-dims width-one-one '(height . 48) left-test top)))))
    (set-default-font jcm-font)
    (setq-default line-spacing 1))

  (when window-system
    ;;(setq mac-option-modifier 'super)
    ;;(setq ns-command-modifier 'meta)
    (jcm-set-carbon-prefs jcm-mac-window-size))

  ;;(add-to-list 'default-frame-alist '(font . jcm-font))

  (setq shell-file-name "/bin/zsh")
  (set-exec-path-from-shell-PATH)

  ;; Bind Mac external keyboard delete key to delete rather than backspace.
  (global-set-key (kbd "<kp-delete>") 'delete-char))

;; Themes
(when (and jcm-theme-name window-system)
  (setq solarized-use-less-bold t)
  (setq solarized-use-more-italic nil)
  (load-theme jcm-theme-name t))

(recentf-mode t)
(save-place-mode)

(provide 'init-emacs)
