cask "itokens" do
  version "0.0.1"
  sha256 "0d2aa00a37ed9e3d2f426e8d405ccb71f29912ca9efbe15a2fb7e55ebe4dfead"

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
