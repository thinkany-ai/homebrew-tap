cask "snapok" do
  version "0.2.0"
  sha256 "af755b20983c08d1aa70538814012057328bfddae676967949741ce9a25261d5"

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
