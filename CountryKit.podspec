Pod::Spec.new do |s|
  s.name = 'CountryKit'
  s.version = '1.0'
  s.summary = 'CountryKit list of all countries in the world.'
  s.description = <<-DESC
  CountryKit written on Swift 5.0 by levantAJ
                       DESC
  s.homepage = 'https://github.com/levantAJ/CountryKit'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Tai Le' => 'sirlevantai@gmail.com' }
  s.source = { :git => 'https://github.com/levantAJ/CountryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'CountryKit/*.{swift}'
  s.resources = "CountryKit/*.{storyboard,xib,json,xcassets,lproj}"
  
end