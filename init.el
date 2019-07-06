;;; init.el --- Package bootstrapping. -*- lexical-binding: t; -*-

;; Packages are installed via Nix configuration, this file only
;; initialises the newly loaded packages.

(require 'package)
(require 'seq)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


(package-initialize)

;; Configure a few basics before moving on to package-specific initialisation.
;(setq custom-file (concat user-emacs-directory "init/custom.el"))
;(load custom-file)

(defvar home-dir)
(setq home-dir (expand-file-name "~"))

;; Seed RNG
(random t)

;; Add 'init' folder that contains other settings to load.
(add-to-list 'load-path (concat user-emacs-directory "init"))
(add-to-list 'load-path (concat user-emacs-directory "ext"))

(load "json-error") ; Todo: better handling?

;; Load configuration that makes use of installed packages:
(defvar desired-packages
  '(
        multiple-cursors
        ace-window
        frames-only-mode
	cargo
	dockerfile-mode
	erlang
	zenburn-theme
	challenger-deep-theme
;	exwm
	go-mode
	gradle-mode
	haskell-mode
	counsel
        counsel-projectile
        neotree
	;;hel m
	;; helm-exwm
	;; helm-pass
	;; helm-ag
	markdown-mode+
	password-store
        visual-regexp
        visual-regexp-steroids
	pg
	puppet-mode
        protobuf-mode
	scala-mode
	racer
	sly
	ivy
	ivy-prescient
	prescient
	magit
	rainbow-delimiters
	rainbow-mode
	rust-mode
	string-edit
	undo-tree
	evil
        js2-mode
	yaml-mode
	projectile
;;	helm-projectile
	erc
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
		   nixos
                   term-setup
                   eshell-setup
                   )))

;; todo: refactor exwm
;(require 'exwm)
;(require 'exwm-config)
;(exwm-config-default)

(add-hook 'after-init-hook 'load-other-settings)
(put 'narrow-to-region 'disabled nil)
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
 '(custom-enabled-themes (quote (challenger-deep)))
 '(custom-safe-themes
   (quote
    ("f71859eae71f7f795e734e6e7d178728525008a28c325913f564a42f74042c31" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/Notes/diary.org")))
 '(package-selected-packages
   (quote
    (frames-only-mode lorem-ipsum page-break-lines dashboard image-dired+ multiple-cursors neotree visual-regexp-steroids visual-regexp protobuf-mode racket-mode highlight-indent-guides jsx-mode web-mode kubernetes terraform-mode org-jira paradox multi-term ag counsel-projectile telephone-line counsel paredit zenburn-theme yaml-mode string-edit rainbow-mode rainbow-delimiters racer puppet-mode pg markdown-mode+ haskell-mode go-mode evil erlang cargo)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
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
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
