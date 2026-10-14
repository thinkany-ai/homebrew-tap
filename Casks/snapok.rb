cask "snapok" do
  version "0.2.1"
  sha256 "40881638fa58190cba9d1b8ce9d4171bc731457a0d58a2fb0142b0091c64738b"

  url "https://cdn.snapok.app/Snapok-#{version}.zip"
  name "Snapok"
  desc "Capture, annotate, and frame screenshots"
  homepage "https://snapok.app/"

  livecheck do
    url "https://cdn.snapok.app/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Snapok.app"

  uninstall quit: "ai.thinkany.snapok"

  zap trash: [
    "~/Library/Application Support/Snapok",
    "~/Library/Caches/ai.thinkany.snapok",
    "~/Library/HTTPStorages/ai.thinkany.snapok",
    "~/Library/Logs/Snapok.log",
    "~/Library/Preferences/ai.thinkany.snapok.plist",
  ]
end
