class Daimon < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/daimon"
  url "https://github.com/pidster/daimon/releases/download/v0.1.0/daimon-0.1.0-arm64.tar.gz"
  sha256 "a2ef6a94f9b8018b624ad0e8297207bbfea33e3ef377fd100a81f37e7d009d28"
  license "MIT"
  version "0.1.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "daimon"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/daimon --version").strip
  end
end
