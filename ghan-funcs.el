(defun ghan-insert-filename ()
  "Insert file name of current buffer at current point"

  (interactive)
  (insert (buffer-file-name (current-buffer)))
  )

(defun ghan-sp2tab ()
  "replace continuing whitespace with tab"

  (interactive)
  (goto-char (point-min))
  (while (re-search-forward " +" nil t)
    (replace-match "\t" nil t))
  )

(defun ghan-swapEqual(start end)
  "swap the word at the two side of ="

  (interactive "r") ;;r for region
  (let ((selContent (buffer-substring-no-properties start end)))
    ;;    (message selContent)
    (delete-region start end)
    (goto-char start)
    (insert (string-join (reverse  (split-string selContent "="))  "=")))
  )

(defun ghan-swapComma(start end)
  "swap the word at the two side of ,"

  (interactive "r")
  (let ((selContent (buffer-substring-no-properties start end)))
    ;;    (message selContent)
    (delete-region start end)
    (goto-char start)
    (insert (string-join (reverse  (split-string selContent ","))  ",")))
  )

;;insert date time
(defun ghan-insert-current-date ()
  (interactive)
  (insert (format-time-string "%y-%m-%d %H:%M:%S" (current-time))))

;;split messy strings with comma and quote separated fiedls
(defun ghan-quote-string (str)
  (concat (concat "'" str) "'")
  )

(defun ghan-format-string (start end)
  "Format whitespace delimited string with comma and quote each field"

  (interactive "r")
  (let ((selContent (buffer-substring-no-properties start end)))
    (delete-region start end)
    (goto-char start)
    (insert (mapconcat 'ghan-quote-string (split-string selContent "[,; \f\t\n\r\v]+" t "[\"\']+") ", ")
	    ))
  )

;;borrowed from yanshuo
 (defun get-bqueues ()
    (split-string-and-unquote (shell-command-to-string "bqueues | awk '{ORS=\" \"};NR>1{print $1}'") " "))
 
  (defun get-bq-names-buffer ()
      (string-match "^#BSUB[[:blank:]]+-q[[:blank:]]+\\(\\w+\\)" (buffer-string))
      (match-string 1 (buffer-string)))
 
  (defun get-max-time ()
    (string-trim (shell-command-to-string
     (concat
      "minu=$(bqueues -l "
      (get-bq-names-buffer)
      " | awk '/MAXIMUM LIMITS: RUNLIMIT/{getline; print $1;}');"
      "python -c \"print('<{}:{:02}'.format(int(${minu}/60), int(${minu}%60)))\""))))
 
  (defun get-max-mem ()
    (string-trim (shell-command-to-string
                  (concat
                   "bqueues -l "
                   (get-bq-names-buffer)
                   " | awk '/MEMLIMIT/{getline; if($2 == \"G\") {print \"<\"$1} else{if($2 == \"T\"){print \"<\"($1 * 1024)}};}'| tail -n 1"))))

;;elpy function to switch between sessions
;;credit: https://github.com/jorgenschaefer/elpy/issues/1197
(setq elpy-dedicated-shells nil)   ; Ensure no conflict with dedicated shells

(defvar elpy-shell-python-shell-names '("Python")
  "List of existing python shell names.")

(defun elpy-shell-switch-python-shell (&optional dont-display)
  "Switch to another Python shell.

Create a new one if it does not exist.
If DONT-DISPLAY is non nil, do not display the python shell afterwards."
  (interactive)
  (let ((shell-name (completing-read "Python shell name: "
                                     'elpy-shell-python-shell-names)))
    (setq python-shell-buffer-name shell-name)
    (add-to-list 'elpy-shell-python-shell-names shell-name t)
    (when (not dont-display)
      (elpy-shell-display-buffer))))
