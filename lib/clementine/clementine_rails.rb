module Clementine
  class ClementineRails < Rails::Engine
    initializer :register_clojurescript do |app|
      app.assets.register_engine '.cljs', ClojureScriptTemplate
      app.assets.register_engine '.clj', ClojureScriptTemplate
    end
  end
end
