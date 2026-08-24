# Generated on release. Do not hand-edit version or sha256.
cask "optimizely-agent-platform" do
  version "0.0.23"
  sha256 "887178043bdeddcef7981118e9ddc0d8aa5d0cfd70bec527b828ab0c7fef24fc"

  # Universal (arm64 + x86_64) DMG — no on_arm / on_intel split needed.
  # Version-pinned URLs are immutable, so this sha256 cannot go stale.
  url "https://dl.opal.optimizely.com/desktop/macos/#{version}/Opal-#{version}-universal.dmg"
  name "Optimizely Agent Platform"
  homepage "https://opal.optimizely.com"

  livecheck do
    url "https://dl.opal.optimizely.com/desktop/macos/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :ventura"

  app "Optimizely Agent Platform.app"

  zap trash: [
    "~/Library/Application Support/Optimizely Agent Platform",
    "~/Library/Preferences/com.optimizely.opal.plist",
    "~/Library/Saved Application State/com.optimizely.opal.savedState",
  ]
end
