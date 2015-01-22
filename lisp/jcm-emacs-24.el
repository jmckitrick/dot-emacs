;;; -*- mode: emacs-lisp; -*-

(when (string-match "apple" system-configuration)
  (require 'jcm-carbon))

(add-to-list 'custom-theme-load-path
             (expand-file-name "~/.emacs.d/elib/emacs-color-theme-solarized"))
(custom-set-variables
 '(solarized-italic nil))
;;(load-theme 'solarized-light t)
;;(load-theme 'solarized-dark t)

(when jcm-theme-name
  (load-theme jcm-theme-name t))

(provide 'jcm-emacs-24)
