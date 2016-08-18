 lib = File.expand_path("../lib", __FILE__)
 $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
 
 Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.date          = '2016-06-15'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Torie van Dijk']
   s.email         = 'victoriaevandijk@gmail.com'
   s.files         = ['lib/kele.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 
   s.add_development_dependency 'bundler'
   s.add_development_dependency 'rake', '~>10.0'
 end