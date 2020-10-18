Pod::Spec.new do |s|
  s.name = 'CountrySource'
  s.version = '1.0'
  s.summary = 'CountrySource provides list of all countries in the world.'
  s.description = <<-DESC
  CountrySource written on Swift 5.0 by levantAJ
                       DESC
  s.homepage = 'https://github.com/levantAJ/CountrySource'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Tai Le' => 'sirlevantai@gmail.com' }
  s.source = { :git => 'https://github.com/levantAJ/CountrySource.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'CountrySource/*.{swift}'
  s.resources = "CountrySource/*.{storyboard,xib,json,xcassets,lproj}"
  
end