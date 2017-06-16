;;; init-w3m.el --- configure for w3m
;;; Commentary:
;;; Code:

(when (maybe-require-package 'w3m)
  (setq w3m-default-display-inline-images nil)
  (setq w3m-use-toolbar nil)

  ;;add search engines
  (eval-after-load "w3m-search"
    '(add-to-list 'w3m-search-engine-alist
                  '("baidu"
                    "http://www.baidu.com/s?wd=%s"
                    utf-8)))

  (setq w3m-search-default-engine "baidu")
  (setq w3m-home-page "http://www.baidu.com")
  (setq w3m-make-new-session t)
  (setq w3m-use-cookies t)

  (setq browse-url-browser-function 'w3m-browse-url)
  )

(global-set-key "\C-cw" 'browse-url-at-point)

(provide 'init-w3m)
;;; init-w3m ends here
