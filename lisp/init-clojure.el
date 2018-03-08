(autoload 'clojure-mode-hook "clojure-mode" t)
(autoload 'clojure-mode "clojure-mode" t)
(autoload 'cider-jack-in "cider" t)

(defun my-cider-mode-hook ()
  (use-package yesql-ghosts)
  (eldoc-mode 1))

(defun my-cider-repl-mode-hook ()
  (company-mode 1)
  (cider-eldoc-setup)
  (use-package init-lisp)
  (my-lisp-setup))

(add-hook 'cider-mode-hook #'my-cider-mode-hook)
(add-hook 'cider-repl-mode-hook #'my-cider-repl-mode-hook)

;; Move this into the README for the project??
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

(defun my-clojure-mode-hook ()
  (require 'clj-refactor)
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m")
  ;;(require 'yesql-ghosts)
  ;;(cider-mode 1)
  (my-lisp-setup))

(setq nrepl-log-messages t
      nrepl-hide-special-buffers t
      cider-repl-pop-to-buffer-on-connect nil
      cider-popup-stacktraces t
      cider-repl-use-pretty-printing t
      cider-auto-select-error-buffer t
      cider-repl-display-in-current-window t
      cider-prompt-save-file-on-load nil)

(provide 'init-clojure)
