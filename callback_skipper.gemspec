# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "callback_skipper/version"

Gem::Specification.new do |s|
  s.name        = "callback_skipper"
  s.version     = CallbackSkipper::VERSION
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@socialcast.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "callback_skipper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here
  s.add_runtime_dependency 'activerecord', ['>= 3.0']
  s.add_development_dependency "rake", ["0.9.2.2"]
end
