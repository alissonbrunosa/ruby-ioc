# frozen_string_literal: true

module IoC
  module Helper
    def inject(*names)
      container = Container.instance
      names.each do |name|
        define_method(name) { container.retrieve(name) }
      end
    end
  end
end
