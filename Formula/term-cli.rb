# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.39.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.39.1/term-0.39.1-darwin-aarch64.tar.gz"
    sha256 "8019e6c8cee00e781971be5e90585af311ebd10628f73b7a3b846bb5c2be6f23"
  elsif OS.mac?
    url "https://pkg.termplane.com/archives/term-cli/0.39.1/term-0.39.1-darwin-x86_64.tar.gz"
    sha256 "c8f59996a814d6626ee011d3152b93c108a1eaa3fcfa8e82c815cd69d5dda4ba"
  elsif Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.39.1/term-0.39.1-linux-aarch64.tar.gz"
    sha256 "e6d321e03c085e29bb0a4dd3fc32222aecf1d840355b25752316dd22baf29b20"
  else
    url "https://pkg.termplane.com/archives/term-cli/0.39.1/term-0.39.1-linux-x86_64.tar.gz"
    sha256 "3d5a1197de08c65690ced96a7dea0b9e02037d245ab306633f5e494b2f81bee1"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
