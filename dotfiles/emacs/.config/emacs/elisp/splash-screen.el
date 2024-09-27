(require 'subr-x)
(require 'cl-lib)


(defun drop-title ()
  "Splash screen title"
  "GNU Emacs")

(defun drop-subtitle ()
  "Splash screen subtitle"
  (concat "v" (number-to-string emacs-major-version) "." (number-to-string emacs-minor-version))
  ;;(format-time-string "%H:%M:%S")
  )

(setq drop-update-delay nil)

(defun splash-screen ()
  "Drop splash screen"
  (remove-hook 'window-setup-hook #'splash-screen)

  ;; Hide modeline before window-body-height is computed
  (let* ((drop-buffer (get-buffer-create " *splash*")))
    (with-current-buffer drop-buffer
      (setq header-line-format nil)
      (setq mode-line-format nil)
      (setq cursor-type nil)
      (if (fboundp 'evil-mode)
	  (setq-local evil-normal-state-cursor nil
	              evil-emacs-state-cursor nil
	              evil-emacs-visual-cursor nil)
	(setq cursor-type nil))
      (display-line-numbers-mode 0)))
  
  ;; If there are buffer associated with filenames,
  ;;  we don't show the splash screen.
  (if (eq 0 (length (cl-loop for buf in (buffer-list)
			     if (buffer-file-name buf)
			     collect (buffer-file-name buf))))
        
      (let* ((drop-buffer  (get-buffer-create " *splash*"))
	     (height         (round (- (window-body-height nil) 1) ))
	     (width          (round (window-body-width nil)        ))
	     (padding-center (+ (/ height 2) 1)))
    
	(with-current-buffer drop-buffer
          ;; Buffer local settings
          (if (one-window-p) (setq mode-line-format nil))
          (setq cursor-type nil)
          (setq line-spacing 0)
          (setq vertical-scroll-bar nil)
          (setq horizontal-scroll-bar nil)
          (setq fill-column width)
          (face-remap-add-relative 'link :underline nil)
          (if (not (display-graphic-p)) (menu-bar-mode 0))

          ;; Vertical padding to center
          (insert-char ?\n padding-center)
          (insert (propertize (drop-title) 'face 'default))
          (center-line)
          (insert "\n")
          (insert (propertize (drop-subtitle) 'face 'shadow))
          (center-line)

          (goto-char 0)
          (read-only-mode 1)
          (display-buffer-same-window drop-buffer nil)

	  (message "")
	  (add-hook 'window-state-change-hook #'drop-check-for-recenter nil t)
	  (setq cursor-type nil)
	  )))

  )


(defun center-string (string)
  "Pad a string with space on the left such as to center it"
  (let* ((padding (/ (- (window-body-width) (length string)) 2))
         (padding (+ (length string) padding)))
    ;; If the string is displayed as a tooltip, don't pad it
    (if (and tooltip-mode (fboundp 'x-show-tip))
        string
      (format (format "%%%ds" padding) string))))

(defun drop-check-for-recenter ()
  "Recenter the splash screens if any are visible"
  (if (get-buffer-window " *splash*")
      (if drop-update-delay
	  (run-with-timer 0 'drop-update-delay 'drop-update)
	(drop-update)
	)
    )
  )

(defun drop-update ()
  "Update the content of the splash-screen"
  (drop-recenter)
  )

(defun drop-recenter ()
  "Recenter splash screen"
  (let* ((drop-buffer  (get-buffer-create " *splash*"))
         (height         (round (- (window-body-height (get-buffer-window drop-buffer)) 3) ))
         (width          (round (window-body-width (get-buffer-window drop-buffer))        ))
         (padding-center (+ (/ height 2) 1)))
  (with-current-buffer drop-buffer
    (read-only-mode -1)
    (erase-buffer)

    (setq fill-column width)
    
    ;; Vertical padding to center
    (insert-char ?\n padding-center)
    (insert (propertize (drop-title) 'face 'default))
    (center-line)
    (insert "\n")
    (insert (propertize (drop-subtitle) 'face 'shadow))
    (center-line)

    (goto-char 0)
    (read-only-mode 1)
    (setq cursor-type nil)
    ))
  )

;; Install hook after frame parameters have been applied and only if
;; no option on the command line
(if (and (not (member "-no-splash"  command-line-args))
         (not (member "--file"      command-line-args))
         (not (member "--insert"    command-line-args))
         (not (member "--find-file" command-line-args))
         )
    (progn
      (add-hook 'window-setup-hook #'splash-screen)
      ;;(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
      (put 'inhibit-startup-echo-area-message 'saved-value
	   (setq inhibit-startup-echo-area-message (user-login-name)))
      (setq 
	    ;inhibit-startup-echo-area-message (user-login-name) ; I hate you Richard Stallman
	    inhibit-startup-screen t 
            inhibit-startup-message t
	    )))

(provide 'splash-screen)
