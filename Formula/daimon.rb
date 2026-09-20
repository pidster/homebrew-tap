class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.2.0/daimon-0.2.0-arm64.tar.gz"
  sha256 "08bc3eb7e3492954798bb0cd18b49b91a4dc5037d41a25556195cab303657c43"
  license "MIT"
  version "0.2.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.2.0", shell_output("#{bin}/daimon --version").strip
  end
end
