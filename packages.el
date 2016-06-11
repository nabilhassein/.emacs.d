;; make M-x package-install work
(require 'package)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu"       . "http://elpa.gnu.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")
        ("elpa"      . "http://tromey.com/elpa/")))
(package-refresh-contents)
(package-initialize)
