(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

;; Theme
(load-theme 'atom-one-dark t)

;; Font
(set-frame-font "Iosevka-16" t)

;; Hide menus
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Line number and line highlight
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

;; Copy-and-paste X11
(setq select-enable-primary nil)
(setq select-enable-clipboard t)

;; Supress start-up screen
(setq inhibit-startup-screen t)

;; Make magit open fullscreen
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

;; Create recent files menu/key-binding
(use-package recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Key-binding for compile
(global-set-key "\C-c\ \C-c" 'compile)
;; Better QOL
(ido-mode t)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(global-set-key (kbd "M-x") 'smex)

;;;;;;;; LSP ;;;;;;;;
(use-package eglot)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))

(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

(use-package pyvenv
  :config (pyvenv-mode 1))

;; Enable Company Mode
(add-hook 'after-init-hook 'global-company-mode)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't litter my working directory
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))
(setq backup-by-copying t)

