class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.9.0/wisp-0.9.0-arm64.tar.gz"
  sha256 "0bc6256bfa782ffe57419771ced52d4fbaa6894521d49b01dd434ac6a402896b"
  license "MIT"
  version "0.9.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.9.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.9.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
