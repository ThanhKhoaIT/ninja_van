
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ninja_van/version"

Gem::Specification.new do |spec|
  spec.name          = "ninja_van"
  spec.version       = NinjaVan::VERSION
  spec.authors       = ["KhoaRB"]
  spec.email         = ["ThanhKhoaIT@gmail.com"]

  spec.summary       = %q{NinjaVan API Caller for Ruby}
  spec.description   = %q{NinjaVan 3PL shipping service API Caller for Ruby}
  spec.homepage      = "https://github.com/ThanhKhoaIT/ninja_van"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["documentation_uri"] = "https://github.com/ThanhKhoaIT/ninja_van/#setup-for-rails"
    spec.metadata["bug_tracker_uri"] = "https://github.com/ThanhKhoaIT/ninja_van/issues"
    spec.metadata["wiki_uri"] = "https://github.com/ThanhKhoaIT/ninja_van/wiki"
    spec.metadata["changelog_uri"] = "https://github.com/ThanhKhoaIT/ninja_van/releases"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "http", "~> 4.1.1"
end
