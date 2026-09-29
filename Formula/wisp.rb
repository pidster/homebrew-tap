class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.14.1/wisp-0.14.1-arm64.tar.gz"
  sha256 "405598e5d95dfa12c7e759be1f6b2d0292297830fdf14b390c7b58e5284118df"
  license "MIT"
  version "0.14.1"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.14.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.14.1", shell_output("#{bin}/wisp-tui --version").strip
  end
end
