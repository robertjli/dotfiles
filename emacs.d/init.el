;; When in windowed mode
(when (display-graphic-p)
  ;; Set font
  (set-face-attribute 'default nil :font "Inconsolata-dz-11")
)

;; Turn off tabs
(setq-default indent-tabs-mode nil)

;; Show line and column numbers
(line-number-mode 1)
(column-number-mode 1)

;; Coler theme
(add-to-list 'load-path "~/.emacs.d/packages/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

;; Move backups to .emacs.d
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
