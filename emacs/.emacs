

; (add-to-list 'default-frame-alist `(font . "Iosevka 20"))
; (tool-bar-mode -1)
; (menu-bar-mode -1)
; (global-display-line-numbers-mode)
;
; (ido-mode 1)
; (ido-everywhere 1)
;
;
;  (require 'package) (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;
; ;; Evil stuff 
; ;; Add this to your init.el or ~/.emacs.d/init.el
; (unless (package-installed-p 'evil)
;   (package-refresh-contents)
;   (package-install 'evil))
;
; (require 'evil)
; (evil-mode 1)
;
; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(custom-enabled-themes '(gruber-darker))
;  '(custom-safe-themes
;    '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
;      default))
;  '(display-line-numbers-type 'visual)
;  '(inhibit-startup-screen t)
;  '(package-selected-packages '(evil gruber-darker-theme)))
; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  )
; ;; Make package menu use Evil normal mode
; (add-hook 'package-menu-mode-hook 'evil-normal-state)
;
; (defun test ()
;   (interactive)
;   (message "testing"))
;
; (eval-after-load "custom"
;   '(evil-define-key 'normal custom-mode-map "q" #'test))
