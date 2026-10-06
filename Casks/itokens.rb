cask "itokens" do
  version "0.1.0"
  sha256 "bb22eb927d91631a138d093c9343ccf2ea664c7d51a5aa486ca2cb3f61246f82"

  url "https://github.com/itokens-app/releases/releases/download/v#{version}/itokens-#{version}.zip"
  name "itokens"
  desc "Private, local AI for Apple Silicon Macs"
  homepage "https://itokens.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "itokens.app"

  uninstall quit: "app.itokens.macos"

  zap launchctl: [
        "app.itokens.ollama-env",
        "app.itokens.wiredlimit",
      ],
      trash:     [
        "~/.config/itokens",
        "~/Library/Application Support/itokens",
        "~/Library/Caches/app.itokens.macos",
        "~/Library/HTTPStorages/app.itokens.macos",
        "~/Library/Preferences/app.itokens.macos.plist",
        "~/Library/WebKit/app.itokens.macos",
      ]
end
