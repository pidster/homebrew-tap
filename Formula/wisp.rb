class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.20.0/wisp-0.20.0-arm64.tar.gz"
  sha256 "3eab28f87ae4ddd905dce7d23b5190a1b3039f7acfd1b0b9707868d4ccba0f8e"
  license "MIT"
  version "0.20.0"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    # MLX finds mlx.metallib beside the binary's real path (dladdr resolves Homebrew's links), so both
    # live in libexec and bin links to the binary (ADR 0047).
    libexec.install "wisp", "mlx.metallib"
    bin.install_symlink libexec/"wisp"
    bin.install "wisp-tui"
  end

  test do
    assert_equal "0.20.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.20.0", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
  end
end
