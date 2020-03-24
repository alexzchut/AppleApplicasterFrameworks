
Pod::Spec.new do |s|
  s.name = 'ZappCore'
  s.version = '0.9.2'
  s.summary = 'General Applicaster iOS and tvOS framework that provides protocol'
  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '10.0'
  s.swift_versions = '5.1'
  s.description = <<-DESC
  'General Applicaster iOS and tvOS framework that provides protocol and this lowest hierarchy layer'
  DESC

  s.homepage = 'https://github.com/applicaster/AppleApplicasterFrameworks.git'
  s.license = 'Appache 2.0'
  s.author = { 'a.kononenko@applicaster.com' => 'a.kononenko@applicaster.com' }
  s.source = { :git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :tag => "2020.3.24.12-3-3" }
  
  s.source_files = 'Frameworks/ZappCore/Files/Universal/**/*.{swift}'
  s.ios.source_files = 'Frameworks/ZappCore/Files/iOS/**/*.{swift}'
  s.tvos.source_files = 'Frameworks/ZappCore/Files/tvOS/**/*.{swift}'
  
  s.test_spec 'UnitTests' do |sp|
    sp.source_files = 'Frameworks/ZappCore/Files/Tests/**/*.{swift}'
  end
end
