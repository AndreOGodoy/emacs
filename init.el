(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Theme
(load-theme 'atom-one-dark t)

;; Font
(set-frame-font "Droid Sans Mono-16" t)

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
