(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  ;; add paths to your local installation of project mgmt tools, like lein
  ;; (setenv "PATH" (concat
  ;;                 "/usr/local/bin" path-separator
  ;;                 (getenv "PATH")))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  :init
  (setq lsp-enable-indentation nil)
  (add-hook 'clojure-mode-hook #'lsp)
  (add-hook 'clojurec-mode-hook #'lsp)
  (add-hook 'clojurescript-mode-hook #'lsp))

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'init-clojure)
