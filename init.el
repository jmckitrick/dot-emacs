;;; -*- mode: emacs-lisp; -*-

(package-initialize)

(eval-when-compile
 (require 'use-package))

(defvar jcm-mac-window-size 'wide)     ;wider, widest, chunky, tj
(defvar jcm-theme-name 'solarized-dark)
(defvar jcm-elisp-dir (concat user-emacs-directory "lisp"))

(push jcm-elisp-dir load-path)

(setq gc-cons-threshold (* 50 1024 1024))

(require 'init-util)
(require 'init-package)

(require 'init-emacs)
(require 'init-company)
(require 'init-ido)
(require 'init-keys)

(require 'init-lisp)
;;(require 'init-elisp)

(require 'init-clojure)
(require 'init-misc)

(when (is-home-machine)
  (setq custom-file (concat user-emacs-directory "customize.el"))
  (load custom-file)
  (require 'init-consult)
  (message "Ready for fun!"))

(when (is-work-machine)
  (setq custom-file (concat user-emacs-directory "customize-work.el"))
  (load custom-file)
  (require 'init-package-work)
  (require 'init-work)
  (message "Ready for work!"))

(setq gc-cons-threshold (* 2 1024 1024))
