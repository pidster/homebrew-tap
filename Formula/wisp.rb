class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.17.0/wisp-0.17.0-arm64.tar.gz"
  sha256 "61f8208097d03b480f448d0c8a54bb88d43d82dfb00c128e63cd40cbe59e86ed"
  license "MIT"
  version "0.17.0"

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
    assert_equal "0.17.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.17.0", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
  end
end
