(require 'init-util)

(when (is-work-machine)
  ;(require 'jcm-web)
  ;(jcm-setup-web-settings)

  ;; This has been working
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

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
  )

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

(magit-define-popup-switch 'magit-log-popup
  ?i "Ignore case in grep" "-i")

(use-package nav-flash
  :config
  (nav-flash-show))

;; (defadvice magit-status (around magit-fullscreen activate)
;;   (window-configuration-to-register :magit-fullscreen)
;;   ad-do-it
;;   (delete-other-windows))

;; (defun magit-quit-session ()
;;   "Restores the previous window configuration and kills the magit buffer"
;;   (interactive)
;;   (kill-buffer)
;;   (jump-to-register :magit-fullscreen))


(provide 'init-work)
