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
  s.macos.deployment_target = '10.16'
  s.swift_versions = '5.0'
  s.source_files = 'SwiftyBase/Classes/**/*'
  
  s.subspec 'App' do |app|
    app.source_files = 'SwiftyBase/Classes/**/*'
    app.dependency 'PromisesSwift'
    app.dependency 'RxSwift'
    app.dependency 'RxCocoa'
    app.dependency 'Swinject'
    app.ios.dependency 'NVActivityIndicatorView', '~> 4.8.0'
    app.dependency "PureLayout"
    app.dependency "SwiftRichString"
    app.dependency 'Alamofire'
    app.dependency 'ObjectMapper'
    app.dependency 'SwiftyJSON'
    app.dependency "Gradients"
    app.dependency 'L10n-swift'
    app.dependency 'UIWindowTransitions'
    app.dependency 'RxSwiftExt'
    app.dependency 'UIColor_Hex_Swift'
  end
  
  s.subspec 'Extension' do |ext|
    ext.source_files = 'SwiftyBase/Classes/**/*'
    ext.exclude_files = [
    'SwiftyBase/Classes/Foundation/Functions.swift',
    'SwiftyBase/Classes/Foundation/UI/**/*',
    'SwiftyBase/Classes/Foundation/Segues/**/*',
    'SwiftyBase/Classes/Foundation/Extensions/UIView.swift',
    'SwiftyBase/Classes/Foundation/Extensions/NSLayoutConstraint.swift'
    ]
    ext.dependency 'RxSwift'
    ext.dependency 'RxCocoa'
    ext.dependency 'Swinject'
    ext.dependency "SwiftRichString"
    ext.dependency 'Alamofire'
    ext.dependency 'ObjectMapper'
    ext.dependency 'SwiftyJSON'
    ext.dependency 'L10n-swift'
    ext.dependency 'RxSwiftExt'
    ext.dependency 'UIColor_Hex_Swift'
    ext.dependency 'PromisesSwift'
  end
end
