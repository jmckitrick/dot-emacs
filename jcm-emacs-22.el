;;; -*- mode: emacs-lisp; -*-

(cond ((string-match "mac-apple-darwin" system-configuration)
       (require 'jcm-console))
      ((string-match "linux" system-configuration)
       (require 'jcm-linux)))

(provide 'jcm-emacs-22)
