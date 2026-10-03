cask "itokens" do
  version "0.0.3"
  sha256 "ce77be1d91be7dbcd32605e7e9164ed73bfd749561e3b6650ef3673162865477"

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
