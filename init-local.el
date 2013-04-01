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

;;===================for python=======================
;;dont guess, use 4
;;(setq python-guess-indent nil)
;;(setq python-indent 4)

;;====================window==========================
(defun select-next-window ()
  "Switch to the next window"
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))

(global-set-key [C-tab] 'select-next-window)
(global-set-key [C-S-iso-lefttab] 'select-previous-window)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-left] 'windmove-left)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)
;;====================================================

(require 'sr-speedbar nil t)
(global-set-key [f8] 'sr-speedbar-toggle)
(setq speedbar-tag-hierarchy-method '(speedbar-simple-group-tag-hierarchy))

(require 'init-w3m nil t)


(provide 'init-local)
