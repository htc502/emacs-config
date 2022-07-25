;;; ghan1 --- emacs config: use-package
;;; Commentary:
;;; package management bootstrap: package -> use-package 

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)    ;lazy load
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos)) 
		    (not (gnutls-available-p))))
       ;; (proto (if no-ssl "http" "https")))
       (proto (if no-ssl "https" "https"))) ;;no need for setting http on windows, 2021-12-30
  (when no-ssl
    (warn " Emacs version doesn't support SSL connections,
try an SSL version and be safe."))
  (add-to-list 'package-archives        ;set package repo
	       (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives
	       (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives
	       (cons "gnu" (concat proto "://elpa.gnu.org/packages/"))))

(package-initialize)                    ;prepare to fire up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)           ;package management
