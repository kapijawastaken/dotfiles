;; config
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(add-to-list 'default-frame-alist
             '(font . "Hasklug Nerd Font Mono-15"))

;; vars
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-listing-switches "-alh")
(setq dired-deletion-confirmer '(lambda (x) t))
(setq use-short-answers t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq vterm-kill-buffer-on-exit t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq dired-dwim-target t)
(setq indent-tabs-mode nil)
(setq tab-width 4)
;; functions
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(set-fringe-mode 0)
(load-theme 'redish t)
(electric-pair-mode 1)
(column-number-mode)
;; disable autoindent in d-mode cuz it sucks
(add-hook 'd-mode-hook
          (lambda ()
            (electric-indent-local-mode -1)))

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; emms
(advice-add 'emms-toggle-repeat-track :around
            (lambda (orig-fun &rest args)
              (with-current-buffer (or emms-playlist-buffer (emms-playlist-current))
                (apply orig-fun args))))

(use-package emms
  :config
  (require 'emms-setup)
  (require 'emms-player-mplayer)
  (emms-all)
  (setq emms-player-list '(emms-player-mplayer))
  (setq emms-player-mplayer-parameters '("-novideo" "-nocache" "-slave")))

;; Artist - Title
(setq emms-track-description-function
  (lambda (track)
    (let ((artist (emms-track-get track 'info-artist))
      (title  (emms-track-get track 'info-title)))
    (or (when (and artist title)
      (concat artist " - " title))
        (emms-track-simple-description track)))))

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c m e") 'mc/edit-lines)

;; tree-sitter
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; platformio
(require 'platformio-mode)
(add-hook 'c++-mode-hook (lambda ()
			   (platformio-conditionally-enable)))

;; music mount
(if (= 0 (call-process "mountpoint" nil nil nil "-q" "/mnt/Music"))
    (progn
      (emms-add-directory-tree "/mnt/Music/")
      (emms-shuffle))
  (set-process-sentinel
   (start-process "music-ping" nil "sh" "-c"
                  "timeout 1 ping -c 1 jam >/dev/null 2>&1 && sudo -n mount /mnt/Music")
   (lambda (proc event)
     (when (and (eq (process-status proc) 'exit)
                (= (process-exit-status proc) 0))
       (emms-add-directory-tree "/mnt/Music/")
       (emms-shuffle)))))

;; poweroff
(defun poweroff ()
  "Run system poweroff command."
  (interactive)
  (shell-command "sudo poweroff"))

;; reboot
(defun reboot ()
  "Run system reboot command."
  (interactive)
  (shell-command "sudo reboot"))

;; autocomplete
(global-set-key (kbd "C-<tab>") 'hippie-expand)
;; windmove
(global-set-key (kbd "C-c C-<left>") 'windmove-left)
(global-set-key (kbd "C-c C-<right>") 'windmove-right)
(global-set-key (kbd "C-c C-<up>") 'windmove-up)
(global-set-key (kbd "C-c C-<down>") 'windmove-down)

;; wacom driver removal
(shell-command "sudo rmmod wacom"))
