# frozen_string_literal: true

require "test_helper"

class A; end

class HelperTest < Minitest::Test
  def initialize_container
    IoC::Container.init do |container|
      container.register(:string, "String")
    end
  end

  def inject_dependecy
    A.inject(:string)
  end

  def setup
    initialize_container
    inject_dependecy
  end

  def test_method_addition
    a = A.new

    assert a.respond_to?(:string)
  end

  def test_method_value
    a = A.new

    assert a.string == "String"
  end
end
