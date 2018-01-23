(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-keys (quote (97 111 101 117 104 116 110 115)))
 '(c-basic-offset 2)
 '(cider-prompt-for-symbol nil)
 '(cider-repl-display-in-current-window t t)
 '(company-dabbrev-downcase nil)
 '(ensime-default-java-flags
   (quote
    ("-Xms1G" "-Xmx4G" "-XX:+UseG1GC" "-XX:MaxDirectMemorySize=16384m")))
 '(ensime-eldoc-hints nil)
 '(ensime-graphical-tooltips t)
 '(ensime-inf-cmd-template
   (quote
    (:java "-classpath" :classpath "-Dscala.usejavacp=true" "scala.tools.nsc.MainGenericRunner" "-Xnojline")))
 '(ensime-startup-notification nil)
 '(grep-find-ignored-directories (quote (".svn" ".git" "target")))
 '(inhibit-startup-echo-area-message "devmbp42")
 '(js2-strict-missing-semi-warning nil)
 '(kill-whole-line t)
 '(magit-diff-expansion-threshold 4.0)
 '(magit-refs-sections-hook
   (quote
    (magit-insert-error-header magit-insert-branch-description magit-insert-local-branches magit-insert-remote-branches)))
 '(magit-visit-ref-behavior (quote (checkout-branch)))
 '(max-mini-window-height 8)
 '(org-todo-keywords (quote ((sequence "TODO(t)" "DONE(d)"))))
 '(package-selected-packages
   (quote
    (paredit-everywhere autopair aggressive-indent jsx-mode yesql-ghosts smooth-scrolling diminish magit use-package undo-tree cider counsel which-key avy ivy solarized-theme esup swiper ecb dockerfile-mode rjsx-mode js2-mode react-snippets nav-flash rainbow-delimiters guide-key groovy-mode clojure-mode-extra-font-locking scala-mode yaml-mode wgrep-ag web-mode smex projectile paredit maker-mode macrostep less-css-mode ido-vertical-mode ido-ubiquitous ggtags flx-ido etags-select ensime company-quickhelp color-theme-solarized ag)))
 '(projectile-tags-command "etags *.c")
 '(scala-indent:align-parameters t)
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-italic nil)
 '(solarized-use-less-bold t)
 '(solarized-use-variable-pitch nil)
 '(tooltip-mode nil)
 '(visible-bell t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(which-key-popup-type (quote minibuffer))
 '(yas-snippet-dirs
   (quote
    ("/Users/devmbp42/.emacs.d/snippets" "/Users/devmbp42/.emacs.d/elpa/yasnippet-20180102.1824/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ensime-implicit-highlight ((t nil))))
