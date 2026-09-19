class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.1.3/daimon-0.1.3-arm64.tar.gz"
  sha256 "a9a888ee86aeb820949b6cbce317623659ff0a88b2a953b5095a7e51017316bf"
  license "MIT"
  version "0.1.3"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.1.3", shell_output("#{bin}/daimon --version").strip
  end
end
