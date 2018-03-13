require "json"
package = JSON.parse(File.read(File.join(__dir__, './', 'package.json')))

Pod::Spec.new do |s|
  s.name          = package['name']
  s.version       = package['version']
  s.summary       = package['description']
  s.requires_arc  = true
  s.author        = { 'Pusher' => 'support@pusher.com' }
  s.license       = package['license']
  s.homepage      = package['homepage']
  s.source        = { :git => 'git@github.com:pusher/pusher-push-notifications-react-native.git' }
  s.platform      = :ios, '10.0'
  s.dependency      'React'
  s.dependency      'PushNotifications'
  s.source_files =  'PusherPushNotificationsReactNative/*.{h,m}'
end
