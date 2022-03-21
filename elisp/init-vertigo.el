;;; -*- mode: emacs-lisp; -*-

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :config
  (advice-add #'vertico--setup :after
              (lambda (&rest _)
                (setq-local completion-auto-help nil
                            completion-show-inline-help nil)))
  :bind ((:map minibuffer-local-map
               ("C-c C-o" . embark-export)
               ("C-l" . embark-act))))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t
        completion-cycle-threshold 3
        ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
        read-extended-command-predicate
        #'command-completion-default-include-p
        ;; Enable indentation+completion using the TAB key.
        ;; `completion-at-point' is often bound to M-TAB.
        tab-always-indent 'complete))

(use-package consult
  :init
  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

  :hook (completion-list-mode . consult-preview-at-point-mode)

  :config
  ;; Optionally configure a function which returns the project root directory
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project)))))

  :bind (("C-x t" . consult-line)       ; jcm mod
         ("M-g M-g" . consult-goto-line)
         ("C-x C-SPC" . consult-global-mark)
         ("C-c C-SPC" . consult-mark)
         ("C-x C-g" . consult-git-grep)))

(use-package embark
  :config
  (add-hook 'embark-post-action-hook #'embark-collect--update-linked)
  (add-hook 'embark-collect-post-revert-hook
            (defun resize-embark-collect-window (&rest _)
              (when (memq embark-collect--kind '(:live :completions))
                (fit-window-to-buffer (get-buffer-window)
                                      (floor (frame-height) 2) 1)))))

(use-package embark-consult
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  :ensure t
  ;; The :init configuration is always executed (Not lazy!)
  :init
  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-commit-predicate nil)   ;; Do not commit selected candidates on next input
  (corfu-quit-at-boundary t)     ;; Automatically quit at word boundary
  (corfu-quit-no-match t)        ;; Automatically quit if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; You may want to enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next))
  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (corfu-global-mode))

;; mpenet config

;; (use-package cider
;;   :diminish
;;   :config
;;   (setq nrepl-log-messages t
;;         cider-font-lock-dynamically nil ; use lsp semantic tokens
;;         cider-eldoc-display-for-symbol-at-point nil ; use lsp
;;         cider-prompt-for-symbol nil)
;;   (add-hook 'cider-repl-mode-hook #'paredit-mode)
;;   ;; use lsp
;;   (add-hook 'cider-mode-hook (lambda () (remove-hook 'completion-at-point-functions #'cider-complete-at-point))))

;; (use-package lsp-mode
;;   :custom
;;   (lsp-completion-provider :none) ;; we use Corfu!

;;   :init
;;   (setq lsp-keymap-prefix "M-l")
;;   (defun mpenet/lsp-mode-setup-completion ()
;;     (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
;;           '(flex))) ;; Configure flex

;;   :hook
;;   ((clojure-mode . lsp)
;;    (clojurec-mode . lsp)
;;    (clojurescript-mode . lsp)
;;    (lsp-completion-mode . mpenet/lsp-mode-setup-completion)
;;    (before-save . lsp-format-buffer))

;;   :bind (:map lsp-mode-map
;;               ("M-l M-l" . lsp-execute-code-action)
;;               ("M-j d" . lsp-find-definition)
;;               ("M-j M-d" . lsp-find-definition)
;;               ("M-j r" . lsp-find-references)
;;               ("M-j M-r" . lsp-find-references))

;;   :config
;;   (dolist (m '(clojure-mode
;;                clojurec-mode
;;                clojurescript-mode
;;                clojurex-mode))
;;     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
;;   (setq cljr-add-ns-to-blank-clj-files nil
;;         lsp-enable-indentation nil
;;         lsp-headerline-breadcrumb-enable nil
;;         lsp-signature-auto-activate nil
;;         lsp-semantic-tokens-enable t
;;         ;; after last buffer closed, kill workspace
;;         lsp-keep-workspace-alive nil)

;;   :custom-face
;;   (lsp-face-semhl-namespace  ((t :inherit font-lock-type-face :weight normal)))
;;   (lsp-face-semhl-definition  ((t :inherit font-lock-function-name-face :weight normal))))

;; (use-package lsp-ui
;;   :after lsp-mode
;;   :commands lsp-ui-mode
;;   :config
;;   (setq lsp-ui-peek-list-width 60
;;         lsp-ui-doc-max-width 60
;;         lsp-ui-doc-enable nil
;;         lsp-ui-peek-fontify 'always
;;         lsp-ui-sideline-show-code-actions nil))

;; (use-package lsp-treemacs
;;   :config
;;   (setq lsp-treemacs-error-list-current-project-only t))

;; (use-package consult-lsp)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)

(use-package cider
  :hook
  (cider-mode . (lambda () (setq-local completion-styles '(basic))))
  (cider-repl-mode . (lambda () (setq-local completion-styles '(basic)))))

(provide 'init-vertigo)
