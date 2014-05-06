;;; -*- mode: emacs-lisp; -*-

(defun jcm-set-carbon-prefs (config)
  "Set up emacs for carbon.
Possible CONFIG values:
small  = skinny, max height for MacBook
fat    = short and fat for MacBook
chunky = short and wider
pairs  = short and fat for MacBook
tall   = centered, max height for Cinema
wide   = two panes, max height for Cinema
wider  = two panes, max height for Pro
widest = three panes, max height for Cinema
pro    = three panes, max height for Pro
eyes   = one pane, max height for Pro, large font"
  (cl-flet ((set-dims (width height left top)
                      ;;(setq initial-frame-alist (list width height left top))
                      ;;(setq default-frame-alist (list width height left top))
                      (set-frame-position (selected-frame) (cdr left) (cdr top))
                      (set-frame-size (selected-frame) (cdr width) (cdr height))))
	(let ((width-one '(width . 96))     ; 88
		  (width-two '(width . 180))
		  (width-three '(width . 210))
		  (width-full '(width . 270))
		  (width-eyes '(width . 160))
		  (height-small '(height . 49)) ; 47
		  (height-tall '(height . 73))
		  (left-full '(left . 0))
		  (left-pad '(left . 4))
		  (left-out '(left . 130))
          (left-over '(left . 80))
		  (left-less '(left . 280))     ; 240
          (left-one '(left . 320))
		  (left-two '(left . 640))
		  (left-eyes '(left . 400))
		  (top '(top . 16)))            ; 24?
	  (case config
		(small (set-dims width-one height-small left-less top))
		(fat (set-dims width-two height-small left-full top))
        (chunky (set-dims width-eyes height-small left-over top))
		(pairs (set-dims width-two height-small left-full top))
		(tall (set-dims width-one height-tall left-two top))
		(wide (set-dims width-two height-tall left-one top))
		(wider (set-dims width-three height-tall left-out top))
		(widest (set-dims width-full height-tall left-full top))
		(pro (set-dims width-full height-tall left-pad top))
		(eyes (set-dims width-eyes height-tall left-eyes top)))))

  (if (member config '(pairs eyes))
	  ;;(set-frame-font "-apple-Monaco-medium-normal-normal-Regular-18-*-*-*-*-*-iso10646-1")
      ;;(set-frame-font "-apple-Monaco-medium-normal-normal-Regular-18-*-*-*-*-*-iso10646-1")
      (set-frame-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-fontset-auto6")
      (set-frame-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-fontset-auto6")))

;;(add-to-list 'load-path (expand-file-name "color-theme-6.6.0/" jcm-elib-dir))

(when window-system
  ;;(global-linum-mode t)
  ;;(setq mac-option-modifier 'super)
  ;;(setq ns-command-modifier 'meta)
  (jcm-set-carbon-prefs jcm-mac-window-size))

(setq shell-file-name "/bin/zsh")
(set-exec-path-from-shell-PATH)

;; Bind Mac external keyboard delete key to delete rather than backspace.
(global-set-key (kbd "<kp-delete>") 'delete-char)

(provide 'jcm-carbon)
