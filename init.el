;; make M-x package-install work
(require 'package)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu"       . "http://elpa.gnu.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")
        ("elpa"      . "http://tromey.com/elpa/")))
(package-refresh-contents)
(package-initialize)

(load "~/.emacs.d/settings.el")
(load "~/.emacs.d/keybindings.el")

;; initialize environment, including PATH, from user shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'shell-switcher)
(setq shell-switcher-mode t)

(elscreen-start)
(elscreen-set-prefix-key (kbd "C-t"))

(elnode-init)

;; for emacsclient
(server-start)

;; keep .elc up-to-date
(byte-recompile-directory "~/.emacs.d" 0)

(delete-other-windows)
(fullscreen)


;; note that the following files are git-ignored,
;; so they must be transferred manually:
;; irc-auth, gchat-auth
;; other than this, git clone should be set up everything automatically
(load "~/.emacs.d/irc.el")

;; everything above ought to work on any machine with emacs24 installed
(load "~/.emacs.d/gchat.el")

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
