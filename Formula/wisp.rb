class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.10.3/wisp-0.10.3-arm64.tar.gz"
  sha256 "0b2bb15c23b66a3b5e9a973e96b85af6ae84defa3f8eeac2bed47369012bb608"
  license "MIT"
  version "0.10.3"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.10.3", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.10.3", shell_output("#{bin}/wisp-tui --version").strip
  end
end
