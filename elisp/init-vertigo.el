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
  :bind (("C-c o" . embark-export)
         ("C-c e" . embark-act)))

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

  (setq enable-recursive-minibuffers t
        completion-cycle-threshold 3
        ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
        read-extended-command-predicate #'command-completion-default-include-p
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
         ("C-x C-y" . consult-yank-from-kill-ring)
         ("M-y" . consult-yank-pop)
         ("M-g M-g" . consult-goto-line)
         ("C-c C-SPC" . consult-mark)
         ("M-g m" . consult-mark)
         ("C-x C-SPC" . consult-global-mark)
         ("C-x C-g" . consult-git-grep)
         ("C-x b" . consult-buffer)
         ("C-x r b" . consult-bookmark)
         :map isearch-mode-map
         ("C-x t" . consult-line)))

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
  (global-corfu-mode))

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x m") 'execute-extended-command)

(use-package cider
  :hook
  (cider-mode . (lambda () (setq-local completion-styles '(basic))))
  (cider-repl-mode . (lambda () (setq-local completion-styles '(basic)))))

(provide 'init-vertigo)
