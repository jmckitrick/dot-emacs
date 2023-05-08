;;; -*- mode: emacs-lisp; -*-

(defvar jcm/font "JetBrains Mono 14")
(defvar jcm/extras '() "`elisp' and/or `consult'")
(defvar jcm/elisp-dir (concat user-emacs-directory "elisp"))

(package-initialize)
(eval-when-compile
  (require 'use-package))
(push jcm/elisp-dir load-path)

(require 'init-util)
(require 'init-emacs)
(require 'init-vertigo)
(require 'init-keys)
(require 'init-lisp)
(require 'init-clojure)
(require 'init-misc)
(require 'init-org)
(when (member 'elisp jcm/extras)
 (require 'init-elisp))

(when (is-home-machine)
  (load-customize-file "customize.el")
  (require 'init-package)
  (when (member 'consult jcm/extras)
    (require 'init-consult)))

(when (is-work-machine)
  (load-customize-file "customize-work.el")
  (require 'init-package-work)
  (require 'init-work))
