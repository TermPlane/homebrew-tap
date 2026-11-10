# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.33.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.1/term-0.33.1-darwin-aarch64.tar.gz"
    sha256 "e0300a4640b7753532b1e69a916b72181a32920f93772a852ce5b60e46e922c6"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.1/term-0.33.1-darwin-x86_64.tar.gz"
    sha256 "1d2ead7165f258f8b1f8bd45da832b77d01f1b1a77b3cc47641afac509667e30"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.1/term-0.33.1-linux-aarch64.tar.gz"
    sha256 "cfae65c2cadc3444827b010dbf0240a0f98d3e1d9ab2908145acf2babf31d30b"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.1/term-0.33.1-linux-x86_64.tar.gz"
    sha256 "bac6c913ff10f357855b95256a9b0f5637d7a6b1edd18f3cb512e2a575a314b6"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
