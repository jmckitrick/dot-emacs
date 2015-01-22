;;; -*- mode: emacs-lisp; -*-

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

(provide 'jcm-slime)
