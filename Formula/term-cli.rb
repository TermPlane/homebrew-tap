# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.28.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.28.0/term-0.28.0-darwin-aarch64.tar.gz"
    sha256 "b44b916c71266c3b46f38813319e19288538a6ce9409dc84841aa10d5c23e11f"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.28.0/term-0.28.0-darwin-x86_64.tar.gz"
    sha256 "d2e11b2e3bcabab85acfbb336d7179b0fc09d21d9e5e5d08a5b5154a7cbb85dc"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.28.0/term-0.28.0-linux-aarch64.tar.gz"
    sha256 "d3f4ee2eea72d97da75ba00a9bc6ef8bc77973df11cfaa2a6ac6840f35da63f8"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.28.0/term-0.28.0-linux-x86_64.tar.gz"
    sha256 "f8bb5b8885e3708d51d9d785604cccbbc9d51e1ddc1163e3add4f99f113b822c"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
