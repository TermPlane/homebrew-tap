# Generated from term-connector's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermConnector < Formula
  desc "Term's outbound connection from a machine to the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.33.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://pkg.termplane.com/archives/term-connector/0.33.2/term-connector-0.33.2-darwin-aarch64.tar.gz"
    sha256 "8524eb1140730c6e2fd572125b3fc95da66100a2e59d876e415a0415b2c9fd4a"
  else
    url "https://pkg.termplane.com/archives/term-connector/0.33.2/term-connector-0.33.2-darwin-x86_64.tar.gz"
    sha256 "44ec3cee90026aacf49bd703f28c17e4740b49d522483bd6a054528ba71207ba"
  end

  depends_on :macos
  depends_on "termplane/tap/term-server"

  def install
    bin.install "term-connector"
    libexec.install "install-service.sh"
    doc.install "THIRD_PARTY_LICENSES.html", "RUST_STANDARD_LIBRARY_LICENSES.html", "LICENSE_MANIFEST.json"
  end

  def caveats
    <<~EOS
      term-connector runs as a machine's relay connector under launchd,
      bridging relay pairs to term-server's front on 127.0.0.1:7682. Set
      term-server up first (brew info term-server). Then enroll this
      machine, as root, writing its keys and settings beside term-server's:
        sudo #{opt_bin}/term-connector enroll --out-dir "/Library/Application Support/TermPlane" \\
          --state-dir "/Library/Application Support/TermPlane/connector" --origin <service> --unix <account>
      and once, as root, create the connector's account (_term-connector), hand
      it the files enroll wrote and open the front's report socket to it:
        sudo #{opt_libexec}/install-service.sh --binary #{opt_bin}/term-connector
      Then start the connector, which runs as _term-connector. Started as _term-connector,
      the install stays yours, so brew upgrade and brew uninstall work without sudo:
        sudo brew services start --sudo-service-user=_term-connector term-connector
      Homebrew's own line below works too: the connector drops to its account
      itself, but Homebrew then makes the install root's, and upgrading or
      uninstalling it needs sudo.
      Its settings are
        /Library/Application Support/TermPlane/connector.env
      and its log is /Library/Logs/TermPlane/term-connector.log.
    EOS
  end

  service do
    run [
      opt_bin/"term-connector",
      "run",
      "--env-file",
      "/Library/Application Support/TermPlane/connector.env",
    ]
    environment_variables STATE_DIRECTORY:        "/Library/Application Support/TermPlane/connector",
                          TERMPLANE_FRONT_SOCKET: "/Library/Application Support/TermPlane/run/front/front.sock"
    working_dir "/Library/Application Support/TermPlane/connector"
    log_path "/Library/Logs/TermPlane/term-connector.log"
    error_log_path "/Library/Logs/TermPlane/term-connector.log"
    keep_alive successful_exit: false
    throttle_interval 30
    require_root true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term-connector --version")
  end
end
