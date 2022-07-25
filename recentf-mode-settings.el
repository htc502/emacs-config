(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode)
(defun ghan1-recentf-find-file ()
  "show recently opened files"
  (interactive)
  (let ((file (completing-read "choose recently edited file: " recentf-list nil t)))
    (when file
      (find-file file))))
