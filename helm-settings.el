(use-package helm :ensure t         ;helm
  :config (progn
	    (setq
	     ;; helm-M-x-fuzzy-match t
	     ;; helm-buffers-fuzzy-matching t
	     )
	    (helm-mode 1))
  :bind (("M-x" . helm-M-x))
  )
(use-package helm-ag :ensure t)
(use-package helm-swoop :ensure t)

(setq ghan-use-helm t)
