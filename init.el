
;(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/"))
;(setq exec-path (append exec-path '("/usr/local/bin/")))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")))

(setq shell-file-name "/bin/zsh")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
;bug on mac: C-z/s-p may lead to crash
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "s-p") nil)
(global-hl-line-mode 1)
(setq scroll-step            3
      scroll-conservatively  10000)
(defun quit-window () 
 "modified quit window"
 (interactive)
 (kill-buffer-and-window))
;open ido mode
;(setq ido-enable-flex-matching t)
;(setq ido-everywhere t)
;(ido-mode 1)

(defun colorfy-eshell-prompt ()
  "Colorfy eshell prompt according to `user@hostname' regexp."
  (let* ((mpoint)
         (user-string-regexp (concat "^" user-login-name "@" system-name)))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward (concat user-string-regexp ".*[$#]") (point-max) t)
        (setq mpoint (point))
        (overlay-put (make-overlay (point-at-bol) mpoint) 'face '(:foreground "dodger blue")))
      (goto-char (point-min))
      (while (re-search-forward user-string-regexp (point-max) t)
        (setq mpoint (point))
        (overlay-put (make-overlay (point-at-bol) mpoint) 'face '(:foreground "green3"))
        ))))
;; Make eshell prompt more colorful
(add-hook 'eshell-output-filter-functions 'colorfy-eshell-prompt)

(add-to-list 'load-path "~/.emacs.d/handmade")

(package-initialize)
(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)
(require 'swiper)
(ivy-mode)
(setq projectile-completion-system 'ivy)
;(require 'helm-config)
;(global-set-key (kbd "M-x") 'helm-M-x)
;(helm-mode 1)
(require 'yasnippet)
(yas-global-mode 1)
(add-hook 'term-mode-hook (lambda()
			    (yas-minor-mode -1)))
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
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
;sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 35)
(setq dframe-update-speed t)
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "<f8>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))
(require 'cmake-mode)  
; Enable evil
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "w" 'save-buffer
  "s" 'window-number-select
  "n" 'geeknote-find
  "h" 'shell
  "t" 'term
  "g" 'magit-status
  "SPC" 'evil-buffer
  "f" 'projectile-find-file
  "b" 'ibuffer
  "B" 'bs-show
  "x" 'execute-extended-command
  "d" 'kill-this-buffer
  "q" 'kill-buffer-and-window
  "j" 'ace-jump-mode
  "r" 'dired-jump)
;(setq evil-toggle-key "")   ; remove default evil-toggle-key C-z, manually setup later
(setq evil-want-C-i-jump nil)   ; don't bind [tab] to evil-jump-forward
(require 'evil)
(evil-mode 1)
;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;; TAB to indent in normal-state
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
;; Use j/k to move one visual line insted of gj/gk
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map (kbd "s-.") 'evil-repeat-pop-next)
(require 'nlinum-relative)
(nlinum-relative-setup-evil)                    ;; setup for evil
(add-hook 'prog-mode-hook 'nlinum-relative-mode)
;(setq nlinum-relative-redisplay-delay 0)      ;; delay
(setq nlinum-relative-current-symbol "->")      ;; or "" for display current line number
(setq nlinum-relative-offset 0)                 ;; 1 if you want 0, 2, 3...
;auto-complete-clang
;(require 'auto-complete-clang)
;(global-set-key (kbd "C-`") 'ac-complete-clang)
(require 'ess-site)
(setq ess-use-eldoc nil)
(setq ess-default-style 'DEFAULT)
(setq inferior-julia-program-name "julia")
(setq julia-indent-offset 2)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    (setq-default)
	    (setq tab-width 4)
	    (setq standard-indent 4)
	    (setq indent-tabs-mode nil)
	    (local-set-key (kbd "M-.") 'godef-jump)))
;(require 'auto-complete-config)
;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "GOPATH")
(require 'company)
(setq company-tooltip-flip-when-above t
  company-minimum-prefix-length 2
  company-tooltip-limit 20
  company-idle-delay 0)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-cmake)
(add-to-list 'company-backends 'company-go)
;(require 'auto-complete-config)
;(ac-config-default)
(add-hook 'after-init-hook 'global-company-mode)
(require 'cmake-project)
(defun maybe-cmake-project-hook ()
  (if (projectile-file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)
;irony-mode for c/c++/oc
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's asynchronous function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; Only needed on Windows
(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0))
(add-to-list 'company-backends 'company-irony)
;(require 'auto-complete-clang-async)
;(defun ac-cc-mode-setup ()
;  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
;  (setq ac-sources '(ac-source-clang-async))
;  (ac-clang-launch-completion-process)
;)
;(defun my-ac-config ()
;  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;  (global-auto-complete-mode t))
;(my-ac-config)
(require 'magit)
(require 'cuda-mode)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))
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
(require 'multiple-cursors)
(global-set-key (kbd "C-c e l") 'mc/edit-lines)
(global-set-key (kbd "C-c e b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c e e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c e <right>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c e <left>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c e a") 'mc/mark-all-like-this)
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(elpy-use-ipython)
(setq python-shell-interpreter "ipython3" python-shell-interpreter-args "--simple-prompt --pprint")
(defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)
(require 'flymake)
(require 'flyspell)
(require 'window-number)
(window-number-mode)
(require 'go-projectile)
(require 'undo-tree)
(global-undo-tree-mode)
;org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(require 'maxframe)
(setq mf-max-width 1600)  ;; Pixel width of main monitor.
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'after-make-frame-functions 'maximize-frame) 

(global-set-key (kbd "C-c g c") 'geeknote-create)
(global-set-key (kbd "C-c g e") 'geeknote-edit)
(global-set-key (kbd "C-c g f") 'geeknote-find)
(global-set-key (kbd "C-c g s") 'geeknote-show)
(global-set-key (kbd "C-c g r") 'geeknote-remove)
(global-set-key (kbd "C-c g m") 'geeknote-move)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((outline-minor-mode)
     (whitespace-style face tabs spaces trailing lines space-before-tab::space newline indentation::space empty space-after-tab::space space-mark tab-mark newline-mark)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
