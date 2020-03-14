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

(provide 'init-clojure)
