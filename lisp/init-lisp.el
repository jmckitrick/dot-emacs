;;; -*- mode: emacs-lisp; -*-

(defun elisp-disassemble (function)
  (interactive (list (function-called-at-point)))
  (disassemble function))

(defun elisp-pp (sexp)
  (with-output-to-temp-buffer "*Pp Eval Output*"
    (pp sexp)
    (with-current-buffer standard-output
      (emacs-lisp-mode))))

(defun elisp-macroexpand (form)
  (interactive (list (form-at-point 'sexp)))
  (elisp-pp (macroexpand form)))

(defun elisp-macroexpand-all (form)
  (interactive (list (form-at-point 'sexp)))
  (elisp-pp (cl-macroexpand-all form)))

(defun elisp-push-point-marker ()
  (require 'etags)
  (cond ((featurep 'xemacs)
		 (push-tag-mark))
		(t (ring-insert find-tag-marker-ring (point-marker)))))

(defun elisp-pop-found-function ()
  (interactive)
  (cond ((featurep 'xemacs) (pop-tag-mark nil))
		(t (pop-tag-mark))))

(defun elisp-find-definition (name)
  "Jump to the definition of the function (or variable) at point."
  (interactive (list (thing-at-point 'symbol)))
  (cond (name
		 (let ((symbol (intern-soft name))
		       (search (lambda (fun sym)
                         (let* ((r (save-excursion (funcall fun sym)))
                                (buffer (car r))
                                (point (cdr r)))
                           (cond ((not point)
                                  (error "Found no definition for %s in %s"
                                         name buffer))
                                 (t
                                  (switch-to-buffer buffer)
                                  (goto-char point)
                                  (recenter 1)))))))
		   (cond ((fboundp symbol)
                  (elisp-push-point-marker)
                  (funcall search 'find-function-noselect symbol))
                 ((boundp symbol)
                  (elisp-push-point-marker)
                  (funcall search 'find-variable-noselect symbol))
                 (t
                  (message "Symbol not bound: %S" symbol)))))
        (t (message "No symbol at point"))))

(defun elisp-bytecompile-and-load ()
  (interactive)
  (or buffer-file-name
      (error "The buffer must be saved in a file first"))
  (require 'bytecomp)
  ;; Recompile if file or buffer has changed since last compilation.
  (when  (and (buffer-modified-p)
		      (y-or-n-p (format "save buffer %s first? " (buffer-name))))
    (save-buffer))
  (let ((filename (expand-file-name buffer-file-name)))
    (with-temp-buffer
      (byte-compile-file filename t))))

(defvar elisp-extra-keys 
  '(((kbd "C-c d")   'elisp-disassemble)
    ((kbd "C-c m")   'elisp-macroexpand)
    ((kbd "C-c M")   'elisp-macroexpand-all)
    ((kbd "C-c C-c") 'compile-defun)
    ((kbd "C-c C-k") 'elisp-bytecompile-and-load)
    ((kbd "C-c C-l") 'load-file)
    ((kbd "C-c p")   'pp-eval-last-sexp)
    ((kbd "M-.")     'elisp-find-definition)
    ((kbd "M-,")     'elisp-pop-found-function)
    ((kbd "C-c <")   'list-callers)))

(dolist (binding elisp-extra-keys)
  (let ((key (eval (car binding))) (val (eval (cadr binding))))
    (define-key emacs-lisp-mode-map key val)
    (define-key lisp-interaction-mode-map key val)))

(defun jump-to-form ()
  (interactive)
  (if (featurep 'xemacs)
      (progn
	    (forward-char 1)
	    (let ((name (symbol-atpt))
              (file (progn (search-forward "\"" nil t 1)
                           (thing-at-point 'filename))))
	      (forward-char 1)
	      (help-find-source-or-scroll-up (point))
	      (switch-to-buffer (current-buffer))
	      (kill-new name)
	      (search-forward name)))
    (other-window 1)
    (forward-button 1)
    ;; (find-file (filename-atpt))
    (push-button)))

(global-set-key (kbd "C-c C-f") 'find-function-at-point)

(defun my-lisp-setup ()
  "Bind sexp editing functions for all lisp editing."
  (interactive)
  (setq indent-tabs-mode nil)

  (autoload 'enable-paredit-mode "paredit" "..." t)
  (eval-after-load 'paredit
    '(progn
       ;(define-key paredit-mode-map (kbd "<kp-delete>") 'paredit-kill)
       (define-key paredit-mode-map (kbd "C-c w") 'copy-sexp)
       (define-key paredit-mode-map (kbd "C-M-k") 'kill-sexp)
       ;(define-key paredit-mode-map (kbd "C-M-k") 'paredit-kill)
       ))
  
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

(defvar jcm-slime-params-regular '(slime-fancy slime-asdf slime-indentation)
  "Slime setup params for regular mode.")

(defvar jcm-slime-params-dev '(slime-fancy slime-cover slime-indentation slime-sprof)
  "Slime setup params for dev mode.")

(defvar jcm-slime-params-remote '(slime-fancy slime-tramp slime-indentation)
  "Slime setup params for remote mode.")

(defun my-slime-load-hook ()
  "Slime-specific key mappings."
  ;(define-key slime-mode-map (kbd "<tab>") 'slime-fuzzy-indent-and-complete-symbol)
  (define-key slime-mode-map (kbd "<f6>") 'slime-inspect)
  (define-key global-map (kbd "<f7>") 'slime-selector)
  ;;(define-key slime-mode-map (kbd "<f7>") 'slime-selector)
  ;;(define-key global-map (kbd "C-<f5>") 'slime-quit-lisp)
  (define-key global-map (kbd "M-<f5>") 'slime-quit-lisp))

(defun jcm-setup-slime-paths ()
  "Set up slime load paths."
  ;;(add-to-list 'load-path (expand-file-name "~/loc/slime/"))
  ;;(add-to-list 'load-path (expand-file-name "~/loc/slime/contrib/"))
  (require 'slime-autoloads))

(defun jcm-setup-slime-options ()
  "Setup basic slime options before starting."
  (setq
   slime-lisp-implementations
   '((sbcl ("/usr/local/bin/sbcl"))
	 (ccl ("/Users/jmckitrick/bin/ccl"))
     (ccl64 ("/Users/jmckitrick/bin/ccl64"))
     (abcl ("/Users/jmckitrick/loc/abcl-src-0.16.0/abcl")))
   common-lisp-hyperspec-root "http://www.lispworks.com/documentation/HyperSpec/"
   slime-enable-evaluate-in-emacs t
   slime-header-line-p t
   slime-startup-animation t)
  (setq slime-net-coding-system 'utf-8-unix)
  (add-hook 'slime-load-hook 'my-slime-load-hook))

(defun jcm-setup-slime (setup-args)
  "Do basic and custom slime setup."
  (interactive)
  (jcm-setup-slime-paths)
  (slime-setup setup-args)
  (setq lisp-lambda-list-keyword-parameter-alignment t)
  (setq lisp-lambda-list-keyword-alignment t)
  (jcm-setup-slime-options))

(defun jcm-start-slime ()
  "M-- M-x slime - select a lisp for slime."
  (interactive)
  (message "Starting slime in regular mode.")
  (sleep-for 1)
  (setq slime-filename-translations nil)
  (jcm-setup-slime jcm-slime-params-regular)
  (save-excursion (slime)))

(defun jcm-start-slime-dev ()
  "Start slime in dev mode."
  (interactive)
  (message "Starting slime in dev mode.")
  (sleep-for 1)
  (setq slime-filename-translations nil)
  (jcm-setup-slime jcm-slime-params-dev)
  (save-excursion (slime)))

(defun jcm-start-slime-remote ()
  "Start slime on a remote or tunneled connection."
  (interactive)
  (message "Starting slime remote connection via tunnel.")
  (sleep-for 1)
  (jcm-setup-slime jcm-slime-params-remote)
  (slime-connect "127.0.0.1" 4005)
  (push (list "li26-168"
			  (lambda (emacs-filename)
				(subseq emacs-filename (length "/ssh:jcm@mynode:")))
			  (lambda (lisp-filename)
				(concat "/ssh:jcm@mynode:" lisp-filename)))
		slime-filename-translations)
  (push (list "li168-147"
              (lambda (emacs-filename)
                (subseq emacs-filename (length "/ssh:jcm@li168-147.members.linode.com:")))
              (lambda (lisp-filename)
                (concat "/ssh:jcm@li168-147.members.linode.com:" lisp-filename)))
        slime-filename-translations))

;; XXX Might not need this anymore.
;; (defun jcm-setup-tramp ()
;;   "Setup cnacompass proxy for tramp."
;;   (interactive)
;;   (add-to-list 'tramp-default-proxies-alist
;; 			   '("cnacompass.org" nil "/ssh:jcm@mynode:")))

;;; General

;(require 'php-mode)
(require 'tramp)
;(jcm-setup-tramp)

(mapc (lambda (f) (autoload f "jcm-slime" "" t))
      '(jcm-start-slime
        jcm-start-slime-beta
        jcm-start-slime-remote))

;;; Keymaps

(define-key global-map (kbd "<f5>") 'jcm-start-slime)
;;(define-key global-map (kbd "C-<f5>") 'jcm-start-slime-beta)
(define-key global-map (kbd "M-<f8>") 'jcm-start-slime-remote)

;;; Hooks

(add-hook 'lisp-mode-hook
          (lambda ()
            (eldoc-mode)
            (my-lisp-setup)))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (eldoc-mode)
            (my-lisp-setup)))

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (eldoc-mode)
            (my-lisp-setup)))

(add-hook 'clojure-mode-hook
          (lambda ()
            (eldoc-mode)
            (my-lisp-setup)))

(provide 'init-lisp)
