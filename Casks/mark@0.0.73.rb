# Generated on release. Do not hand-edit version or sha256.
cask "mark@0.0.73" do
  version "0.0.73"
  sha256 "455e56b49bf8bb02a4a4da34550a043559e64e1fe4c4e3cfc3d649cc042ec3dc"

  # Universal (arm64 + x86_64) DMG — no on_arm / on_intel split needed.
  # Version-pinned URLs are immutable, so this sha256 cannot go stale.
  url "https://dl.mark.optimizely.com/desktop/macos/#{version}/Mark-#{version}-universal.dmg"
  name "Mark"
  # The app lives at opal.optimizely.com; only the download CDN moved to
  # dl.mark. mark.optimizely.com does not serve.
  homepage "https://opal.optimizely.com"

  livecheck do
    url "https://dl.mark.optimizely.com/desktop/macos/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :ventura"

  app "Mark.app"

  zap trash: [
    "~/Library/Application Support/Mark",
    "~/Library/Application Support/Optimizely Agent Platform",
    # Bundle id is migrating com.optimizely.opal -> com.optimizely.mark; clean
    # up both so a zap works for pre- and post-rename installs.
    "~/Library/Preferences/com.optimizely.mark.plist",
    "~/Library/Preferences/com.optimizely.opal.plist",
    "~/Library/Saved Application State/com.optimizely.mark.savedState",
    "~/Library/Saved Application State/com.optimizely.opal.savedState",
  ]
end
