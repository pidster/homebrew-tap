class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.18.0/wisp-0.18.0-arm64.tar.gz"
  sha256 "61116a081a7eb25b5507b8635c8b8ca87d1a656ac618a41d6bec22ffedcce95c"
  license "MIT"
  version "0.18.0"

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
    assert_equal "0.18.0", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.18.0", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
  end
end
