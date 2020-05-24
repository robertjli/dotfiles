;; When in windowed mode
(when (display-graphic-p)
  ;; Set font
  (when (eq system-type 'darwin)
    (set-face-attribute 'default nil
                        :family "Inconsolata"
                        :height 160))
  (when (eq system-type 'windows-nt)
    (set-face-attribute 'default nil
                        :family "Inconsolata"
                        :height 110
                        :weight 'normal
                        :width 'normal)))

;; Turn off tabs
(setq-default indent-tabs-mode nil)

;; Frame size
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 60))
(when (eq system-type 'windows-nt)
  (add-to-list 'default-frame-alist '(height . 40)))
(add-hook 'emacs-startup-hook
  (lambda ()
    (when (and (display-graphic-p)
               (> (length (window-list)) 1))
          (add-to-list 'initial-frame-alist '(width . 205)))))

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

;; Revert buffer
(global-auto-revert-mode 1)
(global-set-key (kbd "C-c r") 'revert-buffer)
(setq revert-without-query '(".*"))

;; Subword boundaries
(global-subword-mode 1)

;; Yank Pop Reverse
(global-set-key (kbd "M-Y") (lambda () (interactive) (yank-pop -1)))

;; Default window split behavior
(setq split-width-threshold 80) ;; If frame width >= 80, split vertically

;; Inhibit buffer list when opening multiple files
(setq inhibit-startup-buffer-menu t)

;; Inhibit startup screen
(setq inhibit-startup-screen t)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
