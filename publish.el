(add-to-list 'load-path (expand-file-name "site-lisp/blorg" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/templatel" user-emacs-directory))

(require 'blorg)

(blorg-gen
 :input-pattern "src/posts/.*\\.org$"
 :template "src/post.html"
 :output "output/{{ slug }}/index.html")
