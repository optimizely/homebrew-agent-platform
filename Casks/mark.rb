# Generated on release. Do not hand-edit version or sha256.
cask "mark" do
  version "0.0.72"
  sha256 "8513a7443d37c249da6730a1a9b6e80a59a76f30dddedbc0b97aab0ea0a5798c"

  # Universal (arm64 + x86_64) DMG — no on_arm / on_intel split needed.
  # Version-pinned URLs are immutable, so this sha256 cannot go stale.
  url "https://dl.mark.optimizely.com/desktop/macos/#{version}/Mark-#{version}-universal.dmg"
  name "Mark"
  homepage "https://mark.optimizely.com/"

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
