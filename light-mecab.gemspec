# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'light-mecab/version'

Gem::Specification.new do |spec|
  spec.name          = 'light-mecab'
  spec.version       = LightMecab::VERSION
  spec.authors       = ['Kei Tsuchiya']
  spec.email         = ['kei.tsuchiya86@gmail.com']
  spec.description   = %q{Execute morphological analysis by MeCab}
  spec.summary       = %q{Wrapping mecab-ruby to execute morphological analysis easlily}
  spec.homepage      = 'https://github.com/kei500/light-mecab'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
end
