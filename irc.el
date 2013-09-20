;;; package --- Summary: my personal setup for using irc under emacs

;; This file is not part of GNU Emacs.

;;; Commentary: The Prelude thinks this should go at the top of all .el files

;;; Code:

(load "~/.emacs.d/irc-auth")
(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
      `((freenode     (("nabilhassein" . ,freenode-nabilhassein-password)))))

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#haskell #agda")))

(erc
 :server "irc.freenode.net"
 :port 6667
 :nick "nabilhassein")
