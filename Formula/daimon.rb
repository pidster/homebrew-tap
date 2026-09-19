class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.1.2/daimon-0.1.2-arm64.tar.gz"
  sha256 "fb0fb8b8b2d5c2467ea548225817b72546f105b819d1fd09add92d4ae6355ba1"
  license "MIT"
  version "0.1.2"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/daimon --version").strip
  end
end
