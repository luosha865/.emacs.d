
(require 'ess-site)
(setq ess-use-eldoc nil)
(setq ess-default-style 'DEFAULT)
(setq inferior-julia-program-name "julia")
(setq julia-indent-offset 2)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

(provide 'init-ess)
