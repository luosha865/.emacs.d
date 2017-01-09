
(require 'cmake-mode)
(require 'cmake-project)
(defun maybe-cmake-project-hook ()
  (if (projectile-file-exists-p "CMakeLists.txt") (cmake-project-mode)))
(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)

(provide 'init-cmake)
