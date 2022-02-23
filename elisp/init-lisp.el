;;; -*- mode: emacs-lisp; -*-

(defun my-lisp-setup ()
  "Bind sexp editing functions for all lisp editing."
  (interactive)
  (setq indent-tabs-mode nil)

  (autoload 'enable-paredit-mode "paredit" "..." t)
  (eval-after-load 'paredit
    '(progn
       ;; TODO revisit this binding
       (define-key paredit-mode-map (kbd "M-k") 'paredit-copy-as-kill)
       (define-key paredit-mode-map (kbd "C-k") 'kill-sexp)
       (define-key paredit-mode-map (kbd "C-M-k") 'paredit-kill)))

  (require 'paredit-menu)
  (enable-paredit-mode)
  ;;(diminish 'paredit-mode "()")
  ;;(smartparens-global-strict-mode)

  (rainbow-delimiters-mode-enable)

  (subword-mode)
  (diminish 'subword-mode)

  (local-set-key (kbd "C-n") 'forward-sexp)
  (local-set-key (kbd "C-h") 'backward-sexp)
  (local-set-key (kbd "C-t") 'transpose-sexps)
  (local-set-key (kbd "C-M-t") 'transpose-chars)
  (local-set-key (kbd "C-.") 'down-list)
  (local-set-key (kbd "C-,") 'backward-up-list)

  (local-set-key (kbd "C-<up>") 'beginning-of-defun)
  (local-set-key (kbd "C-<down>") 'end-of-defun))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            ;;(eldoc-mode 1)
            (my-lisp-setup)))

(add-hook 'clojure-mode-hook
          (lambda ()
            ;;(eldoc-mode 1)
            (my-lisp-setup)))

(provide 'init-lisp)
