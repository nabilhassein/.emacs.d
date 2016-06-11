(require 'scala-mode2)
(add-to-list 'load-path "~/.emacs.d/elpa/ensime/elisp/")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defadvice ensime-edit-definition (before split-window activate)
  "Jump to the tag in another window rather than trampling the current location of the buffer."
    (delete-other-windows)
    (split-window-right)
    (other-window 1))
(ad-activate 'ensime-edit-definition)
