# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.43.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.43.0/term-0.43.0-darwin-aarch64.tar.gz"
    sha256 "1eeccd80853bbb52eb69ba3af3ad89c5423222346ed4a37cb413fcdd63dc2381"
  elsif OS.mac?
    url "https://pkg.termplane.com/archives/term-cli/0.43.0/term-0.43.0-darwin-x86_64.tar.gz"
    sha256 "7d06dc265be34a9ad4c086486b5cb0d08c9bdf42154947aa64ca9fb5a5bbb7e8"
  elsif Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.43.0/term-0.43.0-linux-aarch64.tar.gz"
    sha256 "b4ba57613d50edb9f0cfbd2d51faa770a66b2031c393591176c4ad92b9981290"
  else
    url "https://pkg.termplane.com/archives/term-cli/0.43.0/term-0.43.0-linux-x86_64.tar.gz"
    sha256 "bd32894dad5cac26acdfb1fc0d4f9f450a165243352843ab06fef14264a66e2f"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
