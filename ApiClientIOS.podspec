
Pod::Spec.new do |spec|
  spec.name         = "ApiClientIOS"
  spec.version      = "1.0.0"
  spec.summary      = "A small framework to monitor network changes in Swift."
  spec.description  = <<-DESC
                        Descripción
                      DESC
  spec.homepage     = "https://appcoda.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "César Guasca Asencio" => "cesar.guasca@w2d.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :http => 'file:' + __dir__ + "/" }
  # spec.source       = { :git => "https://github.com/YOUR_ACCOUNT/YOUR_REPO.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"
  spec.swift_version = "5.0"
end
