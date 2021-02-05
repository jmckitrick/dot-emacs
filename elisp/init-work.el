;;; -*- mode: emacs-lisp; -*-

;; Work reminders:
;; To connect to DTD backend
;; - open a .clj file
;; - C-c M-c
;; - select clj backend
;;
;; To connect to DTD frontend
;; - connect to backend as above
;; - C-c M-C (NB: capital C)
;; - select cljs backend

(require 'init-util)

;;(require 'jcm-web)
;;(jcm-setup-web-settings)

;; Should these be *-foo-mode-hook instead?
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mjml" . sgml-mode))

(provide 'init-work)
