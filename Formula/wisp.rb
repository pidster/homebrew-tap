class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.7.0/wisp-0.7.0-arm64.tar.gz"
  sha256 "15bf353b6683b9d477240f8d89b4cfb11d664fba2e30d19cc9bdc4694bf1686a"
  license "MIT"
  version "0.7.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.7.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.7.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
