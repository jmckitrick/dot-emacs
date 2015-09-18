;;; -*- mode: emacs-lisp; -*-

(defvar jcm-mac-window-size 'tj-medium)     ;wider, widest, chunky, tj
(defvar jcm-theme-name 'solarized-light)
(defvar jcm-elisp-dir (concat user-emacs-directory "lisp"))

(push jcm-elisp-dir load-path)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'cl-lib)
(require 'jcm-general)
(require 'jcm-functions)
(require 'jcm-keymaps)
(require 'jcm-hooks)

(when (is-work-machine)
  (require 'jcm-work))
(when (is-home-machine t)
  (require 'jcm-home))

(cl-case emacs-major-version
  (24 (require 'jcm-emacs-24))
  (23 (require 'jcm-emacs-23))
  (22 (require 'jcm-emacs-22)))

