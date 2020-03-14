;;; -*- mode: emacs-lisp; -*-

(defun jcm-setup-apex-settings ()
  (interactive)
  ;(require 'jcm-web)
  (jcm-setup-web-settings)
  (global-auto-revert-mode))

(defun jcm-dump-mm-raw-str (raw)
  (let ((buffer-name "*mm-raw-buffer*"))
    (get-buffer-create buffer-name)
    ;(set-buffer buffer-name)
    (with-current-buffer buffer-name
      (erase-buffer)
      (insert raw))))

(defun jcm-dump-mm-result-str (result)
  (let ((buffer-name "*mm-buffer*"))
    (get-buffer-create buffer-name)
    ;;(set-buffer buffer-name)
    (with-current-buffer buffer-name
      (erase-buffer)
      (insert result))))

(defun jcm-create-sf-project (project username password orgtype)
  (interactive "sProject: \nsUsername: \nsPassword: \nsOrgtype: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list
                                                  ;;(cons 'directories ["classes"])
                                                  ;;(cons 'package )
                                                  (cons 'project_name project)
                                                  (cons 'username username)
                                                  (cons 'password password)
                                                  (cons 'org_type orgtype)))))
    (jcm-do-sf-operation "new_project" temp-filename)))

(defun jcm-create-sf-project-fast (project username password orgtype)
  (interactive "sProject: \nsUsername: \nsPassword: \nsOrgtype: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list
                                                  ;;(cons 'directories ["classes"])
                                                  ;;(cons 'package )
                                                  (cons 'name project)
                                                  (cons 'workspace "/Users/jmckitrick/Documents/mmworkspace/")
                                                  (cons 'username username)
                                                  (cons 'password password)
                                                  (cons 'org_type orgtype)))))
    (jcm-do-sf-operation-fast "new-project" temp-filename)))

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
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'project_name project)))))
    (jcm-do-sf-operation "compile_project" temp-filename)))

(defun jcm-compile-sf-project-fast (project)
  (interactive "sProject: ")
  (let ((temp-filename (jcm-create-sf-stdin-file (list (cons 'name project)))))
    (jcm-do-sf-operation-fast "compile-project" temp-filename)))

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
      (goto-char (point-min))
      (let* ((start-of-json (search-forward "{"))
             (json-content (buffer-substring-no-properties (- start-of-json 1) (point-max)))
             (response (json-read-from-string json-content)))
        (jcm-dump-mm-result-str json-content)
        (jcm-extract-sf-body response)
        (if (eql (cdr (assoc 'success response)) json-false)
            (let ((messages (cdr (assoc 'Messages response))))
              (if (> (length messages) 0)
                  (let ((err (aref messages 0)))
                    (message "SF error: %s:%s - %s"
                             (cdr (assoc 'fileName err))
                             (cdr (assoc 'lineNumber err))
                             (cdr (assoc 'problem err)))))))))))

(defun jcm-do-sf-operation-fast (operation temp-filename)
  (require 'json)
  (with-temp-buffer
    (message temp-filename)
    ;;(call-process "cd" nil t t (concat "/Users/jmckitrick/Documents/mmworkspace/" project))
    (call-process "mavensmate" temp-filename t t operation)
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
    (visit-tags-table (concat "/Users/jmckitrick/Documents/workspace/" (upcase project-tags-filename)) t))
  (message "Done loading apex tags."))

(defun jcm-setup-web-settings ()
  (require 'etags-select)
  (global-set-key "\M-." 'etags-select-find-tag-at-point)
  (global-set-key (kbd "M-,") 'pop-tag-mark)

  ;;(define-key ac-complete-mode-map "\t" 'ac-complete)
  ;;(define-key ac-complete-mode-map "\r" nil)
  ;;(add-to-list 'completion-at-point-functions 'semantic-com)

  ;(define-key sgml-mode-map (kbd "<f16>") 'php-mode)
  ;(define-key sgml-mode-map (kbd "C-<left>") 'sgml-skip-tag-backward)
  ;(define-key sgml-mode-map (kbd "C-<right>") 'sgml-skip-tag-forward)

  ;;(define-key global-map (kbd "C-<f16>") 'javascript-mode)
  ;(define-key sgml-mode-map (kbd "C-<f16>") 'javascript-mode)
  )

(add-to-list 'auto-mode-alist '("\\.\\(cls\\|trigger\\)" . java-mode))

(add-hook 'java-mode-hook
          (lambda ()
            (jcm-setup-apex-settings)))

(provide 'init-apex)
