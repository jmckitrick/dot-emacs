(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-ubiquitous-function-overrides
   (quote
    ((disable exact "read-file-name")
     (disable exact "read-file-name-internal")
     (disable exact "read-buffer")
     (disable exact "gnus-emacs-completing-read")
     (disable exact "gnus-iswitchb-completing-read")
     (disable exact "grep-read-files")
     (disable exact "magit-builtin-completing-read")
     (enable exact "bookmark-completing-read")
     (enable-old exact "webjump-read-choice")
     (enable-old exact "webjump-read-url-choice")
     (disable exact "isearchp-read-unicode-char")
     (enable exact "read-char-by-name")
     (disable exact "Info-read-node-name")
     (disable exact "tmm-menubar")
     (enable exact "imenu--completion-buffer")
     (enable-old exact "auto-insert")
     (enable exact "project--completing-read-strict"))))
 '(kill-whole-line t)
 '(package-selected-packages
   (quote
    (clj-refactor cider which-key wgrep-ag web-mode smex rainbow-delimiters projectile paredit magit macrostep ido-vertical-mode ido-ubiquitous guide-key flx-ido etags-select company-quickhelp color-theme avy ag)))
 '(solarized-italic nil)
 '(tooltip-mode nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
