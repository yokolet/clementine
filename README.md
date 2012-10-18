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

```ruby
gem install clementine
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

```
  KEY                VALUES
  ------------------ -----------------------
  :optimazation      :simple,:whitespace,:advanced
  :target            :nodejs
  :output_dir        directory name (:output_dir will be converted to ":output-dir")
  :output_to         file name (:output_to will be converted to ":output-to")
```

Copyright and License
-----------
Clementine is Copyright (c) 2011-2012 [Yoko Harada](https://github.com/yokolet) and
distributed under the MIT license.

Clojure and ClojureSript are Copyright (c) Rich Hickey and covered by the Eclipse
Public License 1.0 [http://opensource.org/licenses/eclipse-1.0.php](http://opensource.org/licenses/eclipse-1.0.php)

Google Closure Compiler and Library are covered by Apache License 2.0 license.