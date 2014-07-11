;;; -*- mode: emacs-lisp; -*-

(require 'php-mode)
(require 'sgml-mode)
(require 'javascript-mode)

(defun jcm-setup-php-docblock ()

  (define-skeleton file-doc-block
    "Inserting doc block for file"
    nil
    "<?php\n\n"
    "/**\n"
    " * Short description for file\n"
    " *\n"
    " * Long description for file (if any)...\n"
    " *\n"
    " * @author Jonathon McKitrick\n"
    " * @package sidewinder\n"
    " * @subpackage name\n"
    " */\n"
    "\nrequire_once('../../objects/autoload.php'); \n"
;;    '(indent-region (point-min) (point-max))
;;    '(indent-according-to-mode)
    )

  (define-skeleton function-doc-block
    "Inserting doc block for function/method"
    nil
    "/**\n"
    " * Description for method\n"
    " *\n"
    " * @param type $parameterName description\n"
    " * @return type description\n"
    " */"
;;    '(indent-region (point-min) (point-max))
;;    '(indent-according-to-mode)
    )

  (define-skeleton variable-doc-block
    "Inserting doc block for variable"
    nil
    "/**\n"
    " * Description for variable - class member\n"
    " * @var type \n"
    " */"
;;    '(indent-region (point-min) (point-max))
;;    '(indent-according-to-mode)
    )

  (define-skeleton class-doc-block
    "Inserting doc block for class"
    nil
    "/**\n"
    " * Short description for class\n"
    " *\n"
    " * Long description for class (if any)...\n"
    " *\n"
    " * @author Jonathon McKitrick\n"
    " * @package Project_Name\n"
    " * @subpackage Folder_name\n"
    " */\n"
    "class "
;;    '(indent-region (point-min) (point-max))
;;    '(indent-according-to-mode)
    ))

(defun jcm-setup-php-settings ()
  (define-key php-mode-map (kbd "C-<up>") 'beginning-of-defun)
  (define-key php-mode-map (kbd "C-<down>") 'end-of-defun)

  (setq indent-tabs-mode t)

  ;; One or the other of the following:
  (setq php-completion-file (expand-file-name "arc/php-completion-file" jcm-elisp-dir)) ; ALT TAB, not ESC!
  ;;(setq php-manual-path (expand-file-name "~/Documents/html"))
  
  (define-key php-mode-map (kbd "<f16>") 'html-mode)
  
  (define-key php-mode-map (kbd "C-c M-c") 'class-doc-block)
  (define-key php-mode-map (kbd "C-c M-b") 'file-doc-block)
  (define-key php-mode-map (kbd "C-c M-f") 'function-doc-block)
  (define-key php-mode-map (kbd "C-c M-v") 'variable-doc-block)

  (when (string-match "Pro" (system-name))
    (define-key global-map (kbd "<f6>") 'geben)
    (define-key global-map (kbd "C-<f6>") 'jcm-geben-end))
  
  (require 'php-tokens))

(defun jcm-setup-javascript-settings ()
  (define-key javascript-mode-map (kbd "C-<f16>") 'html-mode)
  (setq indent-tabs-mode nil))

(defun jcm-setup-web-settings ()
  (require 'etags-select)
  (global-set-key "\M-." 'etags-select-find-tag-at-point)
  (global-set-key (kbd "M-,") 'pop-tag-mark)
  
  (define-key ac-complete-mode-map "\t" 'ac-complete)
  (define-key ac-complete-mode-map "\r" nil)
  ;;(add-to-list 'completion-at-point-functions 'semantic-com)

  (define-key sgml-mode-map (kbd "<f16>") 'php-mode)
  (define-key sgml-mode-map (kbd "C-<left>") 'sgml-skip-tag-backward)
  (define-key sgml-mode-map (kbd "C-<right>") 'sgml-skip-tag-forward)

  ;;(define-key global-map (kbd "C-<f16>") 'javascript-mode)
  (define-key sgml-mode-map (kbd "C-<f16>") 'javascript-mode))

;(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
;(autoload 'javascript-mode "javascript-mode" nil t)

(provide 'jcm-web)
