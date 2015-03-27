Pod::Spec.new do |s|
  s.name             = "SPXDataValidators"
  s.version          = "1.4.0"
  s.summary          = "Form and data validators done right!"
  s.homepage         = "https://github.com/shaps80/SPXDataValidators"
  s.license          = 'MIT'
  s.author           = { "Shaps Mohsenin" => "shapsuk@me.com" }
  s.source           = { :git => "https://github.com/shaps80/SPXDataValidators.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shaps'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.dependency 'SPXDefines'
  s.source_files = 'SPXDataValidators/**/*.{h,m}'
end
