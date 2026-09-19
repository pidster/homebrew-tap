class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.1.1/daimon-0.1.1-arm64.tar.gz"
  sha256 "ee88cd33e30bb05838a377c272f47bfeb6acf47a2ea61a1456a09b42a1fb6869"
  license "MIT"
  version "0.1.1"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.1.1", shell_output("#{bin}/daimon --version").strip
  end
end
