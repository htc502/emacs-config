;;; ghan1 --- emacs config: basic settings
;;; Commentary:
;;; gc, version control, temp directory, coding system etc

;;; Code:

(setq gc-cons-threshold         ;Faster by being lazy on garbage collection.
      (* 50 1000 1000)   
      delete-old-versions -1    ; delete excess backup versions silently

      ;; version-control t         ; use of version numbers for backup files
      ;; backup-directory-alist
      ;; `(("." . "~/.emacs.d/backups"))
      ;; vc-follow-symlinks t      ; take care of symbolic links for VCed files
      ;; auto-save-file-name-transforms  ;record transformed names of backups files
      ;; '((".*" "~/.emacs.d/auto-save-list/" t))

      ;;disable backup functionality
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil

      ;;disable startup screen/scratch buffer
      inhibit-startup-screen t
      initial-scratch-message nil

      ring-bell-function 'ignore 
      coding-system-for-read 'utf-8 
      coding-system-for-write 'utf-8
      custom-file               ;separate custom configs (machine specific) 
      (expand-file-name ".custom.el" user-emacs-directory))

(setq sentence-end-double-space nil	; sentence end with a point(search related)
      initial-scratch-message "")       ; message at startup scratch screen
(if (version= emacs-version "26.2")
    (setq  gnutls-algorithm-priority ;bug fix in emacs 26.2
           "NORMAL:-VERS-TLS1.3"))
;;file encoding
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)
(set-face-attribute 'default nil :height 150) ;no matter which font use, set font size to 15
