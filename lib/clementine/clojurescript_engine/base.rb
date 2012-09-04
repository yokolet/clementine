
module Clementine
  class ClojureScriptEngineBase
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
