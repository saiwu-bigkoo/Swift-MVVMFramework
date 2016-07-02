Pod::Spec.new do |s|
s.name         = "SwiftMVVMFramework"
s.version      = "1.0.0"
s.summary      = "Using Swift to build a fast MVVM framework without using FRP frameworks like RAC or RxSwift"
s.homepage     = "https://github.com/saiwu-bigkoo/Swift-MVVMFramework"
s.license      = "MIT"
s.author       = { "Sai" => "sai.wu@bigkoo.com" }
s.platform     = :ios, "8.0"
s.source    = { :git => 'https://github.com/saiwu-bigkoo/Swift-MVVMFramework.git', :tag => '1.0.0' }
s.source_files  = "SwiftMVVMFramework/SwiftMVVMFramework/*.{swift,h}"
s.dependency "Alamofire"
s.dependency "SwiftyJSON"
end