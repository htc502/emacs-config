;;winum instead of ace-window for move between windows
(use-package winum :ensure t
  :config
  (setq winum-auto-setup-mode-line t)
  (winum-mode))
;;relative line number(bulti in has bug)
(use-package linum-relative :ensure t
  :config (linum-on)
  (linum-relative-global-mode))
