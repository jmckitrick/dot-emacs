;;; -*- mode: emacs-lisp; -*-

(defvar jcm-mac-window-size 'wide "`wider', `widest', `chunky', `tj'")
(defvar jcm-font "JetBrains Mono 19")
(defvar jcm-theme-name 'solarized-dark-high-contrast)
(defvar jcm-elisp-dir (concat user-emacs-directory "elisp"))
(defvar jcm-extras nil "`elisp' or `consult'")

(package-initialize)
(eval-when-compile
 (require 'use-package))
(push jcm-elisp-dir load-path)

(setq gc-cons-threshold (* 50 1024 1024))

(require 'init-util)

(require 'init-emacs)
(require 'init-company)
(require 'init-ivy)
(require 'init-keys)

(require 'init-lisp)
(when (member 'elisp jcm-extras)
  (require 'init-elisp))

(require 'init-clojure)
(require 'init-misc)
(require 'init-org)

(when (is-home-machine)
  (setq custom-file (concat user-emacs-directory "customize.el"))
  (load custom-file)
  (require 'init-package)
  (when (member 'consult jcm-extras)
    (require 'init-consult))
  (message "Home machine"))

(when (is-work-machine)
  (setq custom-file (concat user-emacs-directory "customize-work.el"))
  (load custom-file)
  (require 'init-package-work)
  (require 'init-work)
  (message "Work machine"))

(setq gc-cons-threshold (* 2 1024 1024))
