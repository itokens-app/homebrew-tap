cask "itokens" do
  version "0.2.0"
  sha256 "3718e42f8ab6016db794edaa95616a9aa28f81c6d5629a8a8c739b88ae03a0de"

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
