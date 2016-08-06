#
# Be sure to run `pod lib lint USStatePicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'USStatePicker'
  s.version          = '1.0.0'
  s.summary          = 'Display list of available states for an application in a UIPickerView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
USStatePicker is a custom UIPickerView that will allow you to easily display a list of states in
your application. The picker can be customized to show all 50 states or a subset of states based
on the needs of your application.
                       DESC

  s.homepage         = 'https://github.com/donnywdavis/USStatePicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Donny Davis' => 'donnywdavis@icloud.com' }
  s.source           = { :git => 'https://github.com/donnywdavis/USStatePicker.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/donnywdavis'

  s.ios.deployment_target = '9.0'

  s.source_files = 'USStatePicker/Classes/**/*'
  
  # s.resource_bundles = {
  #   'USStatePicker' => ['USStatePicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
