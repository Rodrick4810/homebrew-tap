cask "codemaster" do
  version "1.0.18"
  sha256 "0a66688dcd2f7e51ea7728b73687eec7a8ffa5a13babc7c29bfcc59dae718cdc"

  url "https://github.com/Rodrick4810/codemaster-releases/releases/download/v#{version}/Codemaster-#{version}.dmg"
  name "Codemaster"
  desc "Editor for SQL and Python with vim keys, database consoles and coding agents"
  homepage "https://github.com/Rodrick4810/codemaster-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Codemaster.app"

  zap trash: [
    "~/.config/codemaster",
    "~/Library/Caches/Codemaster",
    "~/Library/Preferences/dev.codemaster.Codemaster.plist",
    "~/Library/Saved Application State/dev.codemaster.Codemaster.savedState",
  ]

  caveats <<~EOS
    Codemaster is signed with its author's own certificate, not an Apple Developer ID,
    and isn't notarized, so macOS blocks its first launch. Open it once, then choose
    Open Anyway in System Settings > Privacy & Security. Updates keep that approval.
  EOS
end
