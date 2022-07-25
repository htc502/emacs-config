(use-package counsel :ensure t         ;ivy, swiper and counsel
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
	'((counsel-M-x . ivy--regex-fuzzy) ; Only counsel-M-x use flx fuzzy search
	  (save-buffer . ivy--regex-fuzzy)
	  (t . ivy--regex-plus)))

  (setq ivy-initial-inputs-alist nil) ; remove ^ added by ivy
  :bind (("M-x" . counsel-M-x))
  )
(setq ghan-use-counsel t)
