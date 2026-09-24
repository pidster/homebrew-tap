class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.10.0/wisp-0.10.0-arm64.tar.gz"
  sha256 "64b07c6b61989c29e9b4851ad355519f13a5902ac02824a66d9c59c1bb59d69d"
  license "MIT"
  version "0.10.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.10.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.10.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
