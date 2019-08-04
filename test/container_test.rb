# frozen_string_literal: true

require "test_helper"

class ContainerTest < Minitest::Test
  def setup
    IoC::Container.init do |container|
      container.register(:integer, 10)
      container.register(:string) { "String" }
      container.register(:singleton, Object.new)
      container.register(:not_singleton) { Object.new }
    end
  end

  def test_retrieve_with_dependecy
    container = IoC::Container.instance
    string = container.retrieve(:string)
    integer = container.retrieve(:integer)

    assert_same string, "String"
    assert_same integer, 10
  end

  def test_retrieve_without_dependecy
    container = IoC::Container.instance

    assert_raises(IoC::DependencyNotFound) { container.retrieve(:nope) }
  end

  def test_singleton_dependency
    container = IoC::Container.instance
    d1 = container.retrieve(:singleton)
    d2 = container.retrieve(:singleton)

    assert_same d1, d2
  end

  def test_not_singleton_dependency
    container = IoC::Container.instance
    d1 = container.retrieve(:not_singleton)
    d2 = container.retrieve(:not_singleton)

    assert d1.object_id != d2.object_id
  end



  def teste_register_without_name
    assert_raises(ArgumentError) do
      IoC::Container.init do |container|
        register(nil, 10)
      end
    end
  end

  def test_register_withou_value
    assert_raises(ArgumentError) do
      IoC::Container.init do |container|
        container.register(:string, nil)
      end
    end
  end
end
