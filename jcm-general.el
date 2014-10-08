;;; -*- mode: emacs-lisp; -*-

;; Stuff we want.
;(line-number-mode t)					; already have this?
(column-number-mode t)
(transient-mark-mode t)
(delete-selection-mode t)
(show-paren-mode 1)
(custom-set-variables
 '(kill-whole-line t)
 '(visible-bell t))

;; Stuff we don't.
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Editing settings.
(setq tab-width 4)            ;could be 4 or 8?
(setq-default indent-tabs-mode nil)
(setq fill-column 80)
(setq c-default-style "bsd"
      c-basic-offset 4
      track-eol t)
(c-set-offset 'case-label '+)

;; Dired settings.
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-deletes 'top)
(setq find-grep-options "-q -i")

;; Other settings.
(fset 'yes-or-no-p 'y-or-n-p)
(iswitchb-mode 1)
(setq enable-local-variables :safe)
;(setq vc-handled-backends nil)          ;'(svn)

;; File/mode associations.
(add-to-list 'auto-mode-alist '("\\.js" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.\\(component\\|page\\)" . html-mode))
(add-to-list 'auto-mode-alist '("css\\.resource" . css-mode))
(add-to-list 'auto-mode-alist '("\\.\\(cls\\|trigger\\)" . java-mode))
(add-to-list 'auto-mode-alist '("\\([Jj]\\)\\([Ss]\\)\\.resource" . javascript-mode))
;;(add-to-list 'auto-mode-alist '("\\.cljs" . clojure-mode))

;;; Experimental

(setq scroll-step 1)
(setq scroll-conservatively 10000)
;(global-linum-mode 1)

;(require 'clojure-mode)
;(require 'clojure-test-mode)
(autoload 'clojure-mode "clojure-mode" t)
(autoload 'clojure-mode-hook "clojure-mode" t)
;(autoload 'clojure-test-mode "clojure-test-mode" t)
;(autoload 'nrepl-jack-in "nrepl" t)
(autoload 'cider-jack-in "cider" t)

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'company-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-display-in-current-window t)
(setq cider-prompt-save-file-on-load nil)
;(setq cider-repl-result-prefix ";; => ")
;(setq cider-interactive-eval-result-prefix ";; => ")

(add-to-list 'vc-handled-backends 'GIT)

;; Switched to company mode, so this might be deprecated.
;(require 'auto-complete)
;(global-auto-complete-mode t)
;(setq ac-auto-start 3)

;(add-to-list 'ac-modes 'enh-ruby-mode)
;(add-to-list 'ac-modes 'web-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'clojure-mode-hook 'company-mode)
;(push 'company-robe company-backends)

;(require 'flymake-ruby)
;(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces t)

(require 'projectile)
(projectile-global-mode)
;(add-hook 'ruby-mode-hook 'projectile-on)

;(require 'robe)
;(add-hook 'ruby-mode-hook 'robe-mode)

(setq save-interprogram-paste-before-kill nil)

;(require 'auto-complete)
;(global-auto-complete-mode t)
;(setq ac-auto-start 3)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;(require 'javadoc-help)
;(require 'recentf)
(require 'magit)

;(require 'cider-browse-ns)
;(eval-after-load 'clojure-mode
;  '(define-key clojure-mode-map (kbd "C-c M-b") 'cider-browse-ns-all))

(provide 'jcm-general)
