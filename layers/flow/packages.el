(defconst flow-packages
  '(
    (flycheck-flow :toggle (configuration-layer/package-usedp 'flycheck))
    (company-flow :toggle (configuration-layer/package-usedp 'company))
    (tern :excluded t)
    (company-tern :excluded t)))

(defun flow/init-flycheck-flow ()
  (use-package flycheck-flow
    :config
    (progn
      (delete 'javascript-flow-coverage flycheck-checkers)
      ;; (flycheck-add-mode 'javascript-flow 'rjsx-mode)
      (flycheck-add-next-checker 'javascript-eslint 'javascript-flow)
    )))

(defun flow/init-company-flow ()
  (use-package company-flow
    :defer t
    :commands company-flow
    :init
    (spacemacs|add-company-backends
      :backends company-flow :modes js2-mode rjsx-mode)
    :config
    (add-to-list 'company-flow-modes 'rjsx-mode)))
