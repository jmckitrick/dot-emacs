;;; -*- mode: emacs-lisp; -*-

(defun jcm-edit-startup-file ()
  "Edit the startup file for emacs."
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))

(defun jcm-dired-elisp ()
  "Open the elisp directory in dired."
  (interactive)
  (find-file jcm-elisp-dir))

(defun match-system-name (target-name)
  (interactive)
  (let ((result (string-match target-name system-name)))
    (and (cl-typep result 'integer)
         (>= result 0))))

(defun match-system-configuration (target-configuration)
  (interactive)
  (let ((result (string-match target-configuration system-configuration)))
    (and (cl-typep result 'integer)
         (>= result 0))))

(cl-defun is-home-machine (&optional force)
  (interactive)
  (or force
      (match-system-name "jcm-macbook")
      (match-system-name "jonathons-mbp")))

(cl-defun is-work-machine (&optional force)
  (interactive)
  (or force
      (match-system-name "jmckitrick-mbp")))

(defun jcm-irc ()
  "Start IRC for a freenode session."
  (interactive)
  (erc-select :server "irc.freenode.net"
              :port 6667
              :nick "jmckitrick"
              :full-name "Jonathon McKitrick"))

(defun nuke-all-buffers ()
  "Kill all emacs buffers."
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
		  (buffer-list))
  (delete-other-windows))

(defun copy-word (&optional arg)
  "Copy word at point into kill-ring."
  (interactive "P")
  (let ((beg (progn
               (if (looking-back "[a-zA-Z0-9]" 1)
                   (backward-word 1))
               (point)))
        (end (progn
               (forward-word arg)
               (point))))
    (copy-region-as-kill beg end)
    (backward-word 1)
    (message "Copied word.")))

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis AND last command is a movement command, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (message "%s" last-command)
  (if (not (memq last-command '(
                                set-mark
                                cua-set-mark
                                goto-match-paren
                                down-list
                                up-list
                                end-of-defun
                                beginning-of-defun
                                backward-sexp
                                forward-sexp
                                backward-up-list
                                forward-paragraph
                                backward-paragraph
                                end-of-buffer
                                beginning-of-buffer
                                backward-word
                                forward-word
                                mwheel-scroll
                                backward-word
                                forward-word
                                mouse-start-secondary
                                mouse-yank-secondary
                                mouse-secondary-save-then-kill
                                move-end-of-line
                                move-beginning-of-line
                                backward-char
                                forward-char
                                scroll-up
                                scroll-down
                                scroll-left
                                scroll-right
                                mouse-set-point
                                next-buffer
                                previous-buffer
                                next-line
                                )))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
          (t (self-insert-command (or arg 1))))))

(defun jcm-tags-search-at-point ()
  "Search tags file for symbol under point."
  (interactive)
  (let ((tag (find-tag-default)))
    (when tag
      (tags-search tag))))

(defun set-clojure-prod-env ()
  (interactive)
  (setenv "DATABASE_URL" "postgresql://jcm:none@localhost:5432/insperity-webhook"))

(provide 'jcm-functions)
