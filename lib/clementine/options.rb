module Clementine
  extend self
  @options = {}
  attr_accessor :options

  def ruby2clj(key)
    key.sub(/_/, '-')
  end
end
