(setq c-default-style
      '((java-mode . "java")
        (awk-mode . "awk")
        (other . "linux")))

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
;; overwrite shutcut key
(global-set-key "\C-co" 'overwrite-mode)

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


(require 'init-w3m nil t)


(provide 'init-local)
