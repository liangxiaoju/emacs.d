(setq w3m-default-display-inline-images nil)
(setq w3m-use-toolbar nil)

;;add search engines
(eval-after-load "w3m-search"
  '(add-to-list 'w3m-search-engine-alist
                '("baidu"
                  "http://www.baidu.com/s?wd=%s"
                   utf-8)))

(setq w3m-search-default-engine "google")
(setq w3m-home-page "http://www.google.com")
(setq w3m-make-new-session t)
(setq w3m-use-cookies t)

(setq browse-url-browser-function 'w3m-browse-url)
(global-set-key "\C-cw" 'browse-url-at-point)

(provide 'init-w3m)
