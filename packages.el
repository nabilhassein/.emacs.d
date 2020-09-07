;; make M-x package-install work
(require 'package)

(setq package-archives
      '(("gnu"       . "https://elpa.gnu.org/packages/")
        ("melpa"     . "https://melpa.org/packages/")
        ("elpa"      . "https://tromey.com/elpa/")))

(package-initialize)

(setq package-list '(ace-jump-mode dirtree windata tree-mode kv db fakir dash noflet web elscreen exec-path-from-shell haskell-mode idris-mode prop-menu jabber magit magit-popup git-commit with-editor async magit-popup markdown-mode multi-term prop-menu shell-switcher flycheck js2-mode json-mode rust-mode))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
