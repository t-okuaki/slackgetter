# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slackgetter/version'

Gem::Specification.new do |spec|
  spec.name          = "slackgetter"
  spec.version       = Slackgetter::VERSION
  spec.authors       = ["t-okuaki"]
  spec.email         = ["t-okuaki@nekojarashi.com"]

  spec.summary       = %q{Ruby gem to get messages from slack.}
  spec.description   = %q{Ruby gem to get messages from slack.}
  spec.homepage      = "https://github.com/t-okuaki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_dependency "thor"
  spec.add_dependency "slack-api"
end
