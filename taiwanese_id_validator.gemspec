Gem::Specification.new do |spec|
  spec.name          = "taiwanese_id_validator"
  spec.version       = "0.0.1"
  spec.authors       = ["Wayne Chu"]
  spec.email         = ["wayne.5540@gmail.com"]
  spec.summary       = "Taiwanese Id Validator."
  spec.description   = "Taiwanese Id Validator"
  spec.homepage      = "https://github.com/wayne5540/taiwanese_id_validator"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.require_paths = ["lib"]


  spec.add_dependency "activemodel"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
