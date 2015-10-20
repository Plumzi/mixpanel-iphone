Pod::Spec.new do |s|
  s.name         = 'Mixpanel'
  s.version      = '2.9.0'
  s.summary      = 'iPhone tracking library for Mixpanel Analytics'
  s.homepage     = 'https://mixpanel.com'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Mixpanel, Inc' => 'support@mixpanel.com' }
  s.platforms    = { :ios => '8.0', :tvos => '9.0' }
  s.source       = { :git => 'https://github.com/mixpanel/mixpanel-iphone.git', :tag => "v#{s.version}" }
  s.requires_arc = true
  s.default_subspec = 'Mixpanel'

  s.subspec 'Mixpanel' do |ss|
    ss.source_files  = 'Mixpanel/**/*.{m,h}', 'Mixpanel/**/*.swift'
    ss.tvos.exclude_files = 'Mixpanel/**/*Controller.{h,m}'
    ss.resources = ['Mixpanel/**/*.{png,storyboard}']
    ss.ios.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration', 'CoreTelephony', 'Accelerate', 'CoreGraphics', 'QuartzCore'
    ss.tvos.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration', 'Accelerate', 'CoreGraphics', 'QuartzCore'
    ss.libraries = 'icucore'
  end

  s.subspec 'AppExtension' do |ss|
    ss.source_files  = ['Mixpanel/Mixpanel.{m,h}', 'Mixpanel/MPLogger.h', 'Mixpanel/NSData+MPBase64.{m,h}' ]
    ss.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) MIXPANEL_APP_EXTENSION'}
    ss.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration', 'CoreTelephony', 'Accelerate', 'CoreGraphics', 'QuartzCore'
    ss.libraries = 'icucore'
  end
end
