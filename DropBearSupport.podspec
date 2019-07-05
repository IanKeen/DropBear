Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name = 'DropBearSupport'
  spec.version = '0.3.0'
  spec.homepage = 'https://github.com/IanKeen/DropBear'
  spec.summary = 'An app-side companion to DropBear.'
  spec.description = <<-DESC
                      An app-side companion to DropBear.
                      Allows for injecting a UI test configuration.
                     DESC

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license = 'MIT'

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author = { 'Ian Keen' => 'iankeen82@gmail.com' }
  spec.social_media_url = 'https://twitter.com/iankay'

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.platform = :ios, '10.0'
  spec.swift_version = '5.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source = { git: "#{spec.homepage}.git", tag: spec.version }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source_files = 'DropBearSupport/**/*.swift'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.requires_arc = true

end
