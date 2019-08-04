# frozen_string_literal: true

require "singleton"
require "ioc/dependency"

module IoC
  class Container
    include Singleton

    def initialize
      @depedencies = Hash.new
      @mutex = Mutex.new
    end

    def self.init
      yield(instance)
      instance
    end

    def register(name, value = nil, &block)
      raise ArgumentError, "WTF dude?" unless name && (value || block)

      synchronized do
        dependency = if block_given?
                       Dependency.new(block)
                     else
                       Dependency.new(value, singleton: true)
                     end

        depedencies[name] = dependency
      end
    end

    def retrieve(name)
      synchronized do
        dependency = depedencies.fetch(name)
        dependency.call
      end
    rescue KeyError
      raise DependencyNotFound, "Dependency not found"
    end

    private

    attr_reader :depedencies, :mutex

    def synchronized(&block)
      mutex.synchronize(&block)
    end
  end
end
