$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'vimgolf_finder/version'

Gem::Specification.new do |s|
  s.name = 'vimgolf-finder'
  s.version = VimGolfFinder::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Lee Sun-Hyoup']
  s.email = ['kciter@naver.com']

  s.homepage = 'https://github.com/kciter/vimgolf-finder'
  s.licenses = ['MIT']
  s.summary = %q{VimGolf challenge finder.}
  s.description = %q{Simple VimGolf challenge finder.}

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'nokogiri', '~> 1.6'
  s.add_dependency 'thor', '~> 0.19.1'
  s.add_dependency 'launchy', '~> 2.0'

  s.add_development_dependency 'bundler', '~> 0'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
end