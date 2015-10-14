Pod::Spec.new do |s|
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "TIPBadgeManager"
  s.summary = "A simple module to create and manage multiple badges for iOS 8"
  s.requires_arc = true
  s.version = "0.3.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.authors = { "John Coschigano" => "john.coschigano@gmail.com" }
  s.homepage = "https://github.com/johncosch/TIPBadgeManager"
  s.source = { :git => "https://github.com/johncosch/TIPBadgeManager.git", :tag => s.version}
  s.framework = "UIKit"
  s.source_files = "Source/*.swift"
end
