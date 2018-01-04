;;; -*- mode: emacs-lisp; -*-

(package-initialize)

(defvar jcm-mac-window-size 'wide)     ;wider, widest, chunky, tj
(defvar jcm-theme-name 'solarized-dark)
(defvar jcm-elisp-dir (concat user-emacs-directory "lisp"))

(push jcm-elisp-dir load-path)

(setq gc-cons-threshold (* 50 1024 1024))

(require 'init-util)

(when (is-home-machine)
  (require 'init-package))

(when (is-work-machine)
  (require 'init-package-work)
  (setq custom-file (concat user-emacs-directory "customize-work.el"))
  (load custom-file))

(require 'init-emacs)
(require 'init-company)
(require 'init-ido)
(require 'init-keys)

(require 'init-lisp)
(require 'init-clojure)
(require 'init-misc)

(when (is-work-machine)
  (require 'init-work))

(setq gc-cons-threshold (* 1 1024 1024))
