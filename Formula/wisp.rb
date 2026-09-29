class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.14.0/wisp-0.14.0-arm64.tar.gz"
  sha256 "aa253b7a9240f8bc89af8f6a75d5d1775e58f4bbfeb073175e7df933402d539b"
  license "MIT"
  version "0.14.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.14.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.14.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
