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
;;(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mjml" . web-mode))

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; aligns annotation to the right hand side
;(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;(add-hook 'before-save-hook 'tide-format-before-save)

;(add-hook 'typescript-mode-hook #'setup-tide-mode)

;(add-hook 'before-save-hook 'cider-format-buffer)

(setenv "PATH" (concat
                "/usr/local/bin" path-separator
                (getenv "PATH")))

(provide 'init-work)
