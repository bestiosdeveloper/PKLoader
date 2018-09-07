#
#  Be sure to run `pod spec lint PKLoader.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "PKLoader"
  s.version      = "0.0.1"
  s.summary      = "A Swift based helper class that will provide the loader for your application, on a view or on the window."

  s.description  = <<-DESC
This framework will help you to show the diffrent type of loader in your application while you performing any type of task, like backgound taks, rest api, any calculation etc.
                   DESC

  s.homepage     = "https://github.com/kumarpramod017/PKLoader"
  s.screenshots  = "https://github.com/kumarpramod017/PKLoader/PKLoader.gif"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Pramod Kumar" => "kumarpramod017@gmail.com" }
  s.social_media_url   = "http://pramodkumar.cf/"

  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/kumarpramod017/PKLoader.git", :tag => "#{s.version.to_s}" }
  s.source_files  = 'PKLoaderDemo/PKLoader/*.swift'

end
