(require 'ivy)
(defun cpb/ag-collection (string)
  "Search for pattern STRING using ag.
We only have this as a separate function so we can assoc with sort function."
  ;; this will use counsel--async-command to run asynchronously
  (counsel-ag-function string counsel-ag-base-command "")) 

;; modified from https://github.com/abo-abo/swiper/wiki/Sort-files-by-mtime
;; * directory to counsel--git-grep-dir: that's where AG is working
;; * removed directory logic: ag returns files
;; * parsed out filename from ag results
(defun eh-ivy-sort-file-by-mtime (x y)
  "Determine if AG sort result X is newer than Y."
  (let* ((x (concat ivy--directory (car (split-string x ":"))))
	 (y (concat ivy--directory (car (split-string y ":"))))
	 (x-mtime (nth 5 (file-attributes x)))
	 (y-mtime (nth 5 (file-attributes y))))
    (time-less-p y-mtime x-mtime)))

;; ivy uses the ivy-sort-functions-alist to look up suitable sort
;; functions for any given collection function
;; we add a cons cell specifying eh-ivy-sort-file-by-mtime as the sort
;; function to go with our collection function
(add-to-list 'ivy-sort-functions-alist
	     '(cpb/ag-collection . eh-ivy-sort-file-by-mtime))

(defun cpb/counsel-ag (&optional initial-input initial-directory extra-ag-args ag-prompt
				 &key caller)
  "Grep for a string in the current directory using ag.
INITIAL-INPUT can be given as the initial minibuffer input.
INITIAL-DIRECTORY, if non-nil, is used as the root directory for search.
EXTRA-AG-ARGS string, if non-nil, is appended to `counsel-ag-base-command'.
AG-PROMPT, if non-nil, is passed as `ivy-read' prompt argument.
CALLER is passed to `ivy-read'."
  (interactive)
  (setq counsel-ag-command counsel-ag-base-command)
  (setq counsel--regex-look-around counsel--grep-tool-look-around)
  (counsel-require-program counsel-ag-command)
  (when current-prefix-arg
    (setq initial-directory
	  (or initial-directory
	      (read-directory-name (concat
				    (car (split-string counsel-ag-command))
				    " in directory: "))))
    (setq extra-ag-args
	  (or extra-ag-args
	      (read-from-minibuffer (format
				     "%s args: "
				     (car (split-string counsel-ag-command)))))))
  (setq counsel-ag-command (counsel--format-ag-command (or extra-ag-args "") "%s"))
  (let ((default-directory (or initial-directory
			       (counsel--git-root)
			       default-directory)))
    (ivy-read (or ag-prompt
		  (concat (car (split-string counsel-ag-command)) ": "))
	      #'cpb/ag-collection
	      :initial-input initial-input
	      :dynamic-collection t
	      :keymap counsel-ag-map
	      :sort t
	      :history 'counsel-git-grep-history
	      :action #'counsel-git-grep-action
	      :unwind (lambda ()
			(counsel-delete-process)
			(swiper--cleanup))
	      :caller (or caller 'cpb/counsel-ag))))

(defun ghan-counsel-ag-codes1()
  "grep content in code files using counsel-ag"

  (interactive)
  (cpb/counsel-ag nil (expand-file-name "~/CloudStation/codes/code-base") "-C 1")
  )

