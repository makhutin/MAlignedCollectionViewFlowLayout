Pod::Spec.new do |spec|
  spec.name         = "MAlignedCollectionViewFlowLayout"
  spec.version      = "1.0.0"
  spec.summary      = "Overridden implementation of the standard UICollectionViewFlowLayout that aligns elements."

  spec.homepage     = "https://github.com/makhutin/MAlignedCollectionViewFlowLayout"
  spec.screenshots  = "https://github.com/makhutin/MAlignedCollectionViewFlowLayout/tree/main/Images"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = "Aleksey Makhutin"
  spec.social_media_url   = "https://t.me/makhutin"

  spec.platform     = :ios
  spec.ios.deployment_target = "10.0"

  spec.source       = { :git => "https://github.com/makhutin/MAlignedCollectionViewFlowLayout.git", :tag => "#{spec.version}" }
  spec.source_files  = "MAlignedCollectionViewFlowLayout/Classes", "MAlignedCollectionViewFlowLayout/Classes/**/*.{h,m}"
end
