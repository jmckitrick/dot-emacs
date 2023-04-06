;;; -*- mode: emacs-lisp; -*-

(use-package cl-lib)

(defun match-system-name (target-name)
  (interactive)
  (let ((result (string-match target-name (system-name))))
    (and (cl-typep result 'integer)
         (>= result 0))))

(cl-defun is-home-machine (&optional force)
  (interactive)
  (or force
      (match-system-name "jcm")))

(cl-defun is-work-machine (&optional force)
  (interactive)
  (or force
      (match-system-name "dtd")))

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

(defun load-customize-file (filename)
  (setq custom-file (concat user-emacs-directory filename))
  (load custom-file))

(provide 'init-util)
