(setq custom-file (concat user-emacs-directory "customize.el"))

;; Stuff we want.
(transient-mark-mode t)
(delete-selection-mode t)
(show-paren-mode 1)
(custom-set-variables
 '(kill-whole-line t)
 '(visible-bell t)
 '(tooltip-mode nil))
(column-number-mode t)

;; Stuff we don't.
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

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

;; Other settings.
(fset 'yes-or-no-p 'y-or-n-p)
(icomplete-mode 1)
(setq enable-local-variables :safe)

(setq scroll-step 1000)
(setq scroll-conservatively 1)
(setq scroll-preserve-screen-position t)
;(global-linum-mode 1)

(setq save-interprogram-paste-before-kill nil)

;; Fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (shell-command-to-string "zsh -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

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
                        ;;(setq initial-frame-alist (list width height left top))
                        ;;(setq default-frame-alist (list width height left top))
                        (set-frame-position (selected-frame) (cdr left) (cdr top))
                        (set-frame-size (selected-frame) (cdr width) (cdr height))))
      (let ((width-one '(width . 96))   ; 88
            (width-two '(width . 176))
            (width-three '(width . 210))
            (width-full '(width . 270))
            (width-eyes '(width . 160))
            (height-small '(height . 49)) ; 47
            (height-tall '(height . 73))
            (left-full '(left . 0))
            (left-pad '(left . 4))
            (left-out '(left . 130))
            (left-over '(left . 60))
            (left-less '(left . 280))   ; 240
            (left-one '(left . 320))
            (left-two '(left . 640))
            (left-eyes '(left . 400))
            (left-test '(left . 600))
            (top '(top . 24)))          ; 16? 24?
        (cl-case config
          (small (set-dims width-one height-small left-less top))
          (fat (set-dims width-two height-small left-full top))
          (chunky (set-dims width-eyes height-small left-over top))
          (pairs (set-dims width-two height-small left-full top))
          (tall (set-dims width-one height-tall left-two top))
          (wide (set-dims width-two height-tall left-one top))
          (wider (set-dims width-three height-tall left-out top))
          (widest (set-dims width-full height-tall left-full top))
          (pro (set-dims width-full height-tall left-pad top))
          (eyes (set-dims width-eyes height-tall left-eyes top))
          (retina (set-dims '(width . 120) height-small left-eyes top))
          (tj-medium (set-dims width-one-one '(height . 48) left-test top)))))

    (if (member config '(pairs eyes))
        ;;(set-frame-font "-apple-Monaco-medium-normal-normal-Regular-18-*-*-*-*-*-iso10646-1")
        ;;(set-frame-font "-apple-Monaco-medium-normal-normal-Regular-18-*-*-*-*-*-iso10646-1")
        (set-default-font "Menlo 24")
      (set-default-font "Menlo 24")
      ;;(set-frame-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-fontset-auto6")
      ;;(set-frame-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-fontset-auto6")
      ))

  ;;(add-to-list 'load-path (expand-file-name "color-theme-6.6.0/" jcm-elib-dir))

  (when window-system
    ;;(global-linum-mode t)
    ;;(setq mac-option-modifier 'super)
    ;;(setq ns-command-modifier 'meta)
    (jcm-set-carbon-prefs jcm-mac-window-size))

  (setq shell-file-name "/bin/zsh")
  (set-exec-path-from-shell-PATH)
  ;(require 'exec-path-from-shell)
  ;(exec-path-from-shell-initialize)

  ;; Bind Mac external keyboard delete key to delete rather than backspace.
  (global-set-key (kbd "<kp-delete>") 'delete-char))

;(add-to-list 'custom-theme-load-path
;             (expand-file-name "~/.emacs.d/elib/emacs-color-theme-solarized"))
(custom-set-variables
 '(solarized-italic nil))
;;(load-theme 'solarized-light t)
;;(load-theme 'solarized-dark t)

;(when jcm-theme-name
;  (load-theme jcm-theme-name t))
(push (concat user-emacs-directory "/elib/emacs-color-theme-solarized") load-path)
(require 'color-theme-solarized)
(color-theme-solarized)

(require 'smex)
(smex-initialize)

(provide 'init-emacs)
