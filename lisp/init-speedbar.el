
;sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 35)
(setq dframe-update-speed t)
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "<f8>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))

(provide 'init-speedbar)
