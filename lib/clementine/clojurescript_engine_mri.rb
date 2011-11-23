module Clementine
  class Error < StandardError; end

  class ClojureScriptEngine
    def initialize(file, options)
      @file = file
      @options = options
      # FIXME - ugly hack to override options
      @options = ["'{:output-dir \"public/assets\"}'"]
      @java = JAVA_COMMAND
      @classpath = CLASSPATH
    end

    def compile
      begin
        puts "RUNNING: #{command} #{@file} #{@options} 2>&1"
        result = `#{command} #{@file} #{@options} 2>&1`
      rescue Exception
        raise Error, "compression failed: #{result}"
      end
      unless $?.exitstatus.zero?
        raise Error, result
      end
      result
    end

    def command
      [@java, '-cp', "\"#{@classpath.join ":"}\"", 'clojure.main', "#{CLOJURESCRIPT_HOME}/bin/cljsc.clj"].flatten.join(' ')
    end
  end
end
