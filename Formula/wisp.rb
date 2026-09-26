class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.13.2/wisp-0.13.2-arm64.tar.gz"
  sha256 "0335281a1c31f1fcfc65eeda2df947dab1c2240ff5c8e90ec1891d53f5d976d4"
  license "MIT"
  version "0.13.2"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.13.2", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.13.2", shell_output("#{bin}/wisp-tui --version").strip
  end
end
