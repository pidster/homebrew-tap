cask "wisp" do
  version "0.34.2"
  sha256 "38a693e2013a474850017b2788f9ad9d6ab828c994469e33f545e40d36e4711c"

  url "https://github.com/pidster/wisp/releases/download/v#{version}/Wisp-#{version}.dmg"
  name "Wisp"
  desc "On-device, tool-using AI microharness"
  homepage "https://github.com/pidster/wisp"

  # wisp update replaces the app in place (ADR 0074); brew upgrade --greedy brings it to this version.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Wisp.app"
  # wisp started through these links resolves them and finds the app's parts (ADR 0072).
  binary "#{appdir}/Wisp.app/Contents/MacOS/wisp"
  binary "#{appdir}/Wisp.app/Contents/MacOS/wisp-tui"
  # The completion scripts are embedded in the binary: 'wisp completions bash|zsh|fish'.
  generate_completions_from_executable "#{appdir}/Wisp.app/Contents/MacOS/wisp", "completions",
                                       shells: [:bash, :zsh, :fish]

  # --zap removes wisp's data as well as the app (ADR 0084, decision 9); WISP_HOME elsewhere is not known here.
  zap trash: [
    "~/.wisp",
    "~/Library/LaunchAgents/com.pidster.wisp.llamacpp.plist",
    "~/Library/Preferences/com.pidster.wisp.notifier.plist",
    "~/Library/Preferences/com.pidster.wisp.plist",
  ]
end
