# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.32.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.3/term-0.32.3-darwin-aarch64.tar.gz"
    sha256 "7953a8ec8699a91634b62d1921c51f7f0441776eceb64f265abaaab454cb40b1"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.3/term-0.32.3-darwin-x86_64.tar.gz"
    sha256 "a5ddcbf4631f8efbce0725ed04c90ed1f2d1a5d80d86a52210ee870edac5ea35"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.3/term-0.32.3-linux-aarch64.tar.gz"
    sha256 "2d2687b18e571367c9b5e855ec06fed1ddbbc43c78ad6bad0be7c2f151413947"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.32.3/term-0.32.3-linux-x86_64.tar.gz"
    sha256 "a1dbc8f0474b9b70542d2f7dc2de9aefa5826edd3a8aaa933df83cf58af47b9e"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
