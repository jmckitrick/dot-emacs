;;; -*- mode: emacs-lisp; -*-
 
(defun color-theme-djcb-dark ()
  "Dark color theme created by djcb, Jan. 2009."
  (interactive)
  (color-theme-install
   '(color-theme-djcb-dark
     ((foreground-color . "#a9eadf")
      (background-color . "black") 
      (background-mode . dark))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (default ((t (nil))))
       
     (font-lock-builtin-face ((t (:foreground "#a96da0"))))
     ;;(font-lock-builtin-face ((t (:italic t :foreground "#a96da0"))))
     (font-lock-comment-face ((t (:foreground "#bbbbbb"))))
     ;;(font-lock-comment-face ((t (:italic t :foreground "#bbbbbb"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#666666"))))
     (font-lock-constant-face ((t (:bold t :foreground "#197b6e"))))
     (font-lock-doc-string-face ((t (:foreground "#3041c4"))))
     (font-lock-doc-face ((t (:foreground "gray"))))
     (font-lock-reference-face ((t (:foreground "white"))))
     (font-lock-function-name-face ((t (:foreground "#356da0"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#bcf0f1"))))
     (font-lock-preprocessor-face ((t (:foreground "#e3ea94"))))
     (font-lock-string-face ((t (:foreground "#ffffff"))))
     (font-lock-type-face ((t (:bold t :foreground "#364498"))))
     (font-lock-variable-name-face ((t (:foreground "#7685de"))))
     (font-lock-warning-face ((t (:bold t :underline nil :foreground "yellow"))))
     ;;(font-lock-warning-face ((t (:bold t :italic nil :underline nil 
     ;;                              :foreground "yellow"))))
     (hl-line ((t (:background "#112233"))))
     (mode-line ((t (:foreground "#ffffff" :background "#333333"))))
     (region ((t (:foreground nil :background "#555555"))))
     (show-paren-match-face ((t (:bold t :foreground "#ffffff" 
                                       :background "#050505")))))))

(defun color-theme-dark-bliss ()
  "Another dark theme."
  (interactive)
  (color-theme-install
   '(color-theme-dark-bliss
     ((foreground-color . "#eeeeee")
      (background-color . "#001122")
      (background-mode . dark)
      (cursor-color . "#ccffcc"))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (default ((t (nil))))

     (font-lock-builtin-face ((t (:foreground "#f0f0aa"))))
     ;;(font-lock-comment-face ((t (:italic t :foreground "#aaccaa"))))
     (font-lock-comment-face ((t (:foreground "#aaccaa"))))
     (font-lock-delimiter-face ((t (:foreground "#aaccaa"))))
     (font-lock-constant-face ((t (:bold t :foreground "#ffaa88"))))
     (font-lock-doc-string-face ((t (:foreground "#eeccaa"))))
     (font-lock-doc-face ((t (:foreground "#eeccaa"))))
     (font-lock-reference-face ((t (:foreground "#aa99cc"))))
     (font-lock-function-name-face ((t (:foreground "#ffbb66"))))
     (font-lock-keyword-face ((t (:foreground "#ccffaa"))))
     (font-lock-preprocessor-face ((t (:foreground "#aaffee"))))
     (font-lock-string-face ((t (:foreground "#bbbbff")))))))

(provide 'jcm-themes)
