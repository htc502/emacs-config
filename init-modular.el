;;; ghan1 --- emacs modular configuration (macOS)
;;; Commentary:

;;; Code:
;;;load modules, order may affect
(load "basic-settings.el")
(load "use-package-bootstrap.el")
(load "shell-path.el")
(load "evil-settings.el")
(load "which-key-settings.el")
;;dec 7th, 2021, try snail
;; (load "snail-settings.el")
;; (load "ivy-settings.el")
(load "selectrum-settings.el")
;; (load "helm-settings.el")
(load "text-completion.el")
(load "navigation.el")
;;recentfile mode
(load "recentf-mode-settings.el")
;; (load "project-manage.el")
(load "search-engine.el")
;; Dec 7th, 2021 change the ess setup file from ess.el to ess-settings.el to avoid potential recursive loading issue since one code file in ess package also named ess.el
(load "ess-settings.el")
;; (load "vterm.el")
;; (load "aweshell-settings.el")
;; (load "awesome-tray-settings.el")
(load "elpy-settings.el")
(load "org-settings.el")
(load "theme-solarized.el")
;; (load "fira-font-patch.el")
(load "load-custome.el")
;; use general to define key bindings
(use-package general
  :ensure t
  :init
  (setq general-override-states '(insert
				  emacs
				  hybrid
				  normal
				  visual
				  motion
				  operator
				  replace))
  :config 
  (general-define-key
   :states '(normal motion visual)
   :keymaps 'override
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   "1" 'winum-select-window-1 ; pass prefix arg with c-u  will delete this window
   "2" 'winum-select-window-2
   "3" 'winum-select-window-3
   "4" 'winum-select-window-4
   "5" 'winum-select-window-5
   "6" 'winum-select-window-6
   "7" 'winum-select-window-7
   "8" 'winum-select-window-8
   "9" 'winum-select-window-9
   "0" 'winum-select-window-0
   "SPC" (if (boundp 'ghan-use-counsel) 'counsel-M-x
	   (if (boundp 'ghan-use-helm) 'helm-M-x 'execute-extended-command))
   "c" 'company-files
   "d" '(:ignore t :which-key "Dired")
   "dd" 'dired
   "g" '(:ignore t :which-key "Go(to bookmark)")
   "gs" 'bookmark-set
   "gl" 'bookmark-bmenu-list
   "r" '(:ignore t :which-key "R")
   "rh" 'ess-help
   "rm" 'ess-r-mode
   "b" '(:ignore t :which-key "Buffer")
   "bb" (if (boundp 'ghan-use-counsel) 'counsel-switch-buffer
	  (if (boundp 'ghan-use-helm) 'helm-buffer-list 'switch-to-buffer))
   "bk" 'kill-current-buffer
   "bl" 'ibuffer-list-buffers
   "bo" (if (boundp 'ghan-use-counsel) 'counsel-switch-buffer-other-window
	  'switch-to-buffer)
   "f" '(:ignore t :which-key "File")
   "fe" 'reveal-in-osx-finder ;;e for explore
   "ff" (if (boundp 'ghan-use-counsel) 'counsel-find-file
	  (if (boundp 'ghan-use-helm) 'helm-find-files 'find-file))
   "fr" (if (boundp 'ghan-use-counsel) 'counsel-recentf
	  (if (boundp 'ghan-use-helm) 'helm-recentf 'ghan1-recentf-find-file))
   "fs" 'save-buffer
   "w" '(:ignore t :which-key "Window")
   "wb" 'split-window-below
   "wr" 'split-window-right
   ;; "p" '(:ignore t :which-key "Project")
   ;; "pp" 'projectile-switch-project
   "s" '(:ignore t :which-key "Search")
   "sc" (if (boundp 'ghan-use-counsel) 'ghan-counsel-ag-codes
	  (if (boundp 'ghan-use-helm) 'ghan-helm-ag-codes))
   "sd" 'ghan-counsel-ag-codes-cleaned
   "ss" (if (boundp 'ghan-use-counsel) 'counsel-grep-or-swiper
	  (if (boundp 'ghan-use-helm) 'helm-swoop 'grep))
   "sg" 'engine/search-google
   ;; "sp" (if (boundp 'ghan-use-counsel) 'counsel-ag
   ;; 	  (if (boundp 'ghan-use-helm) 'helm-ag))
   ;; "m" '(:ignore t :which-key "Misc")
   ;; "mc" 'counsel-colors-web
   ;; "ms" 'aweshell-new
   ))
(load "snippets-funcs.el")
(load "ghan1-kbd-settings.el")
;; (load "emacs-dashboard.el")
