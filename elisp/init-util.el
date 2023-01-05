;;; -*- mode: emacs-lisp; -*-

(use-package cl-lib)

(defun report-init-results (errors)
  (if (not errors)
      (message "Initialization successful!")
    (message "Errors during init, see buffer *init-errors*")
    (switch-to-buffer "*init-errors*")
    (insert (mapconcat #'identity errors "\n"))))

(defun file-to-feature (file)
  (intern (file-name-nondirectory (s-chop-suffix "\.el" file))))

(defun safe-load-init-files (dir &optional regexp)
  "Require all elisp files in DIR.  When REGEXP is provided match
only those files with name of form REGEXP.el.
REGEXP defaults to ^init-.*\.el$"
  (let* ((regexp (if regexp regexp "^init-.\*\.el\$"))
         (files (directory-files dir t regexp))
         (features (mapcar #'file-to-feature files))
         (init-errors nil))
    (cl-loop for feature in features
          do (condition-case err
                 (load (symbol-name feature))
               (error (push (format "Error requiring %s: %s" feature err)
                            init-errors))))
    (report-init-results init-errors)))

(defun match-system-name (target-name)
  (interactive)
  (let ((result (string-match target-name (system-name))))
    (and (cl-typep result 'integer)
         (>= result 0))))

(cl-defun is-home-machine (&optional force)
  (interactive)
  (or force
      (match-system-name "jcm")
      (match-system-name "jcm-m1")
      (match-system-name "jcm-mac")
      (match-system-name "jcm-mbp")
      ;;(match-system-name "jcm-mac.local")
      (match-system-name "jcm-macbook")))

(cl-defun is-work-machine (&optional force)
  (interactive)
  (or force
      (match-system-name "dtd")
      (match-system-name "jmckitrick-mbp")
      (match-system-name "jonathons-mbp")
      (match-system-name "jonathonsDTDMBP")))

(defun nuke-all-buffers ()
  "Kill all emacs buffers."
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
		  (buffer-list))
  (delete-other-windows))

(defun jcm/edit-startup-file ()
  "Edit the startup file for emacs."
  (interactive)
  (find-file user-init-file))

(defun jcm/dired-elisp ()
  "Open the elisp directory in dired."
  (interactive)
  (find-file jcm/elisp-dir))

(provide 'init-util)
