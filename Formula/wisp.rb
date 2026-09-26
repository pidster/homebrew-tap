class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.13.1/wisp-0.13.1-arm64.tar.gz"
  sha256 "db6538658e03c14a9b39d53bca5cb2eb15e1c6d83901cd66698c248e248d39e4"
  license "MIT"
  version "0.13.1"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.13.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.13.1", shell_output("#{bin}/wisp-tui --version").strip
  end
end
