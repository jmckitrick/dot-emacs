;;; -*- mode: emacs-lisp; -*-

;; Salesforce
;;(require 'init-apex)

;; Ruby
(use-package haml-mode)

(add-to-list 'auto-mode-alist '("\\.haml" . haml-mode))

;; (add-hook 'ruby-mode-hook 'robe-mode)

;; (eval-after-load 'company
;;   '(push 'company-robe company-backends))

(use-package lsp-mode
  :hook (
         (ruby-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; php
(add-to-list 'auto-mode-alist '("\\.php" . php-mode))

(provide 'init-consult)
