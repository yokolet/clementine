Clementine
====

* https://github.com/yokolet/clementine
* http://yokolet.blogspot.com/2011/11/clojurescript-on-rails-asset-pipeline.html
* http://yokolet.blogspot.com/2011/11/tilt-template-for-clojurescript.html

Description
-----------

Clementine is a gem to use ClojureScript (https://github.com/clojure/clojurescript) from Ruby.
Clementine is a Tilt (https://github.com/rtomayko/tilt) Template, which is available to use
on Rails asset pipeline. Also, it is avilable to use in a Tilt way.

Clementine runs on Rails 3.1 and later.

Clementine supports JRuby and CRuby. When you use from CRuby, make sure java command is on your PATH.

Installation
-----------

Clone https://github.com/yokolet/clementine, then
edit your Gemfile with specific path to Clemetine.

For example:
```ruby
gem 'clementine', :path => "/Users/yoko/Projects/clementine"
```

Configuration
-----------

Create clementine.rb file in your ${Rails.root}/config/initializer directory.

Examples:
```ruby
Clementine.options[:optimizations] = :simple
Clementine.options[:output_dir] = "assets/javascripts"
```

Available options:
  KEY                VALUES
  ------------------ -----------------------
  :optimazation      :simple,:whitespace,:advanced
  :target            :nodejs
  :output_dir        directory name (:output_dir will be converted to ":output-dir")
  :output_to         file name (:output_to will be converted to ":output-to")

