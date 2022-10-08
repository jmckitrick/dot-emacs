;;; -*- mode: emacs-lisp; -*-

(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action #'projectile-dired))

(use-package web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(add-hook 'sgml-mode-hook 'emmet-mode)

(use-package magit
  :ensure t
  :bind (("C-c g" . magit-file-dispatch)))

;;;; XXX TODO clean this up
;;;; Everything below this line is being evaluated
;;;; and should eventually be moved to the appropriate module.

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(windmove-default-keybindings)          ;conflicts with org mode?

;; Enable emoji! 💩
(set-fontset-font
 t 'emoji '("Apple Color Emoji" . "iso10646-1") nil 'prepend)

(setq
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] #'easy-kill)
  (global-set-key [remap mark-sexp] #'easy-mark))

(global-diff-hl-mode 1)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; (use-package browse-kill-ring
;;   :ensure t
;;   :config
;;   (browse-kill-ring-default-keybindings))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(global-set-key (kbd "C-x C-b") #'ibuffer)

(setq tab-always-indent 'complete)

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode +1)
  (diminish 'volatile-highlights-mode))

(setq
 initial-scratch-message nil
 initial-major-mode 'fundamental-mode
 )

;(require 'which-func)
;;(add-to-list 'which-func-modes 'org-mode)
;(which-func-mode 1)

;; move-text?
;; selectrum?

;; replace ivy/swiper/counsel
;; with
;; vertico
;; consult
;; embark
;; orderless
;; marginalia
;; corfu
;; (consult-customize
;;     consult-ripgrep consult-git-grep consult-grep
;;     consult-bookmark consult-xref
;;     consult--source-bookmark
;;     :preview-key '(:debounce 0.25 any))

(use-package restclient
  :ensure t
  :mode (("\\.http$" . restclient-mode)))

(provide 'init-misc)
