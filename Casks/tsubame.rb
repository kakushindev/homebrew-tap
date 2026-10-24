# Template for Casks/tsubame.rb in the Homebrew tap. The release workflow fills in
# 0.1.0 and 150f46dae2cc685f3d6b8c5ab700beb8f59a56b7276f73d15c41432f963df92d for each stable release and pushes the result; edit
# this file, not the tap's copy.
cask "tsubame" do
  version "0.1.0"
  sha256 "150f46dae2cc685f3d6b8c5ab700beb8f59a56b7276f73d15c41432f963df92d"

  url "https://github.com/kakushindev/tsubame/releases/download/v#{version}/Tsubame-#{version}.dmg"
  name "Tsubame"
  desc "Native Kubernetes management app"
  homepage "https://github.com/kakushindev/tsubame"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Tsubame.app"

  # Credentials live in the login Keychain, which Homebrew does not touch.
  zap trash: [
    "~/Library/Caches/dev.kakushin.tsubame",
    "~/Library/HTTPStorages/dev.kakushin.tsubame",
    "~/Library/Preferences/dev.kakushin.tsubame.plist",
    "~/Library/Saved Application State/dev.kakushin.tsubame.savedState",
  ]
end
