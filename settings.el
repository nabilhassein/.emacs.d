;; I hate and despise the bell
(setq ring-bell-function 'ignore)

;; the way line highlighting works is INCREDIBLY ANNOYING in the terminal
(global-hl-line-mode -1)

;; Get rid of startup screen
(setq inhibit-startup-message t)

;; get rid of menu bar, toolbar, scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers on left side
(global-linum-mode t)

;; display column numbers in the mode line
(column-number-mode t)

;; display the day, date and time
(setq display-time-day-and-date t)
(display-time-mode 1)

;; show matching parenthesis
(show-paren-mode t)

;; prefer to split windows side-by-side instead of top-over-bottom
(setq split-height-threshold nil)
(setq split-width-threshold 200)

;; get rid of "please answer yes or no" nonsense
(fset 'yes-or-no-p 'y-or-n-p)

;; don't confirm opening large files
(setq large-file-warning-threshold nil)

;; tab inserts two spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; place backup files in their own directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
;; don't clobber sym-links
(setq backup-by-copying t)

;; place auto-save files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-font-lock-mode 1)

;; ido-mode settings
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)
(setq confirm-nonexistent-file-or-buffer nil)
;(ido-ubiquitous-mode)
;(ido-vertical-mode)

;; reopen the same files as were previously open
(desktop-save-mode 1)

;; remember history
(savehist-mode 1)

;; upcase and downcase regions without having to confirm
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; markdown mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'visual-line-mode)

;; haskell mode
(setq haskell-program-name "ghci")
(setq inferior-haskell-find-project-root nil)

(set-background-color "black")
(set-foreground-color "green")
