# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easystats/version"
require "complex"
include Math

Gem::Specification.new do |s|
  s.name        = "easystats"
  s.version     = Easystats::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthew Grigajtis"]
  s.email       = ["matthew@grigajtis.org"]
  s.homepage    = ""
  s.summary     = %q{Easy to use statistics functions}
  s.description = %q{This gem contains statistics functions that are easy to use.}

  s.rubyforge_project = "easystats"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
