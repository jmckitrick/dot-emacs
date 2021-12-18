;;; -*- mode: emacs-lisp; -*-

(defvar jcm/font "JetBrains Mono 18")
(defvar jcm/extras '() "`elisp' and/or `consult'")
(defvar jcm/elisp-dir (concat user-emacs-directory "elisp"))

(package-initialize)
(eval-when-compile
 (require 'use-package))
(push jcm/elisp-dir load-path)

(setq gc-cons-threshold (* 50 1024 1024))

(require 'init-util)
(require 'init-emacs)
(require 'init-company)
(require 'init-ivy)
(require 'init-keys)
(require 'init-lisp)
(require 'init-clojure)
(require 'init-misc)
(require 'init-org)
(when (member 'elisp jcm/extras)
  (require 'init-elisp))

(when (is-home-machine)
  (setq custom-file (concat user-emacs-directory "customize.el"))
  (load custom-file)
  (require 'init-package)
  (when (member 'consult jcm/extras)
    (require 'init-consult)))

(when (is-work-machine)
  (setq custom-file (concat user-emacs-directory "customize-work.el"))
  (load custom-file)
  (require 'init-package-work)
  (require 'init-work))

(setq gc-cons-threshold (* 2 1024 1024))
