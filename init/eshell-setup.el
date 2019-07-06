;; EShell configuration

(require 'eshell)

;; Generic settings
;; Hide banner message ...
(setq eshell-banner-message "")

;(add-to-list 'exec-path (split-string "/home/kirth/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/kirth/bin:/home/kirth/.cargo/bin:/home/kirth/go/bin:/home/kirth/bin:/home/kirth/.cargo/bin:/home/kirth/go/bin:/usr/local/bin:"))

;; Prompt configuration
(defun clean-pwd (path)
  "Turns a path of the form /foo/bar/baz into /f/b/baz
   (inspired by fish shell)"
  (let* ((hpath (replace-regexp-in-string home-dir
                                          "~"
                                          path))
         (current-dir (split-string hpath "/"))
	 (cdir (last current-dir))
	 (head (butlast current-dir)))
    (concat (mapconcat (lambda (s)
			 (if (string= "" s) nil
			   (substring s 0 1)))
		       head
		       "/")
	    (if head "/" nil)
	    (car cdir))))

(defun vcprompt (&optional args)
  "Call the external vcprompt command with optional arguments.
   VCPrompt"
  (replace-regexp-in-string
   "\n" ""
   (shell-command-to-string (concat  "vcprompt" args))))

(defmacro with-face (str &rest properties)
  `(propertize ,str 'face (list ,@properties)))

(defun prompt-f ()
  "EShell prompt displaying VC info and such"
  (concat
   (with-face (concat (eshell/pwd) " ") :foreground  "#96a6c8")
   (if (= 0 (user-uid))
       (with-face "#" :foreground "#f43841")
     (with-face "$" :foreground "#73c936"))
   (with-face " " :foreground "#95a99f")))


(setq eshell-prompt-function 'prompt-f)
(setq eshell-highlight-prompt nil)
(setq eshell-prompt-regexp "^.+? \\((\\(git\\|svn\\|hg\\|darcs\\|cvs\\|bzr\\):.+?) \\)?[$#] ")

;; Ignore version control folders in autocompletion
(setq eshell-cmpl-cycle-completions nil
      eshell-save-history-on-exit t
      eshell-cmpl-dir-ignore "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.git\\)/\\'")

(add-hook 'eshell-mode-hook '(lambda ()
                               (define-key eshell-mode-map (kbd "<tab>") 'completion-at-point)))
(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

(defun eshell-mode-hook-func ()
  (setq eshell-path-env (concat "/home/kirth/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/kirth/bin:/home/kirth/.cargo/bin:/home/kirth/go/bin:/home/kirth/bin:/home/kirth/.cargo/bin:/home/kirth/go/bin:/usr/local/bin:" eshell-path-env))
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (local-set-key (kbd "C-x C-o") 'ffap) ; Open file under point in shell
)

;; Load some EShell extensions
(eval-after-load 'esh-opt
  '(progn
     (require 'em-term)
     (require 'em-cmpl)
     ;; More visual commands!
     (add-to-list 'eshell-visual-commands "ssh")
     (add-to-list 'eshell-visual-commands "tail")
     (add-to-list 'eshell-visual-commands "tig")
     (add-to-list 'eshell-visual-commands "sl")))

(setq eshell-directory-name "~/.config/eshell/")

(provide 'eshell-setup)
