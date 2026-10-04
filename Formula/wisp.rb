class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.18.1/wisp-0.18.1-arm64.tar.gz"
  sha256 "9d2702173359c1037a7311c5e3161d377e36c4112bee6d08d0749980547a487b"
  license "MIT"
  version "0.18.1"

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
    assert_equal "0.18.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.18.1", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
  end
end
