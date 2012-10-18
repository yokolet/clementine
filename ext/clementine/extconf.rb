# clojurescript home
CLOJURESCRIPT_HOME = File.join(File.dirname(__FILE__), "../clojure-clojurescript-bef56a7")

# command to download and create jar archives
cmd = "#{CLOJURESCRIPT_HOME}/script/bootstrap"
%x( #{cmd} )

# removes unnecessary google clojure directory
require 'fileutils'
FileUtils.rm_rf File.join(File.dirname(__FILE__), '../closure')