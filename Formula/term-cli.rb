# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.35.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.4/term-0.35.4-darwin-aarch64.tar.gz"
    sha256 "8538420df36b1fb8af1a2afaab66ea014e3b2206876c7de441ed7144af60506b"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.4/term-0.35.4-darwin-x86_64.tar.gz"
    sha256 "d2ea654dc8075eab7506f2698ebf6a969f23b68c6feed15e89a7d6f6e3e95342"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.4/term-0.35.4-linux-aarch64.tar.gz"
    sha256 "4889e1f87f751f93654c0d8cd8a583e90dff4c14c2fcc9971dfc0f1288f887d3"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.4/term-0.35.4-linux-x86_64.tar.gz"
    sha256 "637c552fb911e5a468cd16390bb228260014e08c746acddf7a7d94d51b1cd8a9"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
