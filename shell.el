;; initialize environment, including PATH, from user shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'shell-switcher)
(setq shell-switcher-mode t)

(global-set-key (kbd "C-c C-z") (lambda ()
                                  (interactive)
                                  (multi-term)
                                  (local-unset-key (kbd "C-t"))))
