;;; -*- mode: emacs-lisp; -*-

(require 'init-util)

;;(require 'jcm-web)
;;(jcm-setup-web-settings)

;; Should these be *-foo-mode-hook instead?
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mjml" . sgml-mode))

(provide 'init-work)
