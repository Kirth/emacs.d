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

;; Load configuration that makes use of installed packages:
(defvar desired-packages
  '(
	cargo
	erlang
	zenburn-theme
	exwm
	go-mode
	haskell-mode
	helm
	helm-exwm
	helm-pass
	markdown-mode+
	password-store
	pg
	puppet-mode
	scala-mode
	racer
	rainbow-delimiters
	rainbow-mode
	rust-mode
	string-edit
	undo-tree
	evil
	yaml-mode
	projectile
	helm-projectile
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
		   look-and-feel
                   )))

(add-hook 'after-init-hook 'load-other-settings)
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.8)
 '(ac-delay 0.2)
 '(avy-background t)
 '(cargo-process--enable-rust-backtrace 1)
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" default)))
 '(package-selected-packages
   (quote
    (zenburn-theme yaml-mode string-edit rainbow-mode rainbow-delimiters racer puppet-mode pg markdown-mode+ helm-pass helm-exwm haskell-mode go-mode evil erlang cargo))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
