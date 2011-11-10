require 'tilt/template'

module Clementine
  class ClojureScriptTemplate < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def self.engine_initialized?
      true
    end

    def initialize_engine; end

    def prepare
      @engine = ClojureScriptEngine.new(@file, options)
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.compile
    end
  end
end
