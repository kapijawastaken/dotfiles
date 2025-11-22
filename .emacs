;; config
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(setq dired-deletion-confirmer '(lambda (x) t))
(menu-bar-mode -1)
(setq make-backup-files nil)
(load-theme 'redish t)

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
