Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name  = 'DropBearGen'
  spec.version = '0.1.0'
  spec.summary = 'A companion framework for DropBear that generates code for accessibility identifiers.'
  spec.homepage = 'https://github.com/IanKeen/DropBear'
  spec.description = <<-DESC
                      A companion framework for DropBear that generates code for accessibility identifiers.
                      Allows for compiling the UI testing target during CI and do its thing.
                     DESC
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license = 'MIT'

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author = { 'Ian Keen' => 'iankeen82@gmail.com' }
  spec.social_media_url = 'https://twitter.com/iankay'

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.platform = :ios

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source = {
    http: "https://github.com/IanKeen/DropBear/releases/download/#{s.version}/dropbeargen-#{s.version}.zip"
  }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.preserve_paths = '*'
  spec.exclude_files = '**/file.zip'

end
