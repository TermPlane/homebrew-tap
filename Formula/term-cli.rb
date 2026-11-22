# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.40.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.40.0/term-0.40.0-darwin-aarch64.tar.gz"
    sha256 "990f54bc75a642f3e01d0cbc510f4bbe6a958329d48c0872d3eb389b5398d9db"
  elsif OS.mac?
    url "https://pkg.termplane.com/archives/term-cli/0.40.0/term-0.40.0-darwin-x86_64.tar.gz"
    sha256 "3937ce5e64864d09514c05e10071f6333990b10e94eb5fd960d0038839fd9914"
  elsif Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-cli/0.40.0/term-0.40.0-linux-aarch64.tar.gz"
    sha256 "ff30a03940eb4ec5695b0ad5004ff5265fa730ec2e3d30c112a78768246d5ca4"
  else
    url "https://pkg.termplane.com/archives/term-cli/0.40.0/term-0.40.0-linux-x86_64.tar.gz"
    sha256 "b31e9fdb119e43916b68b19944fcee56a79e6e53eafbeb540621abda897b4b76"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
