class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.8.1/wisp-0.8.1-arm64.tar.gz"
  sha256 "cc85df716695cf459904f407948a8a231ea1ed744bebeaa2161376bb3c713f27"
  license "MIT"
  version "0.8.1"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.8.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.8.1", shell_output("#{bin}/wisp-tui --version").strip
  end
end
