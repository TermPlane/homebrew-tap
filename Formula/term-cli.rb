# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.39.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.39.0/term-0.39.0-darwin-aarch64.tar.gz"
    sha256 "1d27d8654c7c1b19e59d31cbb3bb730e2506410b595eebb263259fccc11b6432"
  elsif OS.mac?
    url "https://pkg.termplane.com/archives/term-cli/0.39.0/term-0.39.0-darwin-x86_64.tar.gz"
    sha256 "466c45f965f2e75d404d9bcd0072c5c94eefaf99d9d43d586fb3443299914f57"
  elsif Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.39.0/term-0.39.0-linux-aarch64.tar.gz"
    sha256 "d777ebc8e8d6725a2ed8b4c5b6ffa5f577d6adcdee5ce23696898abf8153c5b6"
  else
    url "https://pkg.termplane.com/archives/term-cli/0.39.0/term-0.39.0-linux-x86_64.tar.gz"
    sha256 "c9c6da475b8281917156b4575177c46aeaa19f17211c167d68bf7526b437fa5f"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
