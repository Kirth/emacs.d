(require 'uniquify)

;(require 'prescient)
;(require 'ivy-prescient)
;;(require 'ivy-pass)

(ivy-mode 1)
(counsel-mode 1)
(global-display-line-numbers-mode)

;(require 'git-gutter-fringe+)
(global-git-gutter+-mode)

;(ivy-prescient-mode)
;(prescient-persist-mode)
;(add-to-list 'ivy-prescient-excluded-commands 'counsel-rg)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; We don't live in the 80s, but we're also not a shitty web app.
(setq gc-cons-threshold 20000000)

(setq uniquify-buffer-name-style 'forward)

; Fix some defaults
(setq visible-bell nil
      inhibit-startup-message t
      color-theme-is-global t
      sentence-end-double-space nil
      shift-select-mode nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(face spaces tabs newline space-mark tab-mark newline-mark )
      whitespace-line-column 80
      whitespace-display-mappings ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
        '(
          (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
          (newline-mark 10 [182 10]) ; LINE FEED,
          (tab-mark 9 [9655 9] [92 9]) ; tab
          )
      default-directory "~"
      fill-column 80
      ediff-split-window-function 'split-window-horizontally)

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

(set-default 'indent-tabs-mode nil)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Make emacs behave sanely (overwrite selected text)
(delete-selection-mode 1)

;; Keep your temporary files in tmp, emacs!
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; Show time in 24h format
(setq display-time-24hr-format t)

;; Make ace-window behave in a sane way:
(setq aw-keys '(?f ?j ?d ?k ?s ?l ?a)) ; Homerow keys in sensible order!
(setq aw-scope 'frame) ; There are many frames in exwm, I don't care!

;; Configure pinentry for use with GPG
;(setq epa-pinentry-mode 'loopback)
;(pinentry-start)
(setq magit-repository-directories '(("/Users/kirth/Work" . 2)
                                     ("/Users/kirth/Playground" . 2)
                                     ))

(setq-default dired-details-hidden-string "--- ")
(setq dired-dwim-target t)

; macOS' ls doesn't support --dired
(when (string= system-type "darwin")
  (setq dired-use-ls-dired t
        insert-directory-program "/usr/local/bin/gls"
        dired-listing-switches "-aBhl --group-directories-first"))


;  emacs _should_ feel snappier
(add-hook 'focus-out-hook #'garbage-collect)

(provide 'settings)
