# Generated on release. Do not hand-edit version or sha256.
cask "optimizely-agent-platform@0.0.33" do
  version "0.0.33"
  sha256 "8546fbab7c2ae14c84a9a662f8183b5bd60af2cf8d17c493c469d468ad9ae8b1"

  # Universal (arm64 + x86_64) DMG — no on_arm / on_intel split needed.
  # Version-pinned URLs are immutable, so this sha256 cannot go stale.
  url "https://dl.opal.optimizely.com/desktop/macos/#{version}/OptimizelyAgentPlatform-#{version}-universal.dmg"
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
