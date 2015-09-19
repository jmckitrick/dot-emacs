;;; -*- mode: emacs-lisp; -*-

(add-to-list 'vc-handled-backends 'GIT)

(require 'projectile)
(projectile-global-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/magit/lisp"))
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'linum)
(global-linum-mode)

(defun jcm-edit-startup-file ()
  "Edit the startup file for emacs."
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))

(defun jcm-dired-elisp ()
  "Open the elisp directory in dired."
  (interactive)
  (find-file jcm-elisp-dir))

(defun jcm-irc ()
  "Start IRC for a freenode session."
  (interactive)
  (erc-select :server "irc.freenode.net"
              :port 6667
              :nick "jmckitrick"
              :full-name "Jonathon McKitrick"))


(provide 'init-misc)
