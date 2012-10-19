# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "clementine/version"

Gem::Specification.new do |s|
  s.name        = "clementine"
  s.version     = Clementine::VERSION
  s.authors     = ["Yoko Harada"]
  s.email       = ["yokolet@gmail.com"]
  s.homepage    = "https://github.com/yokolet/clementine"
  s.summary     = %q{clojurescript tilt template gem}
  s.description = %q{clojurescript tilt template gem and available to use on Rails asset pipeline.}

  s.files         = `git ls-files`.split($/)
  s.extensions    = ['Rakefile']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency "tilt"
end
