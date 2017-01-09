
; user python3 on default
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(elpy-use-ipython)
(setq python-shell-interpreter "ipython3" python-shell-interpreter-args "--simple-prompt --pprint")
(defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'init-elpy)
