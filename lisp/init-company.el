(require 'company)
(require 'company-quickhelp)

(setq company-idle-delay 0.01
      company-show-numbers t
      company-tooltip-limit 10
      company-tooltip-align-annotations t
      company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-selection-changed t
      company-tooltip-flip-when-above nil
      company-require-match nil
      company-quickhelp-max-lines 60
      pos-tip-border-width 0)

(company-quickhelp-mode 1)
(global-company-mode 1)

;(add-to-list 'company-dabbrev-code-modes 'clojure-mode)

;;(add-hook 'ruby-mode-hook 'company-mode)
;(add-hook 'clojure-mode-hook 'company-mode)
;(push 'company-robe company-backends)

(provide 'init-company)
