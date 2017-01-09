
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'projectile-speedbar)
(defun my-projectile-speedbar-toggle ()
  (interactive)
  (sr-speedbar-close)
  (projectile-speedbar-open-current-buffer-in-tree))
(global-set-key (kbd "M-<f8>") 'my-projectile-speedbar-toggle)
(setq eshell-last-dir-ring-size 500)
(eval-after-load 'eshell
  '(require 'eshell-autojump nil t))
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(provide 'init-projectile)
