require 'rake/testtask'

task :default => :bootstrap

task :bootstrap do
  # clojurescript home
  CLOJURESCRIPT_HOME = File.join(File.dirname(__FILE__), "ext/clojure-clojurescript-16bf7d9")

  $stdout.print "Bootrapping ClojureScript"

  # command to download and create jar archives
  cmd = "#{CLOJURESCRIPT_HOME}/script/bootstrap"
  %x( #{cmd} )

  # removes unnecessary temporary directory to create google closure jar archives
  require 'fileutils'
  FileUtils.rm_rf File.join(File.dirname(__FILE__), './closure')

  # move libraries to clojurescript lib
  FileUtils.mkdir File.join(CLOJURESCRIPT_HOME, 'lib')
  FileUtils.mv Dir.glob('lib/*.jar'), File.join(CLOJURESCRIPT_HOME, 'lib')
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end