

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(add-hook 'vue-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)

(provide 'init-tern)
