;;; -*- mode: emacs-lisp; -*-

(defun jcm-lisp-setup ()
  "Bind sexp editing functions for all lisp editing."
  (interactive)
  (setq indent-tabs-mode nil)

  (autoload 'enable-paredit-mode "paredit" "..." t)
  (eval-after-load 'paredit
    '(progn
       ;(define-key paredit-mode-map (kbd "<kp-delete>") 'paredit-kill)
       (define-key paredit-mode-map (kbd "C-c w") 'copy-sexp)
       (define-key paredit-mode-map (kbd "C-k") 'kill-sexp)
       (define-key paredit-mode-map (kbd "C-M-k") 'paredit-kill)))
  
  ;(require 'paredit)
  ;(paredit-mode 1)
  (enable-paredit-mode)
  ;(require 'mic-paren)
  ;(paren-activate)                      ; mic-paren
  ;(setq paren-priority 'both)

  (local-set-key (kbd "C-n") 'forward-sexp)
  (local-set-key (kbd "C-h") 'backward-sexp)
  (local-set-key (kbd "C-t") 'transpose-sexps)
  (local-set-key (kbd "C-M-t") 'transpose-chars)
  (local-set-key (kbd "C-.") 'down-list)
  (local-set-key (kbd "C-,") 'backward-up-list)

  (local-set-key (kbd "C-<up>") 'beginning-of-defun)
  (local-set-key (kbd "C-<down>") 'end-of-defun)

  (define-skeleton comment-doc-banner
    "Inserting doc block"
    nil
    ";;; ---------------------------------------------------------------------------\n"
    ";;; Docs here\n"
    ";;; ---------------------------------------------------------------------------\n"
    ))

(provide 'jcm-lisp)
