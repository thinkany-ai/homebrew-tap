cask "typeany" do
  version "0.1.0"
  sha256 "aa84ab7bc0c89ca89a4f587a9fefc8a882ea075b77c3c6cd5964e7c606724f50"

  url "https://github.com/thinkany-ai/typeany/releases/download/v#{version}/TypeAny-#{version}.zip"
  name "TypeAny"
  desc "macOS menu-bar voice input app with customizable trigger key"
  homepage "https://github.com/thinkany-ai/typeany"

  app ".build/TypeAny.app", target: "TypeAny.app"

  zap trash: [
    "~/Library/Preferences/com.typeany.TypeAny.plist",
  ]
end
