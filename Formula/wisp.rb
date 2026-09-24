class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.10.1/wisp-0.10.1-arm64.tar.gz"
  sha256 "715726d805b51f0d60d501b2bfa872bea19aefc7c29d3c5008d61ac8651f009c"
  license "MIT"
  version "0.10.1"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.10.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.10.1", shell_output("#{bin}/wisp-tui --version").strip
  end
end
