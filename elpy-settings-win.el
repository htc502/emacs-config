;;elpy
(use-package elpy
  :ensure t
  :init
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython"
	elpy-rpc-python-command "python"
	python-shell-interpreter-args
        	"-i --simple-prompt")
  )
