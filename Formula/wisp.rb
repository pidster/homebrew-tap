class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.26.4/wisp-0.26.4-arm64.tar.gz"
  sha256 "b7dc88316abb9ecf317d42500de7f2af4908ddd1d8752ccc98d92d64392d73fa"
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
    assert_equal "0.26.4", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.26.4", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
    assert_path_exists zsh_completion/"_wisp"
    assert_path_exists bash_completion/"wisp"
    assert_path_exists fish_completion/"wisp.fish"
    assert_match "#compdef wisp", shell_output("#{bin}/wisp completions zsh")
  end
end
