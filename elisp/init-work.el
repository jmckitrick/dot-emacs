;;; -*- mode: emacs-lisp; -*-

(require 'init-util)

;(require 'jcm-web)
;;(jcm-setup-web-settings)

;; This has been working
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(defun setup-react ()
  (rjsx-mode)
  (flycheck-mode)
  (eldoc-mode)
  ;(tide-setup)
  ;(tide-hl-identifier-mode +1)
  ;(message "Ready to React!")
  )

(use-package ensime
  :bind (:map ensime-mode-map ("M-." . ensime-edit-definition)))

(add-hook 'scala-mode-hook 'rainbow-delimiters-mode)

;; Should these be *-foo-mode-hook instead?
(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-react))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-react))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-react))

;; (defadvice web-mode-highlight-part (around tweak-jsx-activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))
;;(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
;;(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

(autoload 'enable-paredit-mode "paredit" "..." t)

;(enable-paredit-mode)

(use-package autopair
  :diminish pair
  :hook scala-mode-hook)
;;(add-hook 'scala-mode-hook 'autopair-mode)
;;(add-hook 'scala-mode-hook 'enable-paredit-mode)

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

(server-start)

(global-set-key (kbd "M-o") 'ace-window)

(provide 'init-work)
