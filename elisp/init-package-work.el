;;; -*- mode: emacs-lisp; -*-

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(modus-themes . "melpa-stable"))
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
;;(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)

(provide 'init-package-work)
