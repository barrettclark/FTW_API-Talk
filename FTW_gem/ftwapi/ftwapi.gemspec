# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ftwapi/version'

Gem::Specification.new do |spec|
  spec.name          = "ftwapi"
  spec.version       = Ftwapi::VERSION
  spec.authors       = ["Barrett Clark"]
  spec.email         = ["barrett.clark@sabre.com"]
  spec.description   = %q{Gem Wrapper Example}
  spec.summary       = %q{Gem to wrap the endpoints exposed by the FTW_api Sinatra app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", '~> 10.1'
  spec.add_development_dependency 'webmock', '~> 1.13'
  spec.add_runtime_dependency 'multi_json', '~>1.7'
  spec.add_runtime_dependency 'httparty', '~>0.11'
end
