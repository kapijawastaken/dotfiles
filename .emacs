;; config  -*- lexical-binding: t; -*-
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(add-to-list 'default-frame-alist
             '(font . "Hasklug Nerd Font Mono-15"))

;; background
(add-to-list 'default-frame-alist '(alpha-background . 80))

;; vars
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-listing-switches "-alh")
(setq dired-deletion-confirmer '(lambda (x) t))
(setq use-short-answers t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq vterm-kill-buffer-on-exit t)
(setq make-backup-files nil)
(setq calendar-date-style "european")
(setq mu4e-headers-date-format "%d.%m.%Y")
(setq async-shell-command-buffer 'new-buffer)
(setq scroll-step 1)
(setq scroll-margin 5)
(setq ring-bell-function 'ignore)

;; hide async buffers
(add-to-list 'display-buffer-alist
	     '("\\*Async Shell Command\\*" display-buffer-no-window))
(advice-add 'shell-command-sentinel :override #'ignore)

;; functions
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(set-fringe-mode 0)
(load-theme 'redish t)
(electric-pair-mode 1)

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c m e") 'mc/edit-lines)

;; autocomplete
(global-set-key (kbd "C-<tab>") 'hippie-expand)

;; music mount
(if (eq 0 (shell-command "ping -c 1 jam"))
    (shell-command "sudo mount /mnt/Music"))

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

;; mu4e
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)
;; mu4e-views
(require 'goto-addr)
(require 'mu4e-views)
(setq user-mail-address "gabriellsimic@disroot.org"
      user-full-name  "Gabriell Šimić"
      smtpmail-local-domain "localhost.localdomain"
      mu4e-get-mail-command "mbsync -c ~/.config/mu4e/mbsyncrc -a"
      mu4e-update-interval  300
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("disroot.org" 587 nil nil))
      smtpmail-auth-credentials '(("disroot.org" 587 "gabriellsimic@disroot.org" nil))
      smtpmail-default-smtp-server "disroot.org"
      smtpmail-smtp-server "disroot.org"
      smtpmail-smtp-service 587
      mu4e-sent-folder "/gabriell-disroot/Sent"
      mu4e-drafts-folder "/gabriell-disroot/Drafts"
      mu4e-trash-folder "/gabriell-disroot/Trash"
      mu4e-maildir-shortcuts
      '(("/gabriell-disroot/Inbox"    . ?i)
        ("/gabriell-disroot/Sent"     . ?s)
        ("/gabriell-disroot/All Mail" . ?a)
        ("/gabriell-disroot/Trash"    . ?t)
	("/gabriell-disroot/Drafts"   . ?d)))

;; exwm
(require 'exwm)
;; Set the initial workspace number.
(setq exwm-workspace-number 10)
;; Make class name the buffer name.
(add-hook 'exwm-update-class-hook
  (lambda () (exwm-workspace-rename-buffer exwm-class-name)))
;; Ignore client-requested workspace placement
(advice-add 'exwm--on-net-wm-desktop :override #'ignore)
;; Global keybindings
(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset) ;; s-r: Reset (to line-mode).
        ([s-left] . windmove-swap-states-left) ;; s-<left>: swap left
	([s-right] . windmove-swap-states-right) ;; s-<right>: swap right
	([s-up] . windmove-swap-states-up) ;; s-<up>: swap up
	([s-down] . windmove-swap-states-down) ;; s-<down>: swap down
	([s-return] . multi-vterm) ;; multi-vterm
	([?\s-w] . exwm-workspace-switch) ;; s-w: Switch workspace.
	([?\s-E] . (lambda () ;; s-shift-e: logout
		     (interactive)
		     (async-shell-command "pkill -KILL -u $USER")))
	([XF86AudioRaiseVolume] . (lambda () ;; volume up
		     (interactive)
		     (async-shell-command "pactl set-sink-volume @DEFAULT_SINK@ +10%")))
	([XF86AudioLowerVolume] . (lambda () ;; volume down
		     (interactive)
		     (async-shell-command "pactl set-sink-volume @DEFAULT_SINK@ -10%")))
	([XF86AudioMute] . (lambda () ;; mute
		     (interactive)
		     (async-shell-command "pactl set-sink-mute @DEFAULT_SINK@ toggle")))
	([XF86MonBrightnessUp] . (lambda () ;; brightness up
		     (interactive)
		     (async-shell-command "brightnessctl set +10%")))
	([XF86MonBrightnessDown] . (lambda () ;; brightness down
		     (interactive)
		     (async-shell-command "brightnessctl set 10%-")))	
        ([?\s-d] . (lambda (cmd) ;; s-d: Launch application.
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command cmd nil cmd)))))

;; s-N: Switch to certain workspace.
(dotimes (i 10)
  (exwm-input-set-key
   (kbd (format "s-%d" (mod (1+ i) 10)))
   `(lambda ()
      (interactive)
      (exwm-workspace-switch-create ,i))))

;; exwm bar
(require 'exwm-systemtray)
(exwm-systemtray-mode 1)
(async-shell-command "pasystray &")
(async-shell-command "nm-applet &")
(async-shell-command "simplescreenrecorder --start-hidden &")
(async-shell-command "cbatticon BAT1 &")
(async-shell-command "cbatticon BAT0 &")

;; applications
(async-shell-command "picom -b -f --config ~/.config/picom/picom.conf &")
(async-shell-command "pipewire-start &")
;; keyboard layout
(shell-command "setxkbmap -layout de -variant nodeadkeys -option ctrl:nocaps compose:lctrl")

;; Enable EXWM
(exwm-wm-mode)

;; Make buffer name more meaningful
(add-hook 'exwm-update-class-hook
          (lambda ()
          (exwm-workspace-rename-buffer exwm-class-name)))
