cask "opal-desktop" do
  version "0.0.0"
  sha256 "REPLACE_WITH_SHA256_FROM_LATEST_JSON"

  # Universal (arm64 + x86_64) DMG. One artifact for both architectures, so
  # this cask never needs an `on_arm` / `on_intel` split.
  #
  # Version-pinned on purpose: objects under a version prefix are immutable
  # (the publish workflow uploads them with --if-generation-match=0), so the
  # sha256 above can never stop matching the bytes at this URL.
  url "https://dl.opal.optimizely.com/desktop/macos/#{version}/Opal-#{version}-universal.dmg"
  name "Opal"
  desc "AI assistant for Optimizely"
  homepage "https://opal.optimizely.com"

  livecheck do
    url "https://dl.opal.optimizely.com/desktop/macos/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :ventura"

  app "Opal.app"

  # com.optimizely.opal is the real bundle id, from opal-desktop/forge.config.ts.
  zap trash: [
    "~/Library/Application Support/Opal",
    "~/Library/Preferences/com.optimizely.opal.plist",
    "~/Library/Saved Application State/com.optimizely.opal.savedState",
  ]
end
