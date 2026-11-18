# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.38.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.38.0/term-0.38.0-darwin-aarch64.tar.gz"
    sha256 "0947fae251a500251beed56f964acebc5505559fe2b65def53f484d2da612a3b"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.38.0/term-0.38.0-darwin-x86_64.tar.gz"
    sha256 "493cd388ca67200eb2c41297b84b13775a54395b1995e5f4ac43a3be7332f16e"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.38.0/term-0.38.0-linux-aarch64.tar.gz"
    sha256 "5628baaac97252e0a2d6986f5cec06f6f2f2866a550615174b835eded0fd9702"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.38.0/term-0.38.0-linux-x86_64.tar.gz"
    sha256 "545d830e495bcbfafbe7834d3a21293163c98adb4e468310d0b0f4494772b862"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
