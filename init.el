(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (require 'use-package))

(use-package magit
  :defer 1
  :ensure t)

(use-package gruvbox-theme
  :ensure t)

;; Theme
(load-theme 'gruvbox-dark-hard t)

;; Font
(set-frame-font "Iosevka-20" t)

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
(use-package recentf
  :ensure t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(use-package projectile
  :ensure t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Better QOL
(ido-mode t)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq next-line-add-newlines t)
(define-key global-map (kbd "RET") 'newline-and-indent)

(setq pixel-scroll-precision-mode t)

(setq-default show-trailing-whitespace t)

(global-auto-revert-mode 1)

(use-package smex
  :ensure t)
(global-set-key (kbd "M-x") 'smex)

;;;;;;;; LSP ;;;;;;;;
(use-package eglot
  :ensure t)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(rust-mode . ("rust-analyzer")))

(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

(use-package pyvenv
  :ensure t
  :config (pyvenv-mode 1))

;; Enable Company Mode
(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Don't litter my working directory
(setq backup-directory-alist '(("." . "~/.config/emacs/backups")))
(setq backup-by-copying t)

(use-package terminal-here
  :ensure t)
(global-set-key (kbd "s-S-<return>") #'terminal-here-launch)
(setq terminal-here-linux-terminal-command 'alacritty)

(use-package ag
  :ensure t)

(use-package org-setup
  :load-path "~/.config/emacs/configs")

