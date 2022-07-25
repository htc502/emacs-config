(savehist-mode) ;;save history inputs of minibuffer
(use-package selectrum
  :ensure
  :init
  (selectrum-mode +1)
  (setq completion-styles '(flex substring partial-completion)))

;; (use-package selectrum-prescient
  ;; :ensure
  ;; :init
  ;; (selectrum-prescient-mode +1))
  ;; (prescient-persist-mode +1))

(setq ghan-use-selectrum t)
