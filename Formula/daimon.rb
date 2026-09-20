class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.1.5/daimon-0.1.5-arm64.tar.gz"
  sha256 "1004f429502087982186c964563da89e34e9cd4de913c5787f1fe003f032f4d9"
  license "MIT"
  version "0.1.5"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.1.5", shell_output("#{bin}/daimon --version").strip
  end
end
