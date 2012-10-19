CLOJURESCRIPT_HOME = File.join(File.dirname(__FILE__), "../../ext/clojure-clojurescript-bef56a7")
CLOJURESCRIPT_LIB = File.join(File.dirname(__FILE__), "..")

if defined?(RUBY_ENGINE) && RUBY_ENGINE == "jruby"
  require "clementine/clojurescript_engine/jruby"
elsif defined?(RUBY_ENGINE) && RUBY_ENGINE == "ruby"
  require "clementine/clojurescript_engine/mri"
else
  raise LoadError, "No ClojureScriptEngine implementation for this ruby."
end
