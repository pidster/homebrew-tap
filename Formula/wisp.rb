class Wisp < Formula
  desc "On-device, tool-using AI microharness for macOS"
  homepage "https://github.com/pidster/wisp"
  url "https://github.com/pidster/wisp/releases/download/v0.31.1/wisp-0.31.1-arm64.tar.gz"
  sha256 "aa0a6f5765680b3e949ae775d417895112e062bded62491ba1abfc81a042fff8"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    # MLX finds mlx.metallib beside the binary's real path (dladdr resolves Homebrew's links), so both
    # live in libexec and bin links to the binary (ADR 0047).
    # Wisp Notifier.app beside wisp, where wisp looks for it (ADR 0070); not in /Applications, and not a cask.
    libexec.install "wisp", "mlx.metallib", "Wisp Notifier.app"
    bin.install_symlink libexec/"wisp"
    bin.install "wisp-tui"
    # Where the parts are, relative to libexec/wisp, for wisp and its doctor's package finding (ADR 0072).
    (libexec/"wisp-layout.json").write <<~JSON
      {"frontEnd": "../bin/wisp-tui", "notifier": "Wisp Notifier.app", "metalLibrary": "mlx.metallib"}
    JSON
    # The completion scripts are embedded in the binary; this runs 'wisp completions bash|zsh|fish' into
    # bash_completion, zsh_completion, and fish_completion.
    generate_completions_from_executable(bin/"wisp", "completions")
  end

  test do
    assert_equal "0.31.1", shell_output("#{bin}/wisp --version").strip
    assert_equal "0.31.1", shell_output("#{bin}/wisp-tui --version").strip
    assert_path_exists libexec/"mlx.metallib"
    assert_path_exists libexec/"wisp-layout.json"
    assert_predicate libexec/"Wisp Notifier.app/Contents/MacOS/WispNotifier", :executable?
    assert_path_exists zsh_completion/"_wisp"
    assert_path_exists bash_completion/"wisp"
    assert_path_exists fish_completion/"wisp.fish"
    assert_match "#compdef wisp", shell_output("#{bin}/wisp completions zsh")
  end
end
