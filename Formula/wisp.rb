class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.8.3/wisp-0.8.3-arm64.tar.gz"
  sha256 "8a0f118100002edf6eacd33ef4f015b15a3de54f5f8458757b4fbbe7d15a6492"
  license "MIT"
  version "0.8.3"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.8.3", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.8.3", shell_output("#{bin}/wisp-tui --version").strip
  end
end
