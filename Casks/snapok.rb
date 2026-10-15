cask "snapok" do
  version "0.2.4"
  sha256 "a20787b489c2da73cee7f0fec87fc06dfd16ea716282efe309bfbbacb7c19b64"

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
