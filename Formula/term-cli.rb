# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.42.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.42.1/term-0.42.1-darwin-aarch64.tar.gz"
    sha256 "0a2945fd8bce6d00012e32e97bc7546972a8583f006f0ad64883d71f55e32b24"
  elsif OS.mac?
    url "https://pkg.termplane.com/archives/term-cli/0.42.1/term-0.42.1-darwin-x86_64.tar.gz"
    sha256 "81ac7dacaf409fc3a017fbdd4b34627a5aaafd0bc5e45043f21ce0c62b2eca7c"
  elsif Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.42.1/term-0.42.1-linux-aarch64.tar.gz"
    sha256 "d5c42d5941b522d120828af2658603616b2bcaa64ed7ed2af9361a01c1e97972"
  else
    url "https://pkg.termplane.com/archives/term-cli/0.42.1/term-0.42.1-linux-x86_64.tar.gz"
    sha256 "33c6fce895f704954458dade58f79c0c558ba35a43ff0b4c0dcbca28a68e7bfb"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
