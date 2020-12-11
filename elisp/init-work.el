;;; -*- mode: emacs-lisp; -*-

(require 'init-util)

;;(require 'jcm-web)
;;(jcm-setup-web-settings)

;; Should these be *-foo-mode-hook instead?
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mjml" . sgml-mode))

;; ----------------------------------------
;; Move all these to common?
(setq
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

(use-package nav-flash
  :config
  (nav-flash-show))

(global-set-key (kbd "M-o") 'ace-window)

(provide 'init-work)
