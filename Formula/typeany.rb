class Typeany < Formula
  desc "macOS menu-bar voice input app with customizable trigger key"
  homepage "https://github.com/thinkany-ai/typeany"
  url "https://github.com/thinkany-ai/typeany/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  license "MIT"

  depends_on :macos => :sonoma
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    # Build app bundle
    app = buildpath/".build/TypeAny.app"
    (app/"Contents/MacOS").mkpath
    (app/"Contents/Resources").mkpath
    cp ".build/release/TypeAny", app/"Contents/MacOS/TypeAny"
    cp "Sources/TypeAny/Resources/Info.plist", app/"Contents/Info.plist"

    # Install app
    prefix.install app
  end

  def caveats
    <<~EOS
      TypeAny has been installed to:
        #{prefix}/TypeAny.app

      To add it to /Applications:
        ln -sf #{prefix}/TypeAny.app /Applications/TypeAny.app

      Or launch directly:
        open #{prefix}/TypeAny.app

      First launch: grant Microphone, Speech Recognition & Accessibility permissions.

      If Fn key conflicts with WeChat, switch to Right Option ⌥:
        Menu bar icon → Trigger Key → Right Option
    EOS
  end

  test do
    assert_predicate prefix/"TypeAny.app", :directory?
  end
end
