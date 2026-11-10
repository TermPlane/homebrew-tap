# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.33.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.2/term-0.33.2-darwin-aarch64.tar.gz"
    sha256 "631faca0ab823623df85cbf7c4afb70166c573511bd2d8c7310bcf6a6bd0e0ac"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.2/term-0.33.2-darwin-x86_64.tar.gz"
    sha256 "ea0d010364177b8c71c23eca43c69a41758a0cebbb99167a689074cfd780f087"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.2/term-0.33.2-linux-aarch64.tar.gz"
    sha256 "3afdcec70b89f62b044dd390f1a0b50f02225cee4b0e78906454512e77ee82e8"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.33.2/term-0.33.2-linux-x86_64.tar.gz"
    sha256 "31b0f15ec77a5db8667b6a5601cbca077d69afd4cc2b75c08dd59b565f948e41"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
