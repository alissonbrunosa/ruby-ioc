
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ioc/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby-ioc"
  spec.version       = IoC::VERSION
  spec.authors       = ["Alisson Santos"]
  spec.email         = ["alissonbruno.sa@gmail.com"]

  spec.summary       = %q{Simple IoC gem}
  spec.homepage      = "https://github.com/alissonbrunosa/ruby-ioc"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
