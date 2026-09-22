class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.6.1/wisp-0.6.1-arm64.tar.gz"
  sha256 "c2a45694799153fa96edea209d6cc706e99a0944b43cd79ec5e01baf84533dde"
  license "MIT"
  version "0.6.1"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.6.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.6.1", shell_output("#{bin}/wisp-tui --version").strip
  end
end
