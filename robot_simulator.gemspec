# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "robot_simulator/version"

Gem::Specification.new do |spec|
  spec.name          = "robot_simulator"
  spec.version       = RobotSimulator::VERSION
  spec.authors       = ["maryam-b"]
  spec.email         = ["m.bahrami.zj@gmail.com"]

  spec.summary       = 'Toy Robot Simulator'
  spec.description   = 'This gem is a simulation of a toy robot moving on a square tabletop.'
  spec.homepage      = 'https://github.com/maryam-b/robot_simulator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables  = ['robot_simulator']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
end
