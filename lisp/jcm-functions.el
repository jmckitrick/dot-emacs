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

(defun jcm-setup-apex-settings ()
  (interactive)
  (require 'jcm-web)
  (jcm-setup-web-settings)
  (global-auto-revert-mode))

(defun x0jcm-compile-sf-project0 ()
  (interactive)
  (require 'json)
  ;;(cd "/Users/jmckitrick/mmworkspace/")
  (get-buffer-create "test-buffer")
  (set-buffer "test-buffer")
  (erase-buffer)
  (let ((temp-filename (make-temp-file "mm"))
        (stdin-content (json-encode '((project_name . "PUB")
                                      (username . "publiced@endeavormgmt.com.devjm")
                                      (password . "EndGelb14")
                                      (directories . ["classes"])))))
    (with-temp-file temp-filename (insert stdin-content))
    (call-process "python" temp-filename "test-buffer" t "/Users/jmckitrick/loc/mm/mm.py" "-o" "compile_project" "-c" "EMACS"))
  (let ((response (json-read-from-string (buffer-string))))
    (if (cdr (assoc 'success response))
        (let ((err (aref (cdr (assoc 'Messages response)) 0)))
          (message "SF error: !%s : %s" (cdr (assoc 'fileName err)) (cdr (assoc 'problem err))))
      (message (cdr (assoc 'body response))))))

(defun jcm-dump-mm-raw-str (raw)
  (let ((buffer-name "*mm-raw-buffer*"))
    (get-buffer-create buffer-name)
    (set-buffer buffer-name))
  (erase-buffer)
  (insert raw))

(defun jcm-dump-mm-result-str (result)
  (let ((buffer-name "*mm-buffer*"))
    (get-buffer-create buffer-name)
    (set-buffer buffer-name))
  (erase-buffer)
  (insert result))

(defun jcm-compile-froedtert ()
  (interactive)
  (jcm-compile-sf-project "FRO.production" "froedtert@endeavormgmt.com" "EndGelb14"))

(defun jcm-compile-menninger ()
  (interactive)
  (jcm-compile-sf-project "MEN" "menninger@endeavormgmt.com.dev" "EndGelb14"))

(defun x1jcm-compile-sf-project1 (project username password)
  (interactive "sProject: \nsUsername: \nsPassword: ")
  (require 'json)
  (let ((temp-filename (make-temp-file "mm"))
        (stdin-content (json-encode (list (cons 'project_name project)
                                          (cons 'username username)
                                          (cons 'password password)
                                          (cons 'directories ["classes"])))))
    (with-temp-file temp-filename (insert stdin-content))
    (with-temp-buffer
      (call-process "python" temp-filename t t "/Users/jmckitrick/loc/mm/mm.py" "-o" "compile_project" "-c" "EMACS")
      (let ((response (json-read-from-string (buffer-string))))
        (jcm-dump-mm-result-str (buffer-string))
        (if (eql (cdr (assoc 'success response)) json-false)
            (let ((err (aref (cdr (assoc 'Messages response)) 0)))
              (message "SF error: %s:%s - %s"
                       (cdr (assoc 'fileName err))
                       (cdr (assoc 'lineNumber err))
                       (cdr (assoc 'problem err))))
          (let ((body (cdr (assoc 'body response))))
            (if (> (length body) 0)
                (message body)
              (message "SF Success"))))))))

(defun jcm-create-sf-project (project username password orgtype)
  (interactive "sProject: \nsUsername: \nsPassword: \nsOrgtype: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       (cons 'username username)
                                                       (cons 'password password)
                                                       (cons 'org_type orgtype)
                                                       ;;(cons 'directories ["classes"])
                                                       ;;(cons 'package )
                                                       ))))
    (jcm-do-sf-operation "new_project" temp-filename)))

(defun jcm-refresh-sf-project (project)
  (interactive "sProject: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       (cons 'directories (vector "classes" "pages"))
                                                       ;(cons 'files (vector files))
                                                       ))))
    (jcm-do-sf-operation "refresh" temp-filename)))

(defun jcm-create-sf-metadata (project metadata-type api-name)
  (interactive "sProject: \nsMetadata type: \nsAPI name: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       (cons 'metadata_type metadata-type)
                                                       (cons 'params (list (cons'api_name api-name)))
                                                       (cons 'github_template (list (cons 'author "J McKitrick")
                                                                                    (cons 'description "Default class")
                                                                                    (cons 'name "Default")
                                                                                    (cons 'file_name "ApexClass.cls")))))))
    (jcm-do-sf-operation "new_metadata" temp-filename)))

(defun jcm-compile-sf-project (project)
  (interactive "sProject: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       ))))
    (jcm-do-sf-operation "compile_project" temp-filename)))

(defun jcm-compile-sf-file (project)
  (interactive "sProject: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       (cons 'files (vector (file-truename buffer-file-name)))))))
    (jcm-do-sf-operation "compile_project" temp-filename)))

(defun jcm-test-sf-project (project)
  (interactive "sProject: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       (cons 'run_all_tests "true")))))
    (jcm-do-sf-operation "test" temp-filename)))

(defun jcm-coverage-sf-project (project)
  (interactive "sProject: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)))))
    (jcm-do-sf-operation "code_coverage_report" temp-filename)))

(defun jcm-session-sf-project (project username password orgtype)
  (interactive "sProject: \nsUsername: \nsPassword: \nsOrgtype: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)
                                                       (cons 'username username)
                                                       (cons 'password password)
                                                       (cons 'org_type orgtype)
                                                       ))))
    (jcm-do-sf-operation "get_active_session" temp-filename)))

(defun jcm-create-sf-stdin-file (content)
  (require 'json)
  (let ((temp-filename (make-temp-file "mm"))
        (stdin-content (json-encode content)))
    (with-temp-file temp-filename (insert stdin-content))
    temp-filename))

(defun jcm-do-sf-operation (operation temp-filename)
  (require 'json)
  (with-temp-buffer
    (call-process "python" temp-filename t t "/Users/jmckitrick/devel/mm/mm.py" "-o" operation "-c" "EMACS")
    (let ((raw-response (buffer-string)))
      (jcm-dump-mm-raw-str raw-response)
      (let ((response (json-read-from-string raw-response)))
        (jcm-dump-mm-result-str (buffer-string))
        (jcm-extract-sf-body response)
        (if (eql (cdr (assoc 'success response)) json-false)
            (let ((messages (cdr (assoc 'Messages response))))
              (if (> (length messages) 0)
                  (let ((err (aref messages 0)))
                    (message "SF error: %s:%s - %s"
                             (cdr (assoc 'fileName err))
                             (cdr (assoc 'lineNumber err))
                             (cdr (assoc 'problem err)))))))))))

(defun jcm-extract-sf-body (response)
  (let ((body (cdr (assoc 'body response))))
    (if (> (length body) 0)
        (message body)
      (message "SF Success"))))

(provide 'jcm-functions)
