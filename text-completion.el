;;company mode
(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode)
  :bind (("M-p" . 'company-complete))
  )
