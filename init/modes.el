;; Initializes modes I use.
;; Enable rainbow-delimiters for all things programming
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(ivy-mode 1)
(counsel-mode 1)
(projectile-mode 1)

 (global-anzu-mode +1)


;; Python dev
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(setq elpy-rpc-python-command "python3")

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

(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

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


(setq-default tab-width 2)
(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(defun my-c-mode-hook ()
   (setq indent-tabs-mode nil
         c-basic-offset 2))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  ;(electric-pair-local-mode 1) ;; Emacs 25

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(provide 'modes)
