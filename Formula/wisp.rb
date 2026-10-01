class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.15.0/wisp-0.15.0-arm64.tar.gz"
  sha256 "b040bae271f879597849217225569238c828317772aeb2c92e761faa2b423801"
  license "MIT"
  version "0.15.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.15.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.15.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
