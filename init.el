;;; -*- mode: emacs-lisp; -*-

(defvar jcm-mac-window-size 'small)     ;widest, chunky
(defvar jcm-theme-name 'solarized-dark)
(defvar jcm-elisp-dir (expand-file-name "~/.emacs.d/"))
(defvar jcm-elib-dir (expand-file-name "~/.emacs.d/elib/"))

(add-to-list 'load-path jcm-elisp-dir)
(add-to-list 'load-path jcm-elib-dir)

(require 'cl)
(require 'jcm-general)
(require 'jcm-functions)
(require 'jcm-keymaps)
(require 'jcm-hooks)

(when (is-work-machine t)
  (require 'jcm-work))
(when (is-home-machine t)
  (require 'jcm-home))

(case emacs-major-version
  (24 (require 'jcm-emacs-24))
  (23 (require 'jcm-emacs-23))
  (22 (require 'jcm-emacs-22)))
