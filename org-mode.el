;; org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-font-lock-mode 1)
(setq org-agenda-files (directory-files "~/../../notes/work/calendar" 'absolute "[^#]*.org$" 'no-sort))
(add-hook 'org-mode-hook 'visual-line-mode)
