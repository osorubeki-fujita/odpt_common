# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odpt_common/version'

Gem::Specification.new do |spec|
  spec.name = "odpt_common"
  spec.version = OdptCommon::VERSION
  spec.authors = ["Shu Fujita"]
  spec.email = ["osorubeki.fujita@gmail.com"]

  spec.summary = "This gem provides modules for Rails Application of so called \'open data\' related to transportation network in Japan."
  spec.description = "This gem provides modules for Rails Application of so called \'open data\' related to transportation network in Japan. [Please note] This gem is a temporary version."
  spec.homepage = "https://github.com/osorubeki-fujita/odpt_common"

  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
    # raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1.6"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_development_dependency "capistrano"
  spec.add_development_dependency "deplo" , ">=0.2.1"

  spec.add_runtime_dependency "activesupport" , ">= 4.2.1"
  spec.add_runtime_dependency "positive_support" , ">= 0.4.0"
  spec.add_runtime_dependency "required_files"
  spec.add_runtime_dependency "rails_decorate_factory" , ">= 0.2.0"
end
