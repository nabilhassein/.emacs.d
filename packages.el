;; make M-x package-install work
(require 'package)

(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu"       . "http://elpa.gnu.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")
        ("elpa"      . "http://tromey.com/elpa/")))

(package-initialize)

(setq package-list '(ace-jump-mode dirtree windata tree-mode kv db fakir dash noflet web elscreen exec-path-from-shell haskell-mode ido-ubiquitous idris-mode prop-menu jabber magit magit-popup git-commit with-editor async magit-popup markdown-mode multi-term prop-menu scala-mode2 shell-switcher jsx-mode flycheck js2-mode json-mode))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
