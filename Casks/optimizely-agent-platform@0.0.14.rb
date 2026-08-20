# Generated on release. Do not hand-edit version or sha256.
cask "optimizely-agent-platform@0.0.14" do
  version "0.0.14"
  sha256 "ae62ae5864544571dc3d4644821e3ea5d08c3b4385da916a428a809e383f2f8b"

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

  app "Opal.app"

  zap trash: [
    "~/Library/Application Support/Opal",
    "~/Library/Preferences/com.optimizely.opal.plist",
    "~/Library/Saved Application State/com.optimizely.opal.savedState",
  ]
end
