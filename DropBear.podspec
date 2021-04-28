Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name = 'DropBear'
  spec.version = '0.13.0'
  spec.homepage = 'https://github.com/IanKeen/DropBear'
  spec.summary = 'A marvellous UI testing framework.'
  spec.description = <<-DESC
                      A marvellous UI testing framework.
                      Based on the robot pattern.
                     DESC

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license = 'MIT'

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author = { 'Ian Keen' => 'iankeen82@gmail.com' }
  spec.social_media_url = 'https://twitter.com/iankay'

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.platform = :ios, '10.0'
  spec.swift_version = '5.1'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source = { git: "#{spec.homepage}.git", tag: spec.version }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source_files = 'DropBear/**/*.swift'

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.framework = 'XCTest'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.requires_arc = true

end
