class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.4.0/wisp-0.4.0-arm64.tar.gz"
  sha256 "e7d125be4a9adf4d1e8affd24b87b0e53f8b36b362a84c0df6772360b9f0df2f"
  license "MIT"
  version "0.4.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp"
  end

  test do
    assert_equal "0.4.0", shell_output("#{bin}/wisp --version").strip
  end
end
