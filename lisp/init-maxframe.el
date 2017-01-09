
; maxize frame on start
(require 'maxframe)
(setq mf-max-width 1600)  ;; Pixel width of main monitor.
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'after-make-frame-functions 'maximize-frame)

(provide 'init-maxframe)
