require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :bootstrap

task :bootstrap do
  # clojurescript home
  CLOJURESCRIPT_HOME = File.join(File.dirname(__FILE__), "ext/clojure-clojurescript-bef56a7")

  $stdout.print "Bootrapping ClojureScript"

  # command to download and create jar archives
  cmd = "#{CLOJURESCRIPT_HOME}/script/bootstrap"
  %x( #{cmd} )

  # removes unnecessary temporary directory to create google closure jar archives
  require 'fileutils'
  FileUtils.rm_rf File.join(File.dirname(__FILE__), './closure')
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end