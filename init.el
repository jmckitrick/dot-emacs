;;; -*- mode: emacs-lisp; -*-

(defvar jcm-mac-window-size 'other)     ;widest, chunky
(defvar jcm-theme-name 'solarized-dark)
(defvar jcm-elisp-dir (expand-file-name "~/.emacs.d/lisp/"))
(defvar jcm-elib-dir (expand-file-name "~/.emacs.d/elib/"))

(add-to-list 'load-path jcm-elisp-dir)
(add-to-list 'load-path jcm-elib-dir)

(require 'package)
;(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(kill-whole-line t)
 '(show-paren-mode t)
 '(solarized-italic nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
