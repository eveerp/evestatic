# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'evestatic/version'

Gem::Specification.new do |spec|
  spec.name          = "evestatic"
  spec.version       = Evestatic::VERSION
  spec.authors       = ["Marv Cool"]
  spec.email         = ["marv@hostin.is"]
  spec.description   = %q{A Ruby gem with CCPs EVE-Online static dump data}
  spec.summary       = %q{A Ruby gem with CCPs EVE-Online static dump data
                          encapsulated in an easy to use ruby interface.
                          Has Regions, Stations and Itemtypes.
                         }
  spec.homepage      = ""
  spec.license       = "MIT and CCPs License for their static dumps"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
