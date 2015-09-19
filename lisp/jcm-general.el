;;; -*- mode: emacs-lisp; -*-

;; File/mode associations.
;(add-to-list 'auto-mode-alist '("\\.js" . javascript-mode))
;(add-to-list 'auto-mode-alist '("\\.\\(component\\|page\\)" . html-mode))
;(add-to-list 'auto-mode-alist '("css\\.resource" . css-mode))
;(add-to-list 'auto-mode-alist '("\\.\\(cls\\|trigger\\)" . java-mode))
;(add-to-list 'auto-mode-alist '("\\([Jj]\\)\\([Ss]\\)\\.resource" . javascript-mode))
;;(add-to-list 'auto-mode-alist '("\\.cljs" . clojure-mode))

;;; Experimental

;(add-to-list 'vc-handled-backends 'GIT)

;(require 'flymake-ruby)
;(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'projectile)
(projectile-global-mode)
;(add-hook 'ruby-mode-hook 'projectile-on)

;(require 'robe)
;(add-hook 'ruby-mode-hook 'robe-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/magit/lisp"))
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

;(require 'cider-browse-ns)
;(eval-after-load 'clojure-mode
;  '(define-key clojure-mode-map (kbd "C-c M-b") 'cider-browse-ns-all))

(require 'linum)
(global-linum-mode)

(provide 'jcm-general)
