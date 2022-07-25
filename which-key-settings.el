(use-package which-key :ensure t ;key-bindings navigation
  :config (setq which-key-idle-delay 0.05)
  (push '(("\\(.*\\) 0" . "winum-select-window-0") . ("\\1 0..9" . "window 0..9"))
	which-key-replacement-alist)
  (push '((nil . "winum-select-window-[1-9]") . t) which-key-replacement-alist)
  (which-key-mode)
  )
(setq ghan-use-which-key t)
