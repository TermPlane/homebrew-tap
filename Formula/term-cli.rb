# Generated from term-cli's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermCli < Formula
  desc "Term's terminal client, from a local tty to a machine through the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.27.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.27.0/term-0.27.0-darwin-aarch64.tar.gz"
    sha256 "d02e445ec23e2346d665b24d84b7c3a3f6e59fe2f83532487fff01fc4e740858"
  elsif OS.mac?
    url "https://pkg.hackinggate.com/archives/term-cli/0.27.0/term-0.27.0-darwin-x86_64.tar.gz"
    sha256 "c41d7850282d70f0eec9b4e06df52d469378ba35cfeaa8b4f75679d469388ffb"
  elsif Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-cli/0.27.0/term-0.27.0-linux-aarch64.tar.gz"
    sha256 "417285eda92e32f61b78e428623bb56f1dc5eaec99495b935d2434f2f238db29"
  else
    url "https://pkg.hackinggate.com/archives/term-cli/0.27.0/term-0.27.0-linux-x86_64.tar.gz"
    sha256 "dbbff3326fee5c5d54b5403a6877f6fd8908ed3972562c8d0609d4c08e99e27d"
  end

  def install
    bin.install "term"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term --version")
  end
end
