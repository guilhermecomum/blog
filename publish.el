(add-to-list 'load-path (expand-file-name "site-lisp/blorg" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/templatel" user-emacs-directory))

(require 'blorg)

(blorg-gen
 :input-pattern "posts/.*\\.org$"
 :template "post.html"
 :template-dir "./"
 :output "output/{{ slug }}/index.html")
