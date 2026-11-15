# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.35.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.5/term-0.35.5-darwin-aarch64.tar.gz"
    sha256 "2e704ad47034fd66a63466739a1bad0c4c9860bfd6ded8d7a008b1386e3f175a"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.5/term-0.35.5-darwin-x86_64.tar.gz"
    sha256 "70e588c4e7dd0b117c7beefce66f41ce22f88082ab7cd13db2c560360b4a9300"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.5/term-0.35.5-linux-aarch64.tar.gz"
    sha256 "28aa56465b66f4146bde5a4e329f1b38d442b9b7734ab46524ff4fcc98e0983a"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.5/term-0.35.5-linux-x86_64.tar.gz"
    sha256 "54f604db09ecefb03a2f2347cff085c7fc7a08eddd62135148df4d4b20bcef4e"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
