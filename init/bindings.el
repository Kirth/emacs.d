
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

(global-set-key (kbd "C-x o") 'ace-window)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction

;; Start eshell or switch to it if it's active.
;(global-set-key (kbd "C-x m") 'eshell)

;; Magit!
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-x p") 'ivy-browse-repositories)

;; Avy Mode
(global-set-key (kbd "M-j") 'avy-goto-char)
(global-set-key (kbd "M-p") 'avy-pop-mark)

;; Go to line with feedback
(global-set-key (kbd "M-g") 'goto-line-with-feedback)


(global-set-key (kbd "C-d") 'duplicate-line)

;; Use swiper instead of isearch
(global-set-key "\C-s" 'swiper)
;; Launch applications with completion (dmenu style!)
;(exwm-input-set-key (kbd "s-d") #'ivy-run-external-command)
;;(exwm-input-set-key (kbd "s-p") #'ivy-password-store)

;; Open a file in project:
(global-set-key (kbd "C-c f") 'project-find-file)

;; Neotree
(global-set-key [f8] 'neotree-toggle)

;; Stop accidentally opening up the HELLO buffer
(global-unset-key "\C-h")

;; Bind Meta to C-x C-m, to prevent pinky scrunching
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Dired-Subtree
(define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
(define-key dired-mode-map ";" 'dired-subtree-remove)

;; Mac -- Anne Pro
(global-set-key (kbd "<menu>") 'execute-extended-command)

(global-set-key (kbd "C-c %") 'match-paren)

(require 'string-inflection)
(global-set-key (kbd "C-c i") 'string-inflection-cycle)
(global-set-key (kbd "C-c C") 'string-inflection-camelcase)        ;; Force to CamelCase
(global-set-key (kbd "C-c L") 'string-inflection-lower-camelcase)  ;; Force to lowerCamelCase
(global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle) ;; Cycle through Java styles

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
(global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally

(global-set-key (kbd "C-s-f") 'forward-sexp)
(global-set-key (kbd "C-s-b") 'backward-sexp)

(global-set-key (kbd "s-f") 'forward-whitespace)
(global-set-key (kbd "s-b") 'backward-whitespace)

(global-set-key (kbd "s-j") 'ace-jump-mode)

;(global-unset-key "\C-x mo")
;(global-set-key (kbd "C-x mo") 'occur)

(provide 'bindings)
