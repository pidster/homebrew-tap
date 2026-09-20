class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.3.0/daimon-0.3.0-arm64.tar.gz"
  sha256 "075786dbcaa6c835f34e68d1771da5d59aa87a1dddf783c35024302ada218a7c"
  license "MIT"
  version "0.3.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.3.0", shell_output("#{bin}/daimon --version").strip
  end
end
