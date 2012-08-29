# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "callback_skipper/version"

Gem::Specification.new do |s|
  s.name        = "callback_skipper"
  s.version     = CallbackSkipper::VERSION
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@codecrate.com"]
  s.homepage    = ""
  s.summary     = %q{Skip ActiveRecord callbacks}
  s.description = %q{programatically skip ActiveRecord callbacks}

  s.rubyforge_project = "callback_skipper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here
  s.add_runtime_dependency 'activerecord', ['>= 3.0']
  s.add_development_dependency 'rake', ['0.9.2.2']
  s.add_development_dependency('sqlite3', ['>= 1.3.5'])
  s.add_development_dependency('rspec', ['>= 2.11.0'])
  s.add_development_dependency('pry', ['>= 0'])

end
