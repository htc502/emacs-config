(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
;;ess settings
(add-hook 'ess-mode-hook
          (lambda () (flycheck-mode t)))
