;;load self defined funcs
(load (expand-file-name "ghan-funcs.el"))
(load (expand-file-name "reveal-in-osx-finder.el"))
(use-package yasnippet :ensure t
  :config 
  (yas-global-mode 1))
