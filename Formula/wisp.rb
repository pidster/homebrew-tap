class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.13.0/wisp-0.13.0-arm64.tar.gz"
  sha256 "36f44d982bed292cdfcc7e84a280851cacf0b9ec59477aab65fd30aacb1f5889"
  license "MIT"
  version "0.13.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.13.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.13.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
