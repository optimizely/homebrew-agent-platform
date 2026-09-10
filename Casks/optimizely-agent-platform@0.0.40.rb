# Generated on release. Do not hand-edit version or sha256.
cask "optimizely-agent-platform@0.0.40" do
  version "0.0.40"
  sha256 "e9a2b8009b7ab32fb2c127d3197ff6fe4b0587ab962ccc4564890bf9449dc2d6"

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
