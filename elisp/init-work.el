(require 'init-util)

;(require 'jcm-web)
;;(jcm-setup-web-settings)

;; This has been working
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

(defun setup-react ()
  (rjsx-mode)
  (flycheck-mode)
  (eldoc-mode)
  ;(tide-setup)
  ;(tide-hl-identifier-mode +1)
  ;(message "Ready to React!")
  )

(use-package ensime
  :bind (:map ensime-mode-map ("M-." . ensime-edit-definition)))
;; This is the original before use-package.
;;(define-key ensime-mode-map (kbd "M-.") 'ensime-edit-definition)

;;(setq ensime-sbt-command "/usr/local/bin/sbt")
;; But try this
;;(setq ensime-sbt-command "/usr/local/sbt13/sbt.sh")
;;(setq ensime-server-version "2.0.0-graph-SNAPSHOT")
;;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;;(add-hook 'scala-mode-hook 'rainbow-delimiters-mode)

;; Should these be *-foo-mode-hook instead?
(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-react))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-react))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-react))

;; (defadvice web-mode-highlight-part (around tweak-jsx-activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))
;;(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
;;(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

(autoload 'enable-paredit-mode "paredit" "..." t)

;(enable-paredit-mode)

(use-package autopair
  :diminish pair
  :hook scala-mode-hook)
;;(add-hook 'scala-mode-hook 'autopair-mode)
;;(add-hook 'scala-mode-hook 'enable-paredit-mode)

;(add-hook 'js2-jsx-mode-hook #'company-mode)
;(add-hook 'clojure-mode-hook #'company-mode)
;(add-hook 'c-mode-hook #'company-mode)

;; More stuff to try
;; http://timothypratley.blogspot.com/2015/07/seven-specialty-emacs-settings-with-big.html

;; (defun save-all ()
;;   (interactive)
;;   (save-some-buffers t))
;(add-hook 'focus-out-hook 'save-all)

;(add-hook 'after-init-hook #'global-flycheck-mode)

;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;(set-frame-font "Source Code Pro-16" nil t)

;; ****

(setq
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; (magit-define-popup-switch 'magit-log-popup
;;   ?i "Ignore case in grep" "-i")

(use-package nav-flash
  :config
  (nav-flash-show))

;;(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;; (defadvice magit-status (around magit-fullscreen activate)
;;   (window-configuration-to-register :magit-fullscreen)
;;   ad-do-it
;;   (delete-other-windows))

;; (defun magit-quit-session ()
;;   "Restores the previous window configuration and kills the magit buffer"
;;   (interactive)
;;   (kill-buffer)
;;   (jump-to-register :magit-fullscreen))

(server-start)

;; (use-package git-gutter+
;;   :ensure t
;;   :init (global-git-gutter+-mode)
;;   :config (progn
;;             (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
;;             (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
;;             (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
;;             (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
;;             (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
;;             (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
;;             (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
;;             (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
;;             (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer))
;;   :diminish (git-gutter+-mode . "gg"))

(use-package git-gutter-fringe
  ;;:init (global-git-gutter-mode +1)
  )

(global-set-key (kbd "M-o") 'ace-window)

(provide 'init-work)
