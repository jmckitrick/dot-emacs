;;; -*- mode: emacs-lisp; -*-

(use-package ivy :ensure t
  :diminish ivy-mode)

(ivy-mode)
(setq ivy-use-virtual-buffers nil)
(setq ivy-count-format "(%d/%d) ")
(setq projectile-completion-system 'ivy)
(global-set-key (kbd "C-x C-m") 'counsel-M-x)

(global-set-key (kbd "C-c C-r") 'ivy-resume) ; conflicts in clojure mode - change me
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(global-set-key (kbd "C-s") 'swiper)

(global-set-key (kbd "C-c s") 'swiper-thing-at-point)

(provide 'init-ivy)

;; (use-package selectrum :ensure t)
;; (selectrum-mode +1)
;; (use-package selectrum-prescient :ensure t)
;; (selectrum-prescient-mode +1)
