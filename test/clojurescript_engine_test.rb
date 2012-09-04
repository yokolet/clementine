require "test/unit"

class ClojureScriptEngineTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    require "#{File.join(File.dirname(__FILE__), "..", "lib", "clementine")}"
    require "#{File.join(File.dirname(__FILE__), "..", "lib", "clementine", "clojurescript_engine")}"
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_default_option
    expect = {"output_dir" => "#{Dir.pwd}"}
    engine = Clementine::ClojureScriptEngine.new("", "")
    assert_equal expect, engine.default_opts
  end

  def test_convert_options
    options = {:optimizations => :advanced,  :output_dir => "#{Dir.pwd}"}
    engine = Clementine::ClojureScriptEngine.new("", "")
    opts = engine.convert_options(options)
    opts.each do |k, v|
      assert_equal Java::clojure.lang.Keyword, k.class
      assert k.to_s == ":optimizations" || k.to_s == ":output-dir"
      assert v.to_s == ":advanced" || v.to_s == "#{Dir.pwd}"
    end
  end

  def test_created_clojure_map
    options = {:optimizations => :advanced,  :output_dir => "#{Dir.pwd}"}
    engine = Clementine::ClojureScriptEngine.new("", "")
    opts = engine.convert_options(options)
    map = PersistentHashMap.create(opts)
    map.each do |k, v|
      assert_equal Java::clojure.lang.Keyword, k.class
      assert k.to_s == ":optimizations" || k.to_s == ":output-dir"
    end
  end
end
