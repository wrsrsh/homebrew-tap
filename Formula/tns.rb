class Tns < Formula
  desc "Predictive terminal for a remote fish shell, over ssh or mosh"
  homepage "https://github.com/wrsrsh/tns"
  url "https://github.com/wrsrsh/tns/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7b765f8ecc4022a40745d2491136ab2ef31c8a6b534e02cc32816249a9e667e8"
  license "MIT"
  head "https://github.com/wrsrsh/tns.git", branch: "main"

  depends_on "rust" => :build
  depends_on "mosh" => :recommended

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      The remote host needs fish installed (any login shell is fine).
      For `tns --mosh HOST`, install mosh on the remote too and allow UDP
      60000-61000 inbound; see https://github.com/wrsrsh/tns#setting-up-mosh
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
