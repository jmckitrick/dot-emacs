;;; -*- mode: emacs-lisp; -*-

(defun jcm-set-linux-prefs ()
  ;; default - small 88 col
  (setq initial-frame-alist '((width . 88) (height . 40) (left . 270) (top . 28)))
  (setq default-frame-alist '((width . 88) (height . 40) (left . 270) (top . 28)))

  ;;(set-frame-font "-*-lucida-medium-r-*-*-14-*-*-*-*-*-*-*")
  ;;(set-frame-font "-*-fixed-medium-*-*-*-14-*-*-*-*-*-*-*")
  ;;(set-frame-font "-*-fixed-small-*-*-*-14-*-*-*-*-*-*-*")

  ;;(setq initial-frame-alist '((width . 88) (height . 45) (left . 200) (top . 32)))
  ;;(setq default-frame-alist '((width . 88) (height . 45) (left . 200) (top . 32)))

  ;; default - small 88 col
  ;;(setq initial-frame-alist '((width . 88) (height . 55) (left . 300) (top . 32)))
  ;;(setq default-frame-alist '((width . 88) (height . 55) (left . 300) (top . 32)))

  ;; Themes --------------------------------------------------------------------

  ;;  Ramangalahy
  ;;  Rotor
  ;;  Snowish
  ;;  Standard XEmacs
  ;;  Taming...
  ;;  TTY Dark
  ;;  White on Grey

  (add-to-list 'load-path (expand-file-name "~/cvs/color-theme"))

  (require 'color-theme)

  (color-theme-initialize)
  (color-theme-xemacs)
  ;;(color-theme-tiger-xcode)
  ;;(color-theme-jcm)
  ;;(color-theme-arjen)
  ;;(color-theme-select)
  ;;(color-theme-tty-dark)
  ;;(color-theme-goldenrod)
  ;;(diary)

  (define-key global-map (kbd "<f9>") (lambda () (interactive) (color-theme-select)))

  (require 'php-mode)
  (define-key php-mode-map (kbd "M-,") 'pop-tag-mark))

(provide 'jcm-linux)
