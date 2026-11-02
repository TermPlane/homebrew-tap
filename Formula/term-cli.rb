# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.29.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.29.0/term-0.29.0-darwin-aarch64.tar.gz"
    sha256 "070ee72606ff1c081d471bc5626bbd5d054cd5c725066ad739d5175689ab0892"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.29.0/term-0.29.0-darwin-x86_64.tar.gz"
    sha256 "12e18e81f95729bad2279271c199a8914693f10851bd556f777efbef76621119"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.29.0/term-0.29.0-linux-aarch64.tar.gz"
    sha256 "2695cf455c8771b01351505b6041fe9e3d8a9b332831777ff8e6dae0ebe45f1a"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.29.0/term-0.29.0-linux-x86_64.tar.gz"
    sha256 "2a3ae4b7646268d634193c71b6a5f05e71c5de141082225f31269c773cb074b7"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
