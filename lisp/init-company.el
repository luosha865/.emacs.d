
(require 'company)
(setq company-tooltip-flip-when-above t
  company-minimum-prefix-length 2
  company-tooltip-limit 20
  company-idle-delay 0)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-cmake)
(add-to-list 'company-backends 'company-go)
;(require 'auto-complete-config)
;(ac-config-default)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
