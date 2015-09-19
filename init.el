;;; -*- mode: emacs-lisp; -*-

(defvar jcm-mac-window-size 'tj-medium)     ;wider, widest, chunky, tj
(defvar jcm-theme-name 'solarized-light)
(defvar jcm-elisp-dir (concat user-emacs-directory "lisp"))

(push jcm-elisp-dir load-path)

(require 'init-package)
(require 'init-util)

(safe-load-init-files jcm-elisp-dir)


;; OLD

;(require 'jcm-general)
;(require 'jcm-functions)
;(require 'jcm-keymaps)
;(require 'jcm-hooks)

;(when (is-work-machine)
;  (require 'jcm-work))
;(when (is-home-machine t)
;  (require 'jcm-home))

