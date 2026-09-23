class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.8.2/wisp-0.8.2-arm64.tar.gz"
  sha256 "c9959aee3ee291ce81318d0aa4df324b868aa81f8c81d0e5b45b30c379dc70c8"
  license "MIT"
  version "0.8.2"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.8.2", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.8.2", shell_output("#{bin}/wisp-tui --version").strip
  end
end
