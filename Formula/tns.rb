class Tns < Formula
  desc "Remote terminal with local typing prediction over SSH or mosh"
  homepage "https://github.com/wrsrsh/tns"
  url "https://github.com/wrsrsh/tns/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "d6635e3a2961a92d684e4b980135f04e9ed228bd2d94e4773d1c4e30308d392e"
  license "MIT"
  head "https://github.com/wrsrsh/tns.git", branch: "main"

  depends_on "rust" => :build
  depends_on "mosh"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Check this computer: tns setup --local
      Check both machines: tns setup user@server
      Setup checks are read-only; they print instructions without installing
      packages or changing SSH configuration. Install mosh on the remote host
      separately and allow UDP 60000-61000, or use `tns --ssh HOST`.
      Run `claude` inside a normal `tns HOST` session for local typing previews
      in Claude's original TUI. No `tns agent` command is required.
      Optional Pi agent interface: install Pi and run
        pi install git:github.com/wrsrsh/tns
      Then use `tns agent claude HOST` or `tns agent codex HOST`.
      Setup guide: https://github.com/wrsrsh/tns/blob/main/docs/setup.md
    EOS
  end

  test do
    assert_equal "tns #{version}", shell_output("#{bin}/tns --version").strip
    help = shell_output("#{bin}/tns --help 2>&1")
    assert_match "predictive terminal", help
    assert_match "--no-tui-prediction", help
    # emulator smoke test: feed bytes through the screen model
    out = pipe_output("#{bin}/tns --dump-screen 10x2", "hi\e[31m!", 0)
    assert_match "cursor 0 3", out
  end
end
