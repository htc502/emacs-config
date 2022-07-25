;;elpy
(use-package elpy
  :ensure t
  :init
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython3"
	elpy-rpc-python-command "python3"
	python-shell-interpreter-args
        	"-i --simple-prompt -c exec('__import__(\\'readline\\')')")
  )
