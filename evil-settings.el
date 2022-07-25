(use-package evil                ;evil mode
  :ensure t
  :init(setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-collection ;;this one load vterm, which on macos is annoying
  :after evil
  :ensure t
  :config
  :custom (evil-collection-setup-minibuffer nil) ;;doesn't work well
  :init (evil-collection-init))

(use-package evil-surround :ensure t   ;for quotation
  :config (global-evil-surround-mode 1))
