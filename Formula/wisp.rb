class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.8.0/wisp-0.8.0-arm64.tar.gz"
  sha256 "0c6943414663e9aea868117961ead3bd1213333f93df8d40667087b9fe6a499f"
  license "MIT"
  version "0.8.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "wisp", "wisp-tui"
  end

  test do
    assert_equal "0.8.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.8.0", shell_output("#{bin}/wisp-tui --version").strip
  end
end
