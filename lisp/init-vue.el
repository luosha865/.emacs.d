
(defun my-vue-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq js-indent-level 2))

(add-hook 'vue-mode-hook  'my-vue-mode-hook)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

(provide 'init-vue)
