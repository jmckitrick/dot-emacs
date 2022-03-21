;;; -*- mode: emacs-lisp; -*-

(defvar jcm/font "JetBrains Mono 18")
(defvar jcm/extras '() "`elisp' and/or `consult'")
(defvar jcm/elisp-dir (concat user-emacs-directory "elisp"))

(package-initialize)
(eval-when-compile
 (require 'use-package))
(push jcm/elisp-dir load-path)

(setq gc-cons-threshold (* 50 1024 1024))

(let ((gc-cons-threshold most-positive-fixnum))

  (require 'init-util)
  (require 'init-emacs)
  ;;(require 'init-company) ; XXX remember cider mode hooks
  ;;(require 'init-ivy)
  (require 'init-vertigo)
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
    (require 'init-work)))

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold (* 10 1024 1024)))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(run-with-idle-timer 2 t (lambda () (garbage-collect)))
