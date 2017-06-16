;;; init-local.el --- local configures
;;; Commentary:
;;; Code:

;;----------------------------------------------------------------------------
;; misc
;;----------------------------------------------------------------------------
(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (other . "linux")))

;;(setq c-auto-newline t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
;; overwrite shutcut key
(global-set-key "\C-co" 'overwrite-mode)
;;mouse auto avoid
(mouse-avoidance-mode 'animate)
;;show line number
;;(global-linum-mode t)
;;no temp file
;;(setq-default make-backup-files nil)
;;frame title
;;(setq frame-title-format "emacs@%b")
;;(setq kill-ring-max 512)

;;----------------------------------------------------------------------------
;; theme
;;----------------------------------------------------------------------------
(when (maybe-require-package 'color-theme-sanityinc-solarized)
  (setq-default custom-enabled-themes '(sanityinc-solarized-dark)))
;;set background-color to nil, so it will use terminal's background color
(add-hook 'after-make-console-frame-hooks
          (lambda () (set-frame-parameter nil 'background-color nil)))
(add-hook 'emacs-startup-hook
          (lambda () (if (not window-system)
                    (set-frame-parameter nil 'background-color nil))))

;;----------------------------------------------------------------------------
;; python
;;----------------------------------------------------------------------------
;;dont guess, use 4
;;(setq python-guess-indent nil)
;;(setq python-indent 4)

;;----------------------------------------------------------------------------
;; window
;;----------------------------------------------------------------------------
(defun select-next-window ()
  "Switch to the next window."
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window."
  (interactive)
  (select-window (previous-window)))

(global-set-key [C-tab] 'select-next-window)
(global-set-key [C-S-iso-lefttab] 'select-previous-window)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-left] 'windmove-left)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)

;;----------------------------------------------------------------------------
;; w3m
;;----------------------------------------------------------------------------
;;(require 'init-w3m nil t)

;;----------------------------------------------------------------------------
;; flycheck
;;----------------------------------------------------------------------------
(setq flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)

;;----------------------------------------------------------------------------
;; evil
;;----------------------------------------------------------------------------
(when (maybe-require-package 'evil)
  (setq-default evil-default-state 'emacs)
  (setq-default evil-toggle-key "C-c vi")
  (evil-mode 0))

;;----------------------------------------------------------------------------
;; csharp-mode
;;----------------------------------------------------------------------------
(when (maybe-require-package 'csharp-mode)
  (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  (setq auto-mode-alist (append '(("\\.cs$" . csharp-mode)) auto-mode-alist)))

;;----------------------------------------------------------------------------
;; imenu
;;----------------------------------------------------------------------------
(global-set-key [f8] 'imenu)

;;----------------------------------------------------------------------------
;; xcscope
;;----------------------------------------------------------------------------
;; use 'cscope-minor-mode to start xcscope
;;(maybe-require-package 'xcscope)
(after-load 'xcscope
  (cscope-setup)
  (setq cscope-use-relative-paths nil)
  (setq cscope-indexer-suffixes '("*.[chly]"
                                  "*.[ch]xx"
                                  "*.[ch]pp"
                                  "*.cc"
                                  "*.hh"
                                  "*.java"))
  (defun cscope-append-directory (directory)
    (interactive "DCscope append Directory: ")
    (let (src dst)
      (setq src (concat (cscope-canonicalize-directory directory) cscope-index-file))
      (setq dst (concat (cscope-search-directory-hierarchy default-directory)
                        cscope-index-file))
      (message (concat src " -> " dst))
      (call-process-shell-command
       (concat "cd " directory " && " (cscope-make-index-command directory t))
       nil nil)
      (call-process-shell-command
       (concat "cat " src " >> " dst "\n")
       nil nil)
      (delete-file src))
    )
  (define-key cscope-minor-mode-keymap "\C-cs+"  'cscope-append-directory)
  (add-hook 'java-mode-hook (function cscope-minor-mode))
  )

;;----------------------------------------------------------------------------
;; gtags
;;----------------------------------------------------------------------------
;;(maybe-require-package 'counsel-gtags)
(after-load 'counsel-gtags
  (setq-default counsel-gtags-use-suggested-key-map t)
  (add-hook 'java-mode-hook 'counsel-gtags-mode)
  (add-hook 'c++-mode-hook 'counsel-gtags-mode)
  (add-hook 'c-mode-hook 'counsel-gtags-mode))

;;----------------------------------------------------------------------------
;; email
;;----------------------------------------------------------------------------
;; for SMTP send mail, customize:
;;'(send-mail-funtion '(smtpmail-send-it))
;;'(smtpmail-smtp-server "SMTP MAIL HOST")
;;'(smtpmail-smtp-service PORT)
;;'(user-full-name "")
;;'(user-mail-address "")
;; for POP rmail, customize:
;;'(rmail-preserve-inbox t)
;;'(rmail-primary-inbox-list '("pop://USE:PASSWD@HOST:PORT"))

(provide 'init-local)
;;; init-local.el ends here
