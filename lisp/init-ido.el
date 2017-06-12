(require 'ido-vertical-mode)
;(require 'ido-hacks)
(require 'flx-ido)

(ido-mode 1)
(ido-vertical-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(flx-ido-mode 1)

;; flx-ido and ido-hacks might be more performants
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)
;;(setq ido-cr+-force-on-functional-collection nil)

;; C-n/p is more intuitive in vertical layout
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(add-to-list 'ido-ignore-files "\\.DS_Store")

(provide 'init-ido)
