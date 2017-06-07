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
;; set default font size
;; (set-face-attribute 'default nil :height 130)
;; or set font size in custom-set-faces as below
;;(custom-set-faces '(default ((t (:height 130 :font "Inconsolata-14")))))
;;(set-frame-font "inconsolata-14")
;;(add-to-list 'default-frame-alist '(font . "Inconsolata-14"))

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

(require 'xcscope)
(cscope-setup)
(setq cscope-use-relative-paths nil)
(add-hook 'java-mode-hook (function cscope-minor-mode))
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

(global-set-key "\C-cs+" 'cscope-append-directory)

(require 'init-w3m nil t)

(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs)

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(provide 'init-local)
