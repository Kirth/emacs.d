;;; init.el --- Package bootstrapping. -*- lexical-binding: t; -*-

;; Packages are installed via Nix configuration, this file only
;; initialises the newly loaded packages.

(require 'package)
(require 'seq)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(menu-bar-mode t)
(setenv "PATH" (concat "/Users/kirth/.cargo/bin:" (concat "/usr/local/bin:" (getenv "PATH"))))

;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))

;; Configure a few basics before moving on to package-specific initialisation.
;(setq custom-file (concat user-emacs-directory "init/custom.el"))
;(load custom-file)

(defvar home-dir)
(setq home-dir (expand-file-name "~"))

;; Seed RNG
(random t)

;; Start server
(server-start)

;; Add 'init' folder that contains other settings to load.
(add-to-list 'load-path (concat user-emacs-directory "init"))
;(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))


;; Load configuration that makes use of installed packages:
(defvar desired-packages
  '(
	challenger-deep-theme
	counsel
	dockerfile-mode
	doom-modeline
	erlang
	expand-region
	go-mode
	gradle-mode
	haskell-mode
	ivy
	ivy-prescient
	magit
	markdown-mode+
	nix-mode
	password-store
	pg
	prescient
	projectile
	puppet-mode
	racer
	rainbow-delimiters
	rainbow-mode
	rust-mode
	scala-mode
	sly
	string-edit
	string-inflection
	undo-tree
	yaml-mode
        ace-window
        ag
        cargo
        counsel-projectile
        dired-subtree
        elpy
        flycheck
        frames-only-mode
        groovy-mode
        indent-tools
        multiple-cursors
        neotree
        protobuf-mode
        py-autopep8
        visual-regexp
        visual-regexp-steroids
        which-key
    anzu
  shell-switcher
    ))

(defun installable-packages (pkg-list)
  (seq-filter (lambda (p) (not (package-installed-p p))) pkg-list))

(defun install-needed-packages (pkg-list)
  (let ((to-install (installable-packages pkg-list)))
    (if (< 0 (length to-install))
      (progn (package-refresh-contents)
	     (mapcar #'package-install to-install))
      (message "No new packages to install."))))

(install-needed-packages desired-packages)

;; Emacs will automatically initialise all installed packages.
;; After initialisation, proceed to load configuration that requires packages:
(defun load-other-settings ()
  (mapc 'require '(modes
                   bindings
                   custom
                   functions
                   look-and-feel
                   settings
                   term-setup
                   eshell-setup
                   rust-setup
                   )))

(add-hook 'after-init-hook 'load-other-settings)
(put 'narrow-to-region 'disabled nil)




;; god knows what this autogen stuff is


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.8)
 '(ac-delay 0.2)
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(avy-background t)
 '(cargo-process--enable-rust-backtrace 1)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(challenger-deep))
 '(custom-safe-themes
   '("7a3dde6f39d2e02e8bf6059c7ac1de729600c53e9826ddf2b8a9db56eaaf3fd9" "ffb05ecdb8ba03e0f7ec658165f695fe66446d151fd2c755fbc8a3ec10fa5098" "4ce13ab8b7a8b44ed912a74312b252b0a3ad79b0da6b1034c0145b1fcfd206cb" "f71859eae71f7f795e734e6e7d178728525008a28c325913f564a42f74042c31" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" default))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(org-agenda-files '("~/Notes/diary.org"))
 '(package-selected-packages
   '(nix-mode omnisharp csharp-mode smex vterm exec-path-from-shell rustic lsp-mode git-gutter-fringe+ git-gutter+ mark-multiple phps-mode company kotlin-mode nov expand-region string-inflection emojify anzu shell-switcher swift-mode list-packages-ext major-mode-hydra which-key indent-tools indent-guide doom-modeline ace-jump-mode groovy-mode dired-subtree lua-mode cider clojure-mode git-gutter git-link py-autopep8 flycheck elpy company-prescient frames-only-mode lorem-ipsum page-break-lines image-dired+ multiple-cursors neotree visual-regexp-steroids visual-regexp protobuf-mode racket-mode highlight-indent-guides jsx-mode web-mode kubernetes terraform-mode org-jira paradox multi-term ag counsel-projectile telephone-line counsel paredit zenburn-theme yaml-mode string-edit rainbow-mode rainbow-delimiters racer puppet-mode pg markdown-mode+ haskell-mode go-mode evil erlang cargo))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(rust-cargo-bin "/usr/local/bin/cargo")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
