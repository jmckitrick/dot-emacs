;;; -*- mode: emacs-lisp; -*-

(when (string-match "apple" system-configuration)
  (require 'jcm-carbon))

(require 'color-theme)
(color-theme-initialize)

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/elib/emacs-color-theme-solarized"))
(require 'color-theme-solarized)
;;(color-theme-solarized-light)
(custom-set-variables
 '(solarized-italic nil))
(color-theme-solarized-dark)

;;(require 'jcm-themes)
;;(funcall theme-fn)

;;(color-theme-xemacs)
;;(color-theme-dark-bliss)
;;(color-theme-goldenrod)
;;(color-theme-blue-sea)
;;(color-theme-charcoal-black)
;;(color-theme-billw)
;;(color-theme-clarity)
;;(color-theme-retro-green)
;;(color-theme-sitaramv-solaris)
;;(color-theme-arjen)
;;(color-theme-raspopovic)
  
;;(require 'color-theme-mods)
;;(color-theme-billc)
;;(require 'color-theme-billc)
;;(color-theme-billc)
;;(set-cursor-color 'cyan)

;;(color-theme-djcb-dark)
  
;;(require 'zenburn)
;;(color-theme-zenburn)
;;(load-file "~/.emacs.d/elib/color-theme-twilight.el")
;;(color-theme-twilight)
;;(load-file "~/.emacs.d/elib/color-theme-wombat.el")
;;(color-theme-wombat)

;; (set-cursor-color 'white)
;; (add-to-list 'default-frame-alist
;; 			   '(cursor-type .bar))

(provide 'jcm-emacs-23)
