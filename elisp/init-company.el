(use-package company
  :diminish company-mode
  :init
  (global-company-mode 1)
  )

;; (use-package company-quickhelp
;;   :init
;;   (setq company-idle-delay 0.01
;;         company-show-numbers t
;;         company-tooltip-limit 10
;;         company-tooltip-align-annotations t
;;         company-minimum-prefix-length 2
;;         company-selection-wrap-around nil
;;         company-selection-changed t
;;         company-tooltip-flip-when-above nil
;;         company-require-match nil
;;         company-quickhelp-max-lines 60
;;         pos-tip-border-width 2)
;;   :config
;;   ;;(company-quickhelp-mode -1)
;;   (global-company-mode 1)
;;   ;:diminish
;;   ;company
;;   )

(provide 'init-company)
