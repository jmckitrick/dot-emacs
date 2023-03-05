;;; -*- mode: emacs-lisp; -*-

;; NB: Options can also be set in Directory Local Variables.

(use-package cider
  :ensure t
  :config
  (setq
   nrepl-log-messages t
   nrepl-hide-special-buffers t
   cider-repl-pop-to-buffer-on-connect t
   cider-popup-stacktraces t
   cider-repl-use-pretty-printing t
   cider-auto-select-error-buffer t
   cider-repl-display-in-current-window nil
   cider-prompt-save-file-on-load nil
   cider-repl-display-help-banner nil)
  :hook
  (cider-mode . (lambda () (setq-local completion-styles '(basic))))
  (cider-repl-mode . (lambda () (setq-local completion-styles '(basic)))))

(defun my-cider-mode-hook ()
  (eldoc-mode 1)
  (cider-eldoc-setup)
  ;(company-mode)
  (use-package init-lisp)
  (my-lisp-setup))

(defun my-cider-repl-mode-hook ()
  (eldoc-mode 1)
  (cider-eldoc-setup)
  ;(company-mode)
  (use-package init-lisp)
  (my-lisp-setup))

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'cider-mode-hook #'my-cider-mode-hook)
(add-hook 'cider-repl-mode-hook #'my-cider-repl-mode-hook)
;;(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(provide 'init-clojure)
