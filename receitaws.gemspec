$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require "receitaws/version"

Gem::Specification.new do |spec|
  spec.name          = "receitaws"
  spec.version       = Receitaws::VERSION
  spec.authors       = ["Raphael Monteiro", "Luis Henrique"]
  spec.email         = ["rmonteiro89@hotmail.com", "luis.lhsc@gmail.com"]

  spec.summary       = "Colecao de metodos para consumir o API ReceitaWS"
  spec.description   = "Api ReceitaWS"
  spec.homepage      = "https://github.com/rmonteiro89/receitaws-ruby.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 2.0"
  spec.add_dependency "rest-client", "~> 2.0"

  spec.files = Dir['lib/**/*.rb']
  spec.test_files    = `git ls-files -- test/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']
end
