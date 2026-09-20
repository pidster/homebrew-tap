class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.1.4/daimon-0.1.4-arm64.tar.gz"
  sha256 "4378bde6eb5943a4937995ecd6963232a0b20c402931d145074d3d9c7b6372cd"
  license "MIT"
  version "0.1.4"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/daimon --version").strip
  end
end
