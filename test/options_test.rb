require "test/unit"

class OptionsTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    require "#{File.join(File.dirname(__FILE__), "..", "lib", "clementine", "options")}"
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_ruby2clj
    assert_equal "output-dir", Clementine.ruby2clj("output_dir")
    assert_equal "output-to", Clementine.ruby2clj("output_to")
  end
end