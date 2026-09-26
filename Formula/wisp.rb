class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.11.0/wisp-0.11.0-arm64.tar.gz"
  sha256 "549c84a1cfe02b88083be74ef270429702162e46e7cfcc0a1fc94b290c6060bb"
  license "MIT"
  version "0.11.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.11.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.11.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
