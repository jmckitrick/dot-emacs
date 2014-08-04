;;; -*- mode: emacs-lisp; -*-

;;; Functions

(defun jcm-visit-apex-tags ()
  "Load apex tags for SF."
  (interactive)
  (message "Visiting apex tags....")
  (visit-tags-table "/Users/jmckitrick/Documents/workspace/")
  (message "Done loading apex tags."))

(defun jcm-visit-jscript-tags ()
  "Load jscript tags for SF."
  (interactive)
  (message "Visiting jscript tags....")
  (visit-tags-table "/Users/jmckitrick/Documents/workspace/JTAGS")
  (message "Done loading jscript tags."))

(defun jcm-visit-project-apex-tags (project)
  "Load apex tags for an apex PROJECT."
  (interactive "sProject: ")
  (jcm-setup-apex-settings)
  (message "Visiting apex tags for %s...." project)
  (let ((project-tags-filename (concat "/TAGS-" project)))
    (visit-tags-table (concat "/Users/jmckitrick/Documents/mmworkspace/" (upcase project-tags-filename)) t))
  (message "Done loading apex tags."))

;;; General
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;;; Keymaps

;;; Hooks
(add-hook 'ruby-mode-hook 'company-mode)

(provide 'jcm-work)
