

Pod::Spec.new do |s|
  s.name             = 'NerdzStyle'
  s.version          = '1.1.1'
  s.summary          = 'A CSS-like way of creation and applying styles to view components'
  s.homepage         = 'https://github.com/nerdzlab/NerdzStyle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NERDZ LAB' => 'supernerd@nerdzlab.com' }
  s.source           = { :git => 'https://github.com/nerdzlab/NerdzStyle.git', :tag => s.version }
  s.social_media_url = 'https://nerdzlab.com'
  s.ios.deployment_target = '13.0'
  s.swift_versions = ['5.0']
  s.source_files = 'Sources/**/*'
end
