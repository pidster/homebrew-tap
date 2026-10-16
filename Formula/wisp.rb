class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.26.3/wisp-0.26.3-arm64.tar.gz"
  sha256 "e34d9fbc9c80a2aa5f300b516a2cb7d665b9914ca56bb9880325605d2c8d0bc4"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    # MLX finds mlx.metallib beside the binary's real path (dladdr resolves Homebrew's links), so both
    # live in libexec and bin links to the binary (ADR 0047).
    libexec.install "wisp", "mlx.metallib"
    bin.install_symlink libexec/"wisp"
    bin.install "wisp-tui"
    # The completion scripts are embedded in the binary; this runs 'wisp completions bash|zsh|fish' into
    # bash_completion, zsh_completion, and fish_completion.
    generate_completions_from_executable(bin/"wisp", "completions")
  end

  test do
    assert_equal "0.26.3", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.26.3", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
    assert_path_exists zsh_completion/"_wisp"
    assert_path_exists bash_completion/"wisp"
    assert_path_exists fish_completion/"wisp.fish"
    assert_match "#compdef wisp", shell_output("#{bin}/wisp completions zsh")
  end
end
