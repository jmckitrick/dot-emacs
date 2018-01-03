;; (require 'ido-vertical-mode)
;; (require 'flx-ido)

;; (ido-mode 1)
;; (ido-vertical-mode 1)
;; (ido-everywhere 1)
;; (setq ido-enable-flex-matching t)
;; (flx-ido-mode -1)

;; ;; flx-ido and ido-hacks might be more performants
;; (require 'ido-completing-read+)
;; (ido-ubiquitous-mode 1)
;; ;;(setq ido-cr+-force-on-functional-collection nil)

;; ;; C-n/p is more intuitive in vertical layout
;; (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

;; (add-to-list 'ido-ignore-files "\\.DS_Store")

(ivy-mode)
(setq magit-completing-read-function 'ivy-completing-read)
(setq projectile-completion-system 'ivy)

;;(setq ivy-use-virtual-buffers nil)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-x C-m") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)

(provide 'init-ido)
