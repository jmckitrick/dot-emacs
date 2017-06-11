(autoload 'clojure-mode-hook "clojure-mode" t)
(autoload 'clojure-mode "clojure-mode" t)
(autoload 'cider-jack-in "cider" t)

(defun my-cider-mode-hook ()
  (eldoc-mode 1))

(defun my-cider-repl-mode-hook ()
  (setq cider-repl-display-help-banner nil)
  (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
  (company-mode 1)
  (paredit-mode 1)
  (eldoc-mode 1)
  (cider-eldoc-setup)
  (require 'init-lisp)
  (my-lisp-setup))

(add-hook 'cider-mode-hook #'my-cider-mode-hook)
(add-hook 'cider-repl-mode-hook #'my-cider-repl-mode-hook)

(defun my-clojure-mode-hook ()
  (cider-mode 1))

(setq nrepl-log-messages t
      nrepl-hide-special-buffers t
      cider-repl-pop-to-buffer-on-connect nil
      cider-popup-stacktraces t
      cider-repl-use-pretty-printing t
      cider-auto-select-error-buffer t
      cider-repl-display-in-current-window t
      cider-prompt-save-file-on-load nil)

(provide 'init-clojure)
