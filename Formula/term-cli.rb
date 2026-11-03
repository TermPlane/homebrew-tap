# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.30.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.30.1/term-0.30.1-darwin-aarch64.tar.gz"
    sha256 "8e4c08c29a908b55d2f9e08fc52d6ed3546155054a020abe6a743084402d391d"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.30.1/term-0.30.1-darwin-x86_64.tar.gz"
    sha256 "bc1e91ed19f24dab33cd4b5f14664d65e925c0459619f550235ac7fed523ec91"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.30.1/term-0.30.1-linux-aarch64.tar.gz"
    sha256 "69e1b0a706857dc34e60fcaec7024cf34e245f29e39df64f742fe2641639f56a"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.30.1/term-0.30.1-linux-x86_64.tar.gz"
    sha256 "8001a9a333668a8f050b28594252c7d8a0d7ea836f91f6dcd0c69e3c25b8501f"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
