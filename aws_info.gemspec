# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_info/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_info"
  spec.version       = AwsInfo::VERSION
  spec.authors       = ["John Thomas"]
  spec.email         = ["thomas07@vt.edu"]

  spec.summary       = %q{A simple gem to get AWS server info.}
  spec.description   = %q{A gem to provide an easy way to load the AWS
  information from a given AWS instance. Automatically detect server IP,
  Region, Availability Zone, etc. as well as instance tags}
  spec.homepage      = "https://github.com/thomas07vt/aws_info"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
