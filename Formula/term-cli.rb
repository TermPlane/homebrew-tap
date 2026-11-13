# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.35.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.3/term-0.35.3-darwin-aarch64.tar.gz"
    sha256 "eb10ce8d935ac5e87a9820673eeef199866339afb9c4760e1b434814be79a3f6"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.3/term-0.35.3-darwin-x86_64.tar.gz"
    sha256 "f118bb74fb72f4dfaabca0ff3fc54d31c7a9c26b2b505853bc6adb71c404332a"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.3/term-0.35.3-linux-aarch64.tar.gz"
    sha256 "70d69a6f0276db8ee7c6a0f7dbaa803bcadcdeb948536c3d14881aba144dfbb3"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.35.3/term-0.35.3-linux-x86_64.tar.gz"
    sha256 "db4c18608bda00f268d7a68acb414a8092d55519f6f9a983c2ec6a59d487d2ef"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
