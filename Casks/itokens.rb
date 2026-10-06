cask "itokens" do
  version "0.0.4"
  sha256 "79999a8c4cc899fa23611ac170581ea29ad0efb466a1d3636dfc31712a26592c"

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
