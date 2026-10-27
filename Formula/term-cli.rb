# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.25.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.25.3/term-0.25.3-darwin-aarch64.tar.gz"
    sha256 "782139bfee852bec45473b77c77316bd1741f1e0d4c56697f6d4e314e254647a"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.25.3/term-0.25.3-darwin-x86_64.tar.gz"
    sha256 "656491e6a764ee0ce16ad2dff765389eeb1c6f7133ecda65a1441652f06e76b7"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.25.3/term-0.25.3-linux-aarch64.tar.gz"
    sha256 "1ab73f60825232048afa65141752e1617bb5947a4883b3571535d7421f683621"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.25.3/term-0.25.3-linux-x86_64.tar.gz"
    sha256 "64a5985c8c7fdabb4e9b663b5e7d3d00d996fa8958541e31ced296893e2bc093"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
