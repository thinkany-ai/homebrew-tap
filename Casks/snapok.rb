cask "snapok" do
  version "0.2.2"
  sha256 "afc7a807fb90b4ec25309fcdb1ef9ee758cdf30ba6235e5646c8025ef00741b6"

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
