(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10) ; give some breathing room

;; visible bell
(setq visible-bell t)

;; make ESC quit
(global-set-key (kbd "<escape>") #'keyboard-escape-quit)

;; theme and font
(set-face-attribute 'default nil :font "Iosevka" :height 130)
(load-theme 'tango-dark t)

;; Initialize packages
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Refresh package list if needed
(unless package-archive-contents
  (package-refresh-contents))

;; Install Ivy and Counsel if needed
(dolist (pkg '(ivy counsel swiper))
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; Enable Ivy/Counsel
(require 'ivy)
(ivy-mode 1)

(require 'counsel)
(counsel-mode 1)

;; Optional: use Swiper for searching
(global-set-key (kbd "C-s") #'swiper)

;; Ivy settings
(setq ivy-use-virtual-buffers t
      ivy-count-format "(%d/%d) "
      enable-recursive-minibuffers t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



