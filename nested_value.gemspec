Gem::Specification.new do |gem|
  gem.name        = 'nested_value'
  gem.version     = '0.0.2'
  gem.date        = '2013-06-28'
  gem.summary     = 'Access values hidden in deeply nested data structures with ease and without fear.'
  gem.description = 'Access values hidden in deeply nested data structures with ease and without fear.'
  gem.authors     = ['Dave Moore', 'Trace Wax']
  gem.email       = 'cuvuligio@gmail.com'
  gem.files       = Dir['lib/**/*.rb'] + %w(LICENSE README.md)
  gem.homepage    = 'https://github.com/dcmoore/nested_value'

  gem.add_development_dependency('bundler')
  gem.add_development_dependency('rspec', '>= 1.2.0')
end
