;;; package --- Summary: my personal setup for using irc under emacs

;; This file is not part of GNU Emacs.

;;; Commentary: The Prelude thinks this should go at the top of all .el files

;;; Code:

(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#idris")))

(erc
 :server "irc.freenode.net"
 :port 6667
 :nick "nabilhassein")
