(add-hook 'scss-mode-hook (lambda ()
                            (setq-local company-backends '((company-css company-dabbrev-code company-gtags)))))

(provide 'init-sass)
