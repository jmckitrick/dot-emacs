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

;;(require 'apex-mode)

;;; Keymaps

;;; Hooks

(provide 'jcm-work)
