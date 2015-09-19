;;(require 'clj-refactor)

(autoload 'clojure-mode-hook "clojure-mode" t)
(autoload 'clojure-mode "clojure-mode" t)
(autoload 'cider-jack-in "cider" t)

(defun my-cider-mode-hook ()
  (require 'yesql-ghosts)
  (cider-turn-on-eldoc-mode))

(defun my-cider-repl-mode-hook ()
  (company-mode 1)
  (paredit-mode 1)
  (eldoc-mode))

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

;;(setq cider-repl-result-prefix ";; => ")
;;(setq cider-interactive-eval-result-prefix ";; => ")

(provide 'init-clojure)
