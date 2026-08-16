cask "opal" do
  version "0.0.0"
  sha256 "REPLACE_WITH_SHA256_FROM_RELEASE_CHECKSUMS"

  url "https://dl.opal.optimizely.com/desktop/macos/dmg/Opal-#{version}.dmg"
  name "Opal"
  desc "AI Assistant for Optimizely"
  homepage "https://opal.optimizely.com"

  app "Opal.app"
end
