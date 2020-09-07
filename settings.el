(setq ring-bell-function 'ignore)

;; the way line highlighting works is INCREDIBLY ANNOYING in the terminal
(global-hl-line-mode -1)

(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; display line numbers on left side
(global-linum-mode t) ;; TODO: except dirtree

;; display column numbers in the mode line
(column-number-mode t)

;; display the day, date and time
(setq display-time-day-and-date t)
(display-time-mode 1)

(show-paren-mode t)

;; prefer to split windows side-by-side instead of top-over-bottom
(setq split-height-threshold nil)
(setq split-width-threshold 200)


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

;; ido-mode settings
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always)
(setq confirm-nonexistent-file-or-buffer nil)
;(ido-ubiquitous-mode)
;(ido-vertical-mode)

;; reopen the same files as were previously open && remember history
(desktop-save-mode 1)
(savehist-mode 1)

;; upcase and downcase regions without having to confirm
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(set-background-color "black")
(set-foreground-color "green")

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(elscreen-start)
(elscreen-set-prefix-key (kbd "C-t"))

(add-to-list 'load-path "~/.emacs.d/elpa/dirtree/")
(require 'dirtree)
(define-key tree-mode-map (kbd "f") 'forward-char)
(define-key tree-mode-map (kbd "b") 'backward-char)
(define-key tree-mode-map (kbd "m") 'widget-button-press)

;; for emacsclient
(server-start)

;; keep .elc up-to-date
;;(byte-recompile-directory "~/.emacs.d" 0)

(fullscreen)
