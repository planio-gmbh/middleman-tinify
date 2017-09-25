$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-tinify"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gregor Schmidt - Planio GmbH"]
  s.email       = ["support@plan.io"]
  s.homepage    = "https://plan.io"
  s.summary     = %q{Minfiy images in middleman}
  s.description = %q{Uses tinify service to minimize images during your middleman build.}
  s.license = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman-core", "~> 4.2")
  s.add_runtime_dependency("tinify", "~> 1.5")

  s.add_development_dependency("aruba")
  s.add_development_dependency("bundler")
  s.add_development_dependency("capybara")
  s.add_development_dependency("cucumber")
  s.add_development_dependency("middleman-cli")
  s.add_development_dependency("rake")
end
