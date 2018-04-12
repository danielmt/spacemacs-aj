(with-eval-after-load 'evil
  ;; Enable evil-mc for only prog and text, so it doesn't screw w/ magit and such
  (add-hook 'prog-mode-hook 'turn-on-evil-mc-mode)
  (add-hook 'text-mode-hook 'turn-on-evil-mc-mode)

  ;; Use more simple */# so we don't drop into symbol-highlight mode
  ;; (define-key evil-normal-state-map (kbd "*") 'evil-search-word-forward)
  ;; (define-key evil-normal-state-map (kbd "#") 'evil-search-word-backward)

  ;; Remove C-a and C-b from ex (:) so we can use the regular emacs varieties
  (define-key evil-ex-completion-map (kbd "C-a") nil)
  (define-key evil-ex-completion-map (kbd "C-b") nil)

  ;; Remove this mapping so C-z can suspend in tty
  (define-key evil-motion-state-map (kbd "C-z") nil)

  ;; Remove C-e so better-defaults take it
  (define-key evil-motion-state-map (kbd "C-e") nil)
  )

(defun minibuffer-inactive-mode-hook-setup ()
  ;; make `try-expand-dabbrev' from `hippie-expand' work in mini-buffer
  ;; @see `he-dabbrev-beg', so we need re-define syntax for '/'
  (set-syntax-table (let* ((table (make-syntax-table)))
                      (modify-syntax-entry ?/ "." table)
                      table)))
(add-hook 'minibuffer-inactive-mode-hook 'minibuffer-inactive-mode-hook-setup)

;; search by symbols in emacs
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq evil-symbol-word-search t)))

;; Make > and < round to tab stops
(setq evil-shift-round nil)
(setq evil-move-beyond-eol nil)

;; Account for our collective ability to hit escape and then another key quickly
(setq evil-esc-delay 0.001)

(provide 'init-evil)
