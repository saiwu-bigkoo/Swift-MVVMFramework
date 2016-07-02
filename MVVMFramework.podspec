Pod::Spec.new do |s|
s.name         = "MVVMFramework"
s.version      = "1.0.0"
s.summary      = "Using Swift to build a fast MVVM framework without using FRP frameworks like RAC or RxSwift"
s.homepage     = "https://github.com/saiwu-bigkoo/Swift-MVVMFramework"
s.license      = "MIT"
s.author       = { "Sai" => "sai.wu@bigkoo.com" }
s.platform     = :ios, "8.0"
s.requires_arc = true
s.source    = { :git => 'https://github.com/saiwu-bigkoo/Swift-MVVMFramework.git', :tag => 'v1.0.0' }
s.source_files  = "MVVMFramework/*.{swift,h}"
s.dependency "Alamofire"
s.dependency "SwiftyJSON"
end