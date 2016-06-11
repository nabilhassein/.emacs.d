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

;; Variation of `zap-to-char'.
(defun zap-up-to-char (arg char)
  "Kill up to, but not including ARGth occurrence of CHAR.
  Case is ignored if `case-fold-search' is non-nil in the current buffer.
  Goes backward if ARG is negative; error if CHAR not found.
  Ignores CHAR at point."
  (interactive "p\ncZap up to char: ")
  (let ((direction (if (>= arg 0) 1 -1)))
    (kill-region (point)
                 (progn
                   (forward-char direction)
                   (unwind-protect
                       (search-forward (char-to-string char) nil nil arg)
                     (backward-char direction))
                   (point)))))
(global-set-key (kbd "M-Z") 'zap-up-to-char)

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

(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let* ((w1 (car (window-list)))
           (w2 (cadr (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))
  (other-window 1))

(global-set-key (kbd "C-c s") 'swap-windows)

;;; Not keybindings exactly
;; M-x qrr performs query-replace-regexp
(defalias 'qrr 'query-replace-regexp)
