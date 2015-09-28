;;; -*- mode: emacs-lisp; -*-

(defun my-lisp-mode-hook ()
  (require 'jcm-lisp)		 
  (jcm-lisp-setup))

(add-hook 'php-mode-hook
          (lambda ()
            (require 'jcm-web)
            (jcm-setup-web-settings)
            (jcm-setup-php-settings)
            (jcm-setup-php-docblock)))

(add-hook 'javascript-mode-hook
          (lambda ()
            (require 'jcm-web)
            (jcm-setup-web-settings)
            ;;(jcm-setup-javascript-settings)
            ))

(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'jcm-web)
            (jcm-setup-web-settings)))

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'jcm-web)
            (jcm-setup-web-settings)))

(add-hook 'java-mode-hook
          (lambda ()
            (jcm-setup-apex-settings)))

(add-hook 'clojure-mode-hook 'my-lisp-mode-hook)

(provide 'jcm-hooks)