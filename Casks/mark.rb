# Generated on release. Do not hand-edit version or sha256.
cask "mark" do
  version "0.0.69"
  sha256 "1d454a45cfe9706c68766d9a99109c41c90e9bf516def728e3d9dede7e33d67a"

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
