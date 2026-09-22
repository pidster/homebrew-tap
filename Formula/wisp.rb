class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.6.0/wisp-0.6.0-arm64.tar.gz"
  sha256 "936675bae9317f02bbd24821b07b2f79b0c359ac15937f7a92fea2568f6fcf35"
  license "MIT"
  version "0.6.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.6.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.6.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
