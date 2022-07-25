;;;custom-file defined in basic-settings.el
;;;load this at the end to make sure custome
;;;setting won't be overwriten by other settings
(when (file-exists-p custom-file)
  (load custom-file))
