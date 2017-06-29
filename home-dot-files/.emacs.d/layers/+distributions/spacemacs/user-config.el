(defun my-c-mode-common-hook ()
    "C mode customization hook."
    (c-set-style "bsd")
    (setq c-basic-offset 4
          tab-width 4
          indent-tabs-mode nil
          c-tab-always-indent t
          c-echo-syntactic-information-p t)
    (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
    (whitespace-mode 1)
    (hi-lock-mode 1)
    (hs-minor-mode 1)
    (linum-mode 1)
    (auto-revert-mode 1)
    (hl-line-mode 1)
    (toggle-truncate-lines t))

(defun my-c++-mode-hook ()
    "C++ mode customization hook."
    (add-to-list 'c-offsets-alist '(innamespace . 0))
    (c-set-offset 'substatement-open 0)
    (c-set-offset 'label '+))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
