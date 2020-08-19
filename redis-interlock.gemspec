require_relative 'lib/redis/interlock/version'

Gem::Specification.new do |spec|
  spec.name          = 'redis-interlock'
  spec.version       = Redis::Interlock::VERSION
  spec.summary       = 'Simple redis lock'
  spec.description   = 'Implementation of mutex in Redis'
  spec.authors       = ['Andrey Lun\'s']
  spec.email         = ['andxors@gmail.com']
  spec.homepage      = 'https://github.com/andxors/redis-interlock'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb', 'bin/*', '[A-Z]*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.7'
  spec.add_development_dependency 'bundler',       '~> 2.1'
  spec.add_development_dependency 'bundler-audit', '~> 0.7'
  spec.add_development_dependency 'rspec',         '~> 3.9'
  spec.add_development_dependency 'rubocops',      '~> 0.1'
  spec.add_development_dependency 'simplecov',     '~> 0.18'
  spec.add_runtime_dependency 'redis',   '~> 4.2'
  spec.add_runtime_dependency 'redlock', '~> 1.2'
end
