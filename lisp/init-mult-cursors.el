

(require 'multiple-cursors)
(global-set-key (kbd "C-c e l") 'mc/edit-lines)
(global-set-key (kbd "C-c e b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c e e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c e <right>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c e <left>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c e a") 'mc/mark-all-like-this)

(provide 'init-mult-cursors)