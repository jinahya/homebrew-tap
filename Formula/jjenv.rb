class Jjenv < Formula
  desc "Extra commands for jenv (Java version manager)"
  homepage "https://github.com/jinahya/jjenv"
  url "https://github.com/jinahya/jjenv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "948f74a196462e6cf811f0ec5242f1b25de48efc647c8d42b58ca5c7d12eac0a"
  license "MIT"
  head "https://github.com/jinahya/jjenv.git", branch: "main"

  depends_on "jenv"

  def install
    libexec.install "bin", "libexec"
    bin.install_symlink libexec/"bin/jjenv"
    bash_completion.install "completions/jjenv.bash" => "jjenv"
    zsh_completion.install  "completions/jjenv.zsh"  => "_jjenv"
  end

  test do
    assert_match "jjenv", shell_output("#{bin}/jjenv --version")
    shell_output("#{bin}/jjenv commands")
  end
end
