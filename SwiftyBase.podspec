#
# Be sure to run `pod lib lint SwiftyBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyBase'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SwiftyBase.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/markgravity/SwiftyBase'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'markgravity' => 'markgravity.in@gmail.com' }
  s.source           = { :git => 'https://github.com/markgravity/SwiftyBase.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.macos.deployment_target = '10.15'
  s.swift_versions = '5.0'
  s.source_files = 'SwiftyBase/Classes/**/*'
  
  s.source_files = 'SwiftyBase/Classes/**/*'
  s.dependency 'PromisesSwift'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'Swinject'
  s.ios.dependency 'NVActivityIndicatorView', '~> 4.8.0'
  s.dependency "PureLayout"
  s.dependency "SwiftRichString"
  s.dependency 'Alamofire'
  s.dependency 'ObjectMapper'
  s.dependency 'SwiftyJSON'
  s.ios.dependency "Gradients"
  s.dependency 'L10n-swift'
  s.ios.dependency 'UIWindowTransitions'
  s.dependency 'RxSwiftExt'
  s.dependency 'UIColor_Hex_Swift'
end
