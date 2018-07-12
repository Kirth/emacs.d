;; Initializes modes I use.
;; Enable rainbow-delimiters for all things programming
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(ivy-mode 1)
(counsel-mode 1)

;; Always highlight matching brackets
(show-paren-mode 1)
;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Transparently open compressed files
;(auto-compression-mode t)

;; Show available key chord completions
;(which-key-mode t)

;; Show previews of ace-window numbers in the mode line for each window.
(ace-window-display-mode)

(provide 'modes)
