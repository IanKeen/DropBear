Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name = 'DropBearGen'
  spec.version = '0.3.0'
  spec.homepage = 'https://github.com/IanKeen/DropBear'
  spec.summary = 'A companion framework for DropBear that generates code for accessibility identifiers.'
  spec.description = <<-DESC
                      A companion framework for DropBear that generates code for accessibility identifiers.
                      Catch broken tests right away using the compiler!
                     DESC

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license = 'MIT'

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author = { 'Ian Keen' => 'iankeen82@gmail.com' }
  spec.social_media_url = 'https://twitter.com/iankay'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source = {
    http: "#{spec.homepage}/releases/download/#{spec.version}/dropbeargen-#{spec.version}.zip"
  }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.preserve_paths = '*'
  spec.exclude_files = '**/file.zip'

end
