class Typeany < Formula
  desc "macOS menu-bar voice input app with customizable trigger key"
  homepage "https://github.com/thinkany-ai/typeany"
  url "https://github.com/thinkany-ai/typeany/archive/refs/heads/main.tar.gz"
  sha256 "e30dea60d516edef6a628ef129d3af1e8177b458474a2e31d223e3ae0252c364"
  version "0.1.0"
  license "MIT"

  depends_on :macos => :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    app = buildpath/".build/TypeAny.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath
    cp ".build/release/TypeAny", app/"Contents/MacOS/TypeAny"
    cp "Sources/TypeAny/Resources/Info.plist", app/"Contents/Info.plist"

    prefix.install app
  end

  def caveats
    <<~EOS
      TypeAny installed to: #{prefix}/TypeAny.app

      Add to /Applications:
        ln -sf #{prefix}/TypeAny.app /Applications/TypeAny.app

      Or launch directly:
        open #{prefix}/TypeAny.app

      First launch: grant Microphone, Speech Recognition & Accessibility permissions.
      If Fn key conflicts with WeChat → Menu bar → Trigger Key → Right Option ⌥
    EOS
  end

  test do
    assert_predicate prefix/"TypeAny.app", :directory?
  end
end
