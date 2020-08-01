(add-to-list 'load-path (expand-file-name "site-lisp/blorg" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/templatel" user-emacs-directory))

(require 'blorg)
(setq debug-on-error t)
  (blorg-cli
   :input-pattern ".*\\.org$"
   :input-filter #'blorg-input-filter-published
   :template "post.html"
   :output "output/blog/{{ slug }}.html")
