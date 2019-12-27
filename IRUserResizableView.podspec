Pod::Spec.new do |spec|
  spec.name         = "IRUserResizableView"
  spec.version      = "0.1.0"
  spec.summary      = "A powerful resizable view of iOS."
  spec.description  = "A powerful resizable view of iOS."
  spec.homepage     = "https://github.com/irons163/IRUserResizableView.git"
  spec.license      = "MIT"
  spec.author       = "irons163"
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/irons163/IRUserResizableView.git", :tag => spec.version.to_s }
  spec.source_files  = "IRUserResizableView/**/*.{h,m}"
#  spec.resources = ["IRUserResizableView/**/*.png"]
end