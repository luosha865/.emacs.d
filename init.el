;; -*- coding: utf-8 -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.
(package-initialize)

(defvar best-gc-cons-threshold 4000000 "Best default gc threshold value. Should't be too big.")

;; don't GC during startup to save time, will change again in the end of this file.
(setq gc-cons-threshold most-positive-fixnum)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

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

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil))
  (require 'init-theme)
  (require 'init-evil)
  (require 'init-exec-path)
  (require 'init-geeknote)
  (require 'init-nlinum-relative)
  (require 'init-swiper)
  (require 'init-tabbar)
  (require 'init-undo-tree)
  (require 'init-company)
  (require 'init-elpy)
  (require 'init-magit)
  (require 'init-mult-cursors)
  (require 'init-window-number)
  (require 'init-yasnippet)
  (require 'init-ess)
  (require 'init-org-mode)
  (require 'init-go)
  (require 'init-speedbar)
  (require 'init-gtags)
  (require 'init-flymake)
  (require 'init-flyspell)
  (require 'init-flycheck)
  (require 'init-webmode)
  (require 'init-js2mode)
  (require 'init-tern)
  (require 'init-vue)
  (require 'init-emmet-mode)
  (require 'init-projectile)
  (require 'init-cmake)
  (require 'init-cuda)
  (require 'init-irony)
  (require 'init-maxframe))

;; @see https://www.reddit.com/r/emacs/comments/4q4ixw/how_to_forbid_emacs_to_touch_configuration_files/
(setq custom-file (concat user-emacs-directory "custom-set-variables.el"))
(load custom-file 'noerror)

(setq gc-cons-threshold best-gc-cons-threshold)

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

(setq gc-cons-threshold best-gc-cons-threshold)
