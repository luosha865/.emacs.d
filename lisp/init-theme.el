
; set up a gray color-theme
(require 'color-theme)

;; {{ work around color theme bug
;; @see https://plus.google.com/106672400078851000780/posts/KhTgscKE8PM
(defadvice load-theme (before disable-themes-first activate)
	   ;; diable all themes
	   (dolist (i custom-enabled-themes)
	     (disable-theme i)))
;; }}

(color-theme-initialize)
(color-theme-gray30)

(provide 'init-theme)
