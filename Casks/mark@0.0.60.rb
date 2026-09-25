# Generated on release. Do not hand-edit version or sha256.
cask "mark@0.0.60" do
  version "0.0.60"
  sha256 "3bc1539e0f9c85df2b53b83cd3add9c918311b97542e6f0b6c8c6b91f77196dc"

  # Universal (arm64 + x86_64) DMG — no on_arm / on_intel split needed.
  # Version-pinned URLs are immutable, so this sha256 cannot go stale.
  url "https://dl.opal.optimizely.com/desktop/macos/#{version}/Mark-#{version}-universal.dmg"
  name "Mark"
  homepage "https://opal.optimizely.com"

  livecheck do
    url "https://dl.opal.optimizely.com/desktop/macos/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :ventura"

  app "Mark.app"

  zap trash: [
    "~/Library/Application Support/Mark",
    "~/Library/Application Support/Optimizely Agent Platform",
    "~/Library/Preferences/com.optimizely.opal.plist",
    "~/Library/Saved Application State/com.optimizely.opal.savedState",
  ]
end
