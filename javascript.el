(setq jsx-indent-level 4)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . jsx-mode))

(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
