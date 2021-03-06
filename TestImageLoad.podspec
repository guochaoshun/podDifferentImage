#
# Be sure to run `pod lib lint TestImageLoad.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TestImageLoad'
  s.version          = '0.1.0'
  s.summary          = ' TestImageLoad.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TestImageLoad++++==,
  DESC

  s.homepage         = 'https://github.com/guochaoshun/TestImageLoad'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guochaoshun' => '15210134184@163.com' }
  s.source           = { :git => 'https://github.com/guochaoshun/TestImageLoad.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

#  s.source_files = 'TestImageLoad/Classes/**/*'
  
#   s.resource_bundles = {
#     'TestImageLoad' => ['TestImageLoad/Assets/*.png']
#   }

s.subspec 'AllClass' do |allClass|
    allClass.source_files = 'TestImageLoad/Classes/**/*'
end
    s.subspec 'AudioRes' do |audio|
       audio.resource_bundles = {
           'AudioImageLoad' => ['TestImageLoad/Assets/Audio/*']
         }
    end
    s.subspec 'KilaRes' do |kila|
        kila.resource_bundles = {
           'KilaImageLoad' => ['TestImageLoad/Assets/Kila/*']
         }
    end


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
