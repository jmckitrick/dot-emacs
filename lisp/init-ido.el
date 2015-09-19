(require 'ido-vertical-mode)
(require 'flx-ido)

(ido-mode 1)
(ido-mode 'both)
(ido-vertical-mode)
(ido-everywhere 1)
(flx-ido-mode 1)

;(setq ido-enable-flex-matching t)
;(setq ido-use-faces t)
;(require 'ido-ubiquitous)
;(ido-ubiquitous-mode 1)

(provide 'init-ido)
