# frozen_string_literal: true

require "ioc/version"
require "ioc/container"
require "ioc/core_ext/all"

module IoC
  class DependencyNotFound < StandardError; end
end
