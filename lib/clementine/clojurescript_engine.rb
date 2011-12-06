%w{RT Keyword PersistentHashMap}.each do |name|
  java_import "clojure.lang.#{name}"
end

module Clementine

  class ClojureScriptEngine
    def initialize(file, options)
      @file = file
      @options = options
    end

    def compile
      @options = Clementine.options if @options.empty?
      cl_opts = PersistentHashMap.create(convert_options(@options))
      RT.loadResourceScript("cljs/closure.clj")
      builder = RT.var("cljs.closure", "build")
      builder.invoke(@file, cl_opts)
    end

    #private
    def convert_options(options)
      opts = {}
      options = options.empty? ? default_opts : options
      options.each do |k, v|
        cl_key = Keyword.intern(Clementine.ruby2clj(k.to_s))
        case
          when (v.kind_of? Symbol)
            cl_value = Keyword.intern(Clementine.ruby2clj(v.to_s))
          else
            cl_value = v
        end
        opts[cl_key] = cl_value
      end
      opts
    end

    def default_opts
      key = "output_dir"
      value = ""
      if defined?(Rails)
        value = File.join(Rails.root, "app", "assets", "javascripts", "clementine")
      else
        value = Dir.pwd
      end
      {key => value}
    end
  end
end