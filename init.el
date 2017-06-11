;;; -*- mode: emacs-lisp; -*-

(package-initialize)

(defvar jcm-mac-window-size 'wide)     ;wider, widest, chunky, tj
(defvar jcm-theme-name 'solarized-light)
(defvar jcm-elisp-dir (concat user-emacs-directory "lisp"))

(push jcm-elisp-dir load-path)

(require 'init-package)
(require 'init-util)

(safe-load-init-files jcm-elisp-dir)
