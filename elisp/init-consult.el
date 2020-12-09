;;; -*- mode: emacs-lisp; -*-

;; Salesforce
;;(require 'init-apex)

;; Ruby
(use-package haml-mode)

(add-to-list 'auto-mode-alist '("\\.haml" . haml-mode))

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

;; php
(add-to-list 'auto-mode-alist '("\\.php" . php-mode))

(provide 'init-consult)
