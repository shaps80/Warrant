Pod::Spec.new do |s|
s.name             = "Warrant"
s.version          = "2.0"
s.summary          = "Form and data validators done right!"
s.homepage         = "https://github.com/shaps80/" + s.name
s.license          = 'MIT'
s.author           = { "Shaps Mohsenin" => "shapsuk@me.com" }
s.source           = { :git => "https://github.com/shaps80/" + s.name + ".git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/shaps'
s.platform         = :ios, '7.0'
s.requires_arc     = true
s.source_files     = 'Pod/Classes/**/*.swift'
end
