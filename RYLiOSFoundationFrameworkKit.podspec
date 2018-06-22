#
# Be sure to run `pod lib lint CNICGiOSFoundationFrameworkKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'RYLiOSFoundationFrameworkKit'
s.version          = '0.1.1'
s.summary          = '一个iOS app快速开发框架及工具集'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
需要在使用此库的Podfile文件开头出加入索引源：
source 'https://github.com/CocoaPods/Specs.git'
DESC

s.homepage         = 'https://github.com/Ryan-Lee/RYLiOSFoundationFrameworkKit'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'MatriksZ' => '614455714@qq.com' }
s.source           = { :git => 'https://github.com/Ryan-Lee/RYLiOSFoundationFrameworkKit.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '9.0'

s.source_files = 'RYLiOSFoundationFrameworkKit/Classes/**/*'

# s.resource_bundles = {
#   'CNICGiOSFoundationFrameworkKit' => ['CNICGiOSFoundationFrameworkKit/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
#  s.frameworks = 'UIKit', 'Foundation'

s.dependency 'Toast' , '~> 4.0'
s.dependency 'MBProgressHUD' , '~> 1.1'
s.dependency 'YTKNetwork' , '~> 2.0'
s.dependency 'YYModel' , '~> 1.0'

end
