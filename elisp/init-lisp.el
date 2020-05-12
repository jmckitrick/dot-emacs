;;; -*- mode: emacs-lisp; -*-

(defun my-lisp-setup ()
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

  (enable-paredit-mode)

  (rainbow-delimiters-mode-enable)

  (local-set-key (kbd "C-n") 'forward-sexp)
  (local-set-key (kbd "C-h") 'backward-sexp)
  (local-set-key (kbd "C-t") 'transpose-sexps)
  (local-set-key (kbd "C-M-t") 'transpose-chars)
  (local-set-key (kbd "C-.") 'down-list)
  (local-set-key (kbd "C-,") 'backward-up-list)

  (local-set-key (kbd "C-<up>") 'beginning-of-defun)
  (local-set-key (kbd "C-<down>") 'end-of-defun))

;; (defvar jcm-slime-params-regular '(slime-fancy slime-asdf slime-indentation)
;;   "Slime setup params for regular mode.")

;; (defvar jcm-slime-params-dev '(slime-fancy slime-cover slime-indentation slime-sprof)
;;   "Slime setup params for dev mode.")

;; (defvar jcm-slime-params-remote '(slime-fancy slime-tramp slime-indentation)
;;   "Slime setup params for remote mode.")

;; (defun my-slime-load-hook ()
;;   "Slime-specific key mappings."
;;   ;(define-key slime-mode-map (kbd "<tab>") 'slime-fuzzy-indent-and-complete-symbol)
;;   (define-key slime-mode-map (kbd "<f6>") 'slime-inspect)
;;   (define-key global-map (kbd "<f7>") 'slime-selector)
;;   ;;(define-key slime-mode-map (kbd "<f7>") 'slime-selector)
;;   ;;(define-key global-map (kbd "C-<f5>") 'slime-quit-lisp)
;;   (define-key global-map (kbd "M-<f5>") 'slime-quit-lisp))

;; (defun jcm-setup-slime-paths ()
;;   "Set up slime load paths."
;;   ;;(add-to-list 'load-path (expand-file-name "~/loc/slime/"))
;;   ;;(add-to-list 'load-path (expand-file-name "~/loc/slime/contrib/"))
;;   ;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/slime-2.14"))
;;   (load (expand-file-name "~/quicklisp/slime-helper.el"))
;;   ;; Replace "sbcl" with the path to your implementation
;;   ;;(setq inferior-lisp-program "sbcl")
;;   (require 'slime-autoloads))

;; (defun jcm-setup-slime-options ()
;;   "Setup basic slime options before starting."
;;   (setq
;;    slime-lisp-implementations
;;    '((sbcl ("/usr/local/bin/sbcl"))
;; 	 (ccl ("/Users/jmckitrick/bin/ccl"))
;;      (ccl64 ("/Users/jmckitrick/bin/ccl64"))
;;      (abcl ("/Users/jmckitrick/loc/abcl-src-0.16.0/abcl")))
;;    common-lisp-hyperspec-root "http://www.lispworks.com/documentation/HyperSpec/"
;;    slime-enable-evaluate-in-emacs t
;;    slime-header-line-p t
;;    slime-startup-animation t)
;;   (setq slime-net-coding-system 'utf-8-unix)
;;   (add-hook 'slime-load-hook 'my-slime-load-hook))

;; (defun jcm-setup-slime (setup-args)
;;   "Do basic and custom slime setup."
;;   (interactive)
;;   (jcm-setup-slime-paths)
;;   (slime-setup setup-args)
;;   (setq lisp-lambda-list-keyword-parameter-alignment t)
;;   (setq lisp-lambda-list-keyword-alignment t)
;;   (jcm-setup-slime-options))

;; (defun jcm-start-slime ()
;;   "M-- M-x slime - select a lisp for slime."
;;   (interactive)
;;   (message "Starting slime in regular mode.")
;;   (sleep-for 1)
;;   (setq slime-filename-translations nil)
;;   (jcm-setup-slime jcm-slime-params-regular)
;;   (save-excursion (slime)))

;; (defun jcm-start-slime-dev ()
;;   "Start slime in dev mode."
;;   (interactive)
;;   (message "Starting slime in dev mode.")
;;   (sleep-for 1)
;;   (setq slime-filename-translations nil)
;;   (jcm-setup-slime jcm-slime-params-dev)
;;   (save-excursion (slime)))

;; (defun jcm-start-slime-remote ()
;;   "Start slime on a remote or tunneled connection."
;;   (interactive)
;;   (message "Starting slime remote connection via tunnel.")
;;   (sleep-for 1)
;;   (jcm-setup-slime jcm-slime-params-remote)
;;   (slime-connect "127.0.0.1" 4005)
;;   (push (list "li26-168"
;; 			  (lambda (emacs-filename)
;; 				(subseq emacs-filename (length "/ssh:jcm@mynode:")))
;; 			  (lambda (lisp-filename)
;; 				(concat "/ssh:jcm@mynode:" lisp-filename)))
;; 		slime-filename-translations)
;;   (push (list "li168-147"
;;               (lambda (emacs-filename)
;;                 (subseq emacs-filename (length "/ssh:jcm@li168-147.members.linode.com:")))
;;               (lambda (lisp-filename)
;;                 (concat "/ssh:jcm@li168-147.members.linode.com:" lisp-filename)))
;;         slime-filename-translations))

;; ;;; General

;; (use-package tramp)

;; (mapc (lambda (f) (autoload f "jcm-slime" "" t))
;;       '(jcm-start-slime
;;         jcm-start-slime-dev
;;         jcm-start-slime-remote))

;; ;;; Keymaps

;; (define-key global-map (kbd "<f5>") 'jcm-start-slime)
;; ;;(define-key global-map (kbd "C-<f5>") 'jcm-start-slime-dev)
;; (define-key global-map (kbd "M-<f8>") 'jcm-start-slime-remote)

;; ;;; Hooks

;; (add-hook 'lisp-mode-hook
;;           (lambda ()
;;             (my-lisp-setup)
;;             (eldoc-mode 1)))

;; (add-hook 'slime-repl-mode-hook
;;           (lambda ()
;;             (my-lisp-setup)
;;             (eldoc-mode -1)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (eldoc-mode 1)
            (my-lisp-setup)))

(add-hook 'clojure-mode-hook
          (lambda ()
            ;;(eldoc-mode 1)
            (my-lisp-setup)))

(provide 'init-lisp)
