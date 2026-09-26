class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.12.0/wisp-0.12.0-arm64.tar.gz"
  sha256 "8581ca5698de0f7a250bcf24565d9b3966e2b17d6c4fbb824c4f06b4aec80b76"
  license "MIT"
  version "0.12.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.12.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.12.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
