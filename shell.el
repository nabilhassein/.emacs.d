;; initialize environment, including PATH, from user shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'shell-switcher)
(setq shell-switcher-mode t)

;; see http://rawsyntax.com/blog/learn-emacs-zsh-and-multi-term/
(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))

(global-set-key (kbd "C-c C-z") (lambda ()
                                  (interactive)
                                  (multi-term)
                                  (local-unset-key (kbd "C-t"))))
