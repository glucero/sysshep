require_relative 'lib/sysshep/version'

Gem::Specification.new do |gem|

  gem.name          = 'sysshep'
  gem.version       = SysShep::VERSION

  gem.author        = 'Gino Lucero'
  gem.email         = 'glucero@gmail.com'

  gem.license       = 'MIT'

  gem.description   = 'sysshep'
  gem.summary       = 'a console application for system shepherd'
  gem.homepage      = 'https://github.com/glucero/sysshep'

  gem.files         = `git ls-files`.split(?\n)
  gem.executables   = gem.name

end

