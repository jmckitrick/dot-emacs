;;; -*- mode: emacs-lisp; -*-

(require 'init-apex)

(use-package haml-mode)

(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(provide 'init-consult)
