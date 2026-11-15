# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.36.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.36.0/term-0.36.0-darwin-aarch64.tar.gz"
    sha256 "4f15e2ab85e2b85792d874f4267b4136d6f26f337abb7e296d1737fa9369cd94"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.36.0/term-0.36.0-darwin-x86_64.tar.gz"
    sha256 "9b27dbb13da06c4e5fc08cf54fd144a835e67e224bf01c8d67abb6b0a07a0038"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.36.0/term-0.36.0-linux-aarch64.tar.gz"
    sha256 "1848e1e699c49d7c3d1c72f95c4addbb142ae218e9d9b97595be5087f92eeed2"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.36.0/term-0.36.0-linux-x86_64.tar.gz"
    sha256 "61c3018f5ebc29334d3cd0ad9d2e458fb66b4f684305e36c1612055169819d94"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
