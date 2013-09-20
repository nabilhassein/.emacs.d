;;; package --- Summary: my global key bindings

;; This file is not part of GNU Emacs.

;;; Commentary: The Prelude thinks this should go at the top of all .el files

;;; Code:

(global-set-key (kbd "C-c x") 'clipboard-kill-region)
(global-set-key (kbd "C-c c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-c v") 'clipboard-yank)

(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "C-c =") 'align-regexp)

(global-set-key (kbd "C-c w") 'count-words)

(global-set-key (kbd "C-c C-u") 'capitalize-region)

(global-set-key (kbd "C-M-c") 'scroll-other-window-down)

;; get rid of windows line-endings visible in unix
(global-set-key (kbd "C-c C-q")
                (lambda ()
                  (interactive)
                  (mark-whole-buffer)
                  (replace-string "" "")))

(global-set-key [backtab] 'dabbrev-expand)
(global-set-key (kbd "C-<tab>") 'dabbrev-expand)

(global-set-key (kbd "C-c m") 'man)

(global-set-key (kbd "C-c j")
                (lambda ()
                  (interactive)
                  (delete-indentation 1)))

;; open a buffer in another window, but don't select it
(global-set-key (kbd "C-c b") 'ido-display-buffer)

(global-set-key (kbd "C-x m") 'browse-url)

;; enter auto-indents except in text and org-mode
(global-set-key (kbd "RET") 'newline-and-indent)
(defun no-indent-hook ()
  (local-set-key (kbd "RET") 'newline))
(add-hook 'text-mode-hook 'no-indent-hook)
(add-hook 'org-mode-hook 'no-indent-hook)
(add-hook 'asm-mode-hook 'no-indent-hook)

(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-;") 'comment-or-uncomment-region)

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

(global-set-key (kbd "C-c C-t") (lambda ()
                                (interactive)
                                (shell-command "date" "*Messages*")))


;; make sure elscreen's C-t works from ibuffer as well
(global-set-key (kbd "C-x C-b") (lambda ()
                                 (interactive)
                                 (ibuffer)
                                 (local-unset-key (kbd "C-t"))))

;;; Not keybindings exactly
;; M-x qrr performs query-replace-regexp
(defalias 'qrr 'query-replace-regexp)
