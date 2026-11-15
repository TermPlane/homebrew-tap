# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.37.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.37.0/term-0.37.0-darwin-aarch64.tar.gz"
    sha256 "bb0985b0d141e348f5ea953795f1dd4b1451d2df154bd8d2129d037c34b6a3f2"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.37.0/term-0.37.0-darwin-x86_64.tar.gz"
    sha256 "ded74f5aaa7818f9237310d56636334b60dc8305f84e9851b8f5ce6874854f81"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.37.0/term-0.37.0-linux-aarch64.tar.gz"
    sha256 "a601d9044253b162644ae8b82a7e8f69f574d8e8509b65f1accb104a9e2cfbf9"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.37.0/term-0.37.0-linux-x86_64.tar.gz"
    sha256 "6de4aa133ee6aa6087a32287c878807f8cb3818bec116209e0538514d742507b"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
