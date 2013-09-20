;;; package --- Summary: my personal setup for using gchat under emacs

;; This file is not part of GNU Emacs.

;;; Commentary: The Prelude thinks this should go at the top of all .el files

;;; Code:

(load "~/.emacs.d/gchat-auth")
(setq jabber-account-list
      `(("nabil.hassein@gmail.com"
         (:password . ,gchat-auth)
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))))

(custom-set-variables
 '(jabber-auto-reconnect t)
 '(jabber-avatar-verbose nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(jabber-chat-buffer-format "*-jabber-%n-*")
 '(jabber-history-enabled t)
 '(jabber-mode-line-mode t)
 '(jabber-roster-buffer "*-jabber-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s (%r)")
 '(jabber-show-offline-contacts nil))

;; connect to chat at start-up
(jabber-connect-all)
(jabber-send-presence "chat" "New York, NY" 10)

;; chat notifications
(defvar libnotify-program "/usr/bin/notify-send")

(defun notify-send (title message)
  (start-process "notify" " notify"
                 libnotify-program "--expire-time=4000" title message))

(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify-send (format "(PM) %s"
                             (jabber-jid-displayname (jabber-jid-user from)))
                     (format "%s: %s" (jabber-jid-resource from) text)))
    (notify-send (format "%s" (jabber-jid-displayname from))
                 text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)
