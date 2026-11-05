# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.32.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.1/term-0.32.1-darwin-aarch64.tar.gz"
    sha256 "07de66319f0bc3c5807b0b47ba862310c0890a657515036cd3d3bbf796ce8dfd"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.1/term-0.32.1-darwin-x86_64.tar.gz"
    sha256 "665131aa65eeb254cdcf2244c172cbc8232ab471e5c78ab1bc4984c5d38ab7d2"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.1/term-0.32.1-linux-aarch64.tar.gz"
    sha256 "253704356f56dbc760e02e9009599d8ad8d2ed8256b61f7467caded7457379a4"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.1/term-0.32.1-linux-x86_64.tar.gz"
    sha256 "1c56bcc209b7bde42b48263ba995db6c3bcde7c2b5703bd74e8f87b8194b36f7"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
