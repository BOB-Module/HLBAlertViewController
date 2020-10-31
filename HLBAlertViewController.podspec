Pod::Spec.new do |s|
   s.name         = "HLBAlertViewController"
   s.version      = "0.0.1"
   s.summary      = "Flexible alert view."
   s.homepage     = "https://github.com/BOB-Module/HLBAlertViewController"
   s.license      = 'MIT'
   s.author       = { "Huang Libo" => "LiboHwang+IM@gmail.com" }
   s.source       = { :git => "https://github.com/BOB-Module/HLBAlertViewController.git", :tag => s.version }
   
   s.source_files = 'HLBAlertViewController/*.{h,m}'
   
   s.ios.frameworks = 'Foundation', 'UIKit'
   s.ios.deployment_target = '9.0'
 end