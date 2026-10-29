# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.26.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.26.0/term-0.26.0-darwin-aarch64.tar.gz"
    sha256 "8ca75850ca7d1a70c9d58aea4b4ef4272a0605924901e6072740c7097e0a71bb"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.26.0/term-0.26.0-darwin-x86_64.tar.gz"
    sha256 "1cf815740e1a0efe1b5eb2ebe6b27d8c25e6a90ff1f74b50e209d3b45b863bd5"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.26.0/term-0.26.0-linux-aarch64.tar.gz"
    sha256 "a6c0cefb90ec14d281385f105a86af8e5700ac5f31dce90de356ace1d98a072b"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.26.0/term-0.26.0-linux-x86_64.tar.gz"
    sha256 "242494ca641a2b03801f5ec14f58d9b7a6a8deeb649b4f0d43e9400880a01688"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
