$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'vimgolf_finder/version'

Gem::Specification.new do |s|
  s.name = 'vimgolf-finder'
  s.version = VimGolfFinder::VERSION
  s.authors = ['Lee Sun-Hyoup']
  s.email = ['kciter@naver.com']

  s.files = `git ls-files`.split("\n")
  s.homepage = 'https://github.com/kciter/vimgolf-finder'
  s.licenses = ['MIT']
  s.summary = %q{VimGolf challenge finder.}
  s.description = %q{Simple VimGolf challenge finder.}

  s.add_dependency 'nokogiri', '~> 1.6'
  s.add_dependency 'thor', '~> 0.19.1'

  s.add_development_dependency 'bundler', '~> 0'
  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
end