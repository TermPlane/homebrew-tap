# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.25.1/term-0.25.1-darwin-aarch64.tar.gz"
    sha256 "bc577bb6e05b16b26f743c0ecf52b5e4ab96405cc31cf76efd295b5ea6443359"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.25.1/term-0.25.1-darwin-x86_64.tar.gz"
    sha256 "5d8cfd3f56a8419528d416b727ecc72150f30c1cb77551ed43c1da33949ed4bd"
  end

  depends_on :macos

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
