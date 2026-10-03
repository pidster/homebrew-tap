class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.16.0/wisp-0.16.0-arm64.tar.gz"
  sha256 "efc53721e37a2a4b95115df6e46f0675cddcf64896709e06c4231e72741cbc44"
  license "MIT"
  version "0.16.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.16.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.16.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
