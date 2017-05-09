# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'c80_git_bash/version'

Gem::Specification.new do |spec|
  spec.name          = 'c80_git_bash'
  spec.version       = C80GitBash::VERSION
  spec.authors       = ['C80609A']
  spec.email         = ['c080609a@gmail.com']

  spec.summary       = 'c80_git_bash'
  spec.description   = 'Утилиты для работы с git'
  spec.homepage      = 'http://ecotrip.me'
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'git', '~> 1.3'

  spec.add_dependency 'git', '~> 1.3'

end
