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

;; Highlight closing braces
(show-paren-mode 1)

;; Bind backspace to C-h
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Remove scratch message
(setq initial-scratch-message "")

;; Remove toolbars
(setq initial-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)))

;; Color theme
(add-to-list 'load-path "~/.emacs.d/packages/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

;; Move backups to .emacs.d
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Bind auto-indentation to RET
(define-key (current-global-map) (kbd "RET") 'reindent-then-newline-and-indent)
;; And for ruby-mode
(add-hook 'ruby-mode-hook
  (lambda () (define-key ruby-mode-map (kbd "RET")
    'reindent-then-newline-and-indent)))
    
;; Find corresponding files
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-c o") 'ff-find-other-file)))

;; Revert buffer
(global-set-key (kbd "C-c r") 'revert-buffer)


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
