(use-package engine-mode :ensure t
  :config (engine-mode t)
  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    ))
