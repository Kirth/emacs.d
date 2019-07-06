(require 'org)
(setq org-directory "~/Notes")
(setq org-agenda-files '("~/Notes/diary.org"))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;(setq org-default-notes-file (concat org-directory "/notes.org"))
;(define-key global-map "\C-cc" 'org-capture)

(define-key global-map (kbd "C-c a") 'org-agenda)


(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
        "* TODO %?\n  %i\n  %a")
   ("j" "Journal" entry (file+olp+datetree "~/org/journal.org")
    "* %?\nEntered on %U\n  %i\n  %a")))

