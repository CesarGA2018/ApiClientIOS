
Pod::Spec.new do |spec|
  spec.name         = "ApiClientIOS"
  spec.version      = "1.0.0"
  spec.summary      = "A small framework to monitor network changes in Swift."
  spec.homepage     = "https://github.com/CesarGA2018/ApiClientIOS"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "César Guasca Asencio" => "cesar.guasca@w2d.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/CesarGA2018/ApiClientIOS.git", :tag => "1.0.0" }
  spec.source_files = 'ApiClientIOS/**/*.{swift}'
  # spec.source_files  = "ApiClientIOS/*.{swift}"
  spec.swift_version = "5.0"
end
