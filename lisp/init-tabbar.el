
(require 'tabbar)
(tabbar-mode 1)
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer")
    ((eq major-mode 'dired-mode)
     "Dired")
    (t
     "User Buffer")))) 
(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
(global-set-key (kbd "s-{") 'tabbar-backward)
(global-set-key (kbd "s-}") 'tabbar-forward)

(provide 'init-tabbar)
