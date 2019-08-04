# frozen_string_literal: true

module IoC
  class Dependency
    def initialize(value, singleton: false)
      @value = value
      @singleton = singleton
    end

    def call
      singleton ? value : value.call
    end

    private

    attr_reader :value, :singleton
  end
end
