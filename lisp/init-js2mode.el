
(defun my-j2-mode-hook ()
  (setq js2-basic-offset 2))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
(add-hook 'js-mode-hook 'my-j2-mode-hook)
;(add-hook 'js2-mode-hook 'my-j2-mode-hook)
;(add-hook 'js2-jsx-mode-hook 'my-j2-mode-hook)


(provide 'init-js2mode)
