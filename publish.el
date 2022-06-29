(load-file "~/.emacs.d/straight/repos/straight.el/bootstrap.el")

(straight-use-package 'templatel)
(straight-use-package 'htmlize)
(straight-use-package 'weblorg)

(setq org-html-htmlize-output-type 'css)

(require 'weblorg)

(if (string= (getenv "ENV") "prod")
    (setq weblorg-default-url "https://guilhermecomum.github.io/blog/"))

(weblorg-site :theme nil)

(weblorg-route
 :name "index"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "index.html"
 :output "index.html"
 :url "/")

;; route for rendering each post
(weblorg-route
 :name "post"
 :input-pattern "posts/*.org"
 :template "post.html"
 :output "{{ slug }}.html"
 :url "/{{ slug }}.html")

;; route for rendering each page
(weblorg-route
 :name "page"
 :input-pattern "pages/*.org"
 :template "page.html"
 :output "{{ slug }}.html"
 :url "/{{ slug }}.html")

;; route for static assets that also copies files to output directory
(weblorg-route
 :name "static"
 :url "/static/{{ file }}")

;; fire the engine and export all the files declared in the routes above
(weblorg-export)

