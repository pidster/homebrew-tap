class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.5.0/wisp-0.5.0-arm64.tar.gz"
  sha256 "fc8fa1e45a35e3a017a9bcd90626bf74f29f3a849e02ddbe5ebbc7fed269b202"
  license "MIT"
  version "0.5.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp"
  end

  test do
    assert_equal "0.5.0", shell_output("#{bin}/wisp --version").strip
  end
end
