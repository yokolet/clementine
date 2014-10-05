Clementine
====

* https://github.com/yokolet/clementine
* http://yokolet.blogspot.com/2012/10/clementine-gem-clojurescript-on-rails.html

Description
-----------

Clementine is a gem to use ClojureScript (https://github.com/clojure/clojurescript) in Ruby projects.
Clementine is a Tilt (https://github.com/rtomayko/tilt) Template, which works with Tilt on its own, as well as the Rails asset pipeline.

You don't need to compile ClojureScript by yourself anymore. Clementine does this for you.

Clementine runs on Rails 3.1 and later.

Clementine supports JRuby and CRuby. When you use from CRuby, make sure java command is on your PATH.

Please be aware, when you run Clementine on CRuby, you hook up the JVM everytime ClojureScript code is changed.
This takes long time since starting JVM is a heavy weight job.
For a shorter compilation time, JRuby is recommended.

Installation
-----------

```ruby
gem install clementine
```

While installing this gem, you'll see a confusing phrase, "Installing Clementine (version string) with native extensions."
This means Clementine is bootstrapping ClojureScript. Clementine never relies on any C library.

Configuration
-----------

Create clementine.rb file in your ${Rails.root}/config/initializer directory.

Example:

```ruby
Clementine.options[:optimizations] = :whitespace
Clementine.options[:pretty_print] = true
```

Available options:

```
  KEY                VALUES                  DEFAULT
  ------------------ ----------------------- -------------------
  :optimizations     :whitespace, :advanced  :advanced
  :pretty_print      false, true             false
  :target            :nodejs                 (none)
  :output_dir        directory name          (none)
  :output_to         file name               (none)
```

*note*<br/>
If you want to see a readable JavaScript code on the browser,
set :whitespace for :optimizations and true for :pretty_print in
${Rails.root}/config/initializer/clementine.rb like the example above.

*note*<br/>
ClojureScript has a :none value for :optimizations, which also works with Clementine.
However, there's no way to see the output with the Rails asset pipeline.
So, I didn't add :none in the above table.

Copyright and License
-----------
Clementine is Copyright (c) 2011-2012 [Yoko Harada](https://github.com/yokolet) and
distributed under the MIT license.

Clojure and ClojureSript are Copyright (c) Rich Hickey and covered by the Eclipse
Public License 1.0 [http://opensource.org/licenses/eclipse-1.0.php](http://opensource.org/licenses/eclipse-1.0.php)

Google Closure Compiler and Library are covered by Apache License 2.0.
