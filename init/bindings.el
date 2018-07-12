
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; Counsel stuff:
(global-set-key (kbd "C-c r g") 'counsel-rg)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)


;; imenu instead of insert-file
(global-set-key (kbd "C-x i") 'imenu)

(global-set-key (kbd "C-x o") ; Yes, I went there!
                'ace-window)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Magit!
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-x p") 'ivy-browse-repositories)

;; Use swiper instead of isearch
(global-set-key "\C-s" 'swiper)
;; Launch applications with completion (dmenu style!)
(exwm-input-set-key (kbd "s-d") #'ivy-run-external-command)
;;(exwm-input-set-key (kbd "s-p") #'ivy-password-store)

(provide 'bindings)
