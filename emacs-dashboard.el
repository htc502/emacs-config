(require 'dashboard)
(dashboard-setup-startup-hook)
;; Or if you use use-package
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
;; (add-to-list 'dashboard-items '(agenda) t)
;; (setq show-week-agenda-p t)
(setq dashboard-items '((recents  . 10)
                        (bookmarks . 10)
                        ;; (projects . 10)
                        (agenda . 10)))
