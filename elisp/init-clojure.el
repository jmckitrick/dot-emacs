;;; -*- mode: emacs-lisp; -*-

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
   cider-repl-display-help-banner nil))

(defun my-cider-repl-mode-hook ()
  ;(company-mode 1)
  ;(cider-eldoc-setup)
  (use-package init-lisp)
  (my-lisp-setup))

;(add-hook 'cider-mode-hook #'my-cider-mode-hook)
(add-hook 'cider-repl-mode-hook #'my-cider-repl-mode-hook)

(provide 'init-clojure)
