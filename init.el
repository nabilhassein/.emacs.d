;; make M-x package-install work
(require 'package)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu"       . "http://elpa.gnu.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")
        ("elpa"      . "http://tromey.com/elpa/")))
(package-refresh-contents)
(package-initialize)

(setq package-list
      '(ace-jump-mode exec-path-from-shell shell-switcher magit dirtree scala-mode2 ensime idris-mode)
      )
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/keybindings.el")

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; initialize environment, including PATH, from user shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'shell-switcher)
(setq shell-switcher-mode t)

(elscreen-start)
(elscreen-set-prefix-key (kbd "C-t"))

;; for emacsclient
(server-start)

;; keep .elc up-to-date
;;(byte-recompile-directory "~/.emacs.d" 0)

(delete-other-windows)
(fullscreen)

(require 'magit)
(global-set-key (kbd "C-c g") 'magit-grep)
(global-set-key (kbd "C-c C-g") 'magit-grep)

(add-to-list 'load-path "~/.emacs.d/elpa/dirtree/")
(require 'dirtree)
(define-key tree-mode-map (kbd "f") 'forward-char)
(define-key tree-mode-map (kbd "b") 'backward-char)
(define-key tree-mode-map (kbd "m") 'widget-button-press)

(require 'scala-mode2)
(add-to-list 'load-path "~/.emacs.d/elpa/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defadvice ensime-edit-definition (before split-window activate)
  "Jump to the tag in another window rather than trampling the current location of the buffer."
    (delete-other-windows)
    (split-window-right)
    (other-window 1))
(ad-activate 'ensime-edit-definition)

;; note that the following files are git-ignored,
;; so they must be transferred manually:
;; irc-auth, gchat-auth
;; other than this, git clone should be set up everything automatically
;;(load "~/.emacs.d/irc.el")

;; everything above ought to work on any machine with emacs24 installed
;;(load "~/.emacs.d/gchat.el")

;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string "agda-mode locate")))
