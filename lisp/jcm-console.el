;;; -*- mode: emacs-lisp; -*-

(defun jcm-set-console-prefs ()
  (require 'php-mode)
  (global-set-key (kbd "<kp-delete>") 'delete-char))

(jcm-set-console-prefs)

(provide 'jcm-console)
