;; Initializes modes I use.
;; Enable rainbow-delimiters for all things programming
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(ivy-mode 1)
(counsel-mode 1)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)



;; Python dev
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; end python

(require 'rust-mode)
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook 'cargo-minor-mode)


;; Always highlight matching brackets
(show-paren-mode 1)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(require 'visual-regexp-steroids)
(global-undo-tree-mode)

;; Use auto-complete as completion at point
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Transparently open compressed files
(auto-compression-mode t)

;; Show available key chord completions
;(which-key-mode t)

;; recent files
(recentf-mode)

;; Show previews of ace-window numbers in the mode line for each window.
(ace-window-display-mode)

;; Org mode
(require 'org)
(setq org-directory "~/Notes")

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(provide 'modes)
