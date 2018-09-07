(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(avy-keys (quote (97 111 101 117 104 116 110 115)))
 '(c-basic-offset 2)
 '(cider-prompt-for-symbol nil)
 '(cider-repl-display-in-current-window t)
 '(company-dabbrev-downcase nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ensime-default-java-flags
   (quote
    ("-Xms1G" "-Xmx4G" "-XX:+UseG1GC" "-XX:MaxDirectMemorySize=16384m")))
 '(ensime-eldoc-hints nil)
 '(ensime-graphical-tooltips t)
 '(ensime-implicit-gutter-icons nil)
 '(ensime-inf-cmd-template
   (quote
    (:java "-classpath" :classpath "-Dscala.usejavacp=true" "scala.tools.nsc.MainGenericRunner" "-Xnojline")))
 '(ensime-startup-notification nil)
 '(fci-rule-color "#073642")
 '(grep-find-ignored-directories (quote (".svn" ".git" "target")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(inhibit-startup-echo-area-message "devmbp42")
 '(ivy-use-virtual-buffers nil)
 '(js2-strict-missing-semi-warning nil)
 '(kill-whole-line t)
 '(magit-diff-expansion-threshold 4.0)
 '(magit-diff-use-overlays nil)
 '(magit-refs-sections-hook
   (quote
    (magit-insert-error-header magit-insert-branch-description magit-insert-local-branches magit-insert-remote-branches)))
 '(magit-visit-ref-behavior (quote (checkout-branch)))
 '(max-mini-window-height 8)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-todo-keywords (quote ((sequence "TODO(t)" "DONE(d)"))))
 '(package-selected-packages
   (quote
    (diff-hl git-gutter+ git-gutter-fringe cider projectile-ripgrep nav neotree haskell-mode paredit-everywhere autopair aggressive-indent jsx-mode smooth-scrolling diminish magit use-package undo-tree counsel which-key avy ivy solarized-theme esup swiper ecb dockerfile-mode rjsx-mode js2-mode react-snippets nav-flash rainbow-delimiters guide-key groovy-mode clojure-mode-extra-font-locking scala-mode yaml-mode wgrep-ag web-mode smex projectile paredit maker-mode macrostep less-css-mode ido-vertical-mode ido-ubiquitous ggtags flx-ido etags-select ensime company-quickhelp color-theme-solarized ag)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(projectile-tags-command "etags *.c")
 '(scala-indent:align-parameters t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-italic nil)
 '(solarized-use-less-bold t)
 '(solarized-use-variable-pitch nil)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tooltip-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ff7f00")
     (60 . "#ffbf00")
     (80 . "#b58900")
     (100 . "#ffff00")
     (120 . "#ffff00")
     (140 . "#ffff00")
     (160 . "#ffff00")
     (180 . "#859900")
     (200 . "#aaff55")
     (220 . "#7fff7f")
     (240 . "#55ffaa")
     (260 . "#2affd4")
     (280 . "#2aa198")
     (300 . "#00ffff")
     (320 . "#00ffff")
     (340 . "#00ffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(visible-bell t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(which-key-popup-type (quote minibuffer))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"])
 '(yas-snippet-dirs
   (quote
    ("/Users/devmbp42/.emacs.d/snippets" "/Users/devmbp42/.emacs.d/elpa/yasnippet-20180102.1824/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ensime-implicit-highlight ((t nil))))
