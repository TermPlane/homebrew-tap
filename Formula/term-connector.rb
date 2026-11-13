# Generated from term-connector's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermConnector < Formula
  desc "Term's outbound connection from a machine to the relay"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.31.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-connector/0.31.3/term-connector-0.31.3-darwin-aarch64.tar.gz"
    sha256 "1fb4acd6d88c11878e6c95aa1b48d0821a0c65ac57d3ec37ed68f0a36d4c13a7"
  else
    url "https://pkg.hackinggate.com/archives/term-connector/0.31.3/term-connector-0.31.3-darwin-x86_64.tar.gz"
    sha256 "5615c890cb6ecd006f563a22bd8b0acd5785ad4d33629d02d8979501578f8618"
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
