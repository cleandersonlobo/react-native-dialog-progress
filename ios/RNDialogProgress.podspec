
Pod::Spec.new do |s|
  s.name         = "RNDialogProgress"
  s.version      = "1.0.0"
  s.summary      = "RNDialogProgress"
  s.description  = <<-DESC
                  RNDialogProgress
                   DESC
  s.homepage     = "https://github.com/cleandersonlobo/react-native-dialog-progress"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/author/RNDialogProgress.git", :tag => "master" }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  