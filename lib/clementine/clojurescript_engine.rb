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

    private
    def convert_options(options)
    opts = {}
    options.each do |k, v|
      cl_key = Keyword.intern(Clementine.ruby2clj(k.to_s))
      case
        when (v.kind_of? Symbol)
          cl_value = Keyword.intern(Clementine.ruby2clj(v.to_s))
        else
          cl_value = "\"" + v + "\""
      end
      opts[cl_key] = cl_value
    end
    opts.empty? ? default_opts : opts
    end

    def default_opts
      cl_key = Keyword.intern("optimizations")
      cl_value = Keyword.intern("advanced")
      {cl_key => cl_value}
    end
  end
end