class Tns < Formula
  desc "Predictive terminal for a remote fish shell, over ssh or mosh"
  homepage "https://github.com/wrsrsh/tns"
  url "https://github.com/wrsrsh/tns/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "d32932f5d0fc45c552eecba89e3d03552dbd87e0f27900a933a01fa157d81a02"
  license "MIT"
  head "https://github.com/wrsrsh/tns.git", branch: "main"

  depends_on "rust" => :build
  depends_on "mosh"

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Get started:  tns setup
      The remote host needs a shell (bash, zsh, fish, or any) and, for the
      default mosh transport, mosh. `tns setup` installs mosh on the remote and
      helps set up an ssh key. Allow UDP 60000-61000 inbound on the server, or
      use a tunnel like Tailscale; see https://github.com/wrsrsh/tns#setting-up-mosh
    EOS
  end

  test do
    assert_equal "tns #{version}", shell_output("#{bin}/tns --version").strip
    assert_match "predictive terminal", shell_output("#{bin}/tns --help 2>&1")
    # emulator smoke test: feed bytes through the screen model
    out = pipe_output("#{bin}/tns --dump-screen 10x2", "hi\e[31m!", 0)
    assert_match "cursor 0 3", out
  end
end
