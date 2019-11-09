
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fzy/version"

Gem::Specification.new do |spec|
  spec.name          = "fzy"
  spec.version       = Fzy::VERSION
  spec.authors       = ["John Hawthorn"]
  spec.email         = ["john@hawthorn.email"]

  spec.summary       = %q{A better fuzzy finder}
  spec.description   = %q{fzy is a fast fuzzy text selector with an advanced scoring algorithm}
  spec.homepage      = "https://github.com/jhawthorn/fzy.js"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/fzy/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "minitest"
end
