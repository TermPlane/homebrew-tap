# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.31.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.31.0/term-0.31.0-darwin-aarch64.tar.gz"
    sha256 "b364d8cd1d627313efa01547151d2a03100614a3ce23f54b0ef683306410fdb8"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.31.0/term-0.31.0-darwin-x86_64.tar.gz"
    sha256 "c5a8261a9b7d9317433b79f6d53772fb6f19c286726a71a35b5f1ee6a52b0f84"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.31.0/term-0.31.0-linux-aarch64.tar.gz"
    sha256 "2f82c5fe1930cdde72f296f2e4728605e0a58d9a2c411a015393b4364d3331fd"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.31.0/term-0.31.0-linux-x86_64.tar.gz"
    sha256 "5a65dad4e309116f8dd7c1b90472ea4093183be219e50376bc4da8c536586b42"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
