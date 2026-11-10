# Generated from term-server's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermServer < Formula
  desc "Term's PTY and WebSocket backend"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.22.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-server/0.22.2/term-server-0.22.2-darwin-aarch64.tar.gz"
    sha256 "f3192d964fb4266250dfc828ae2bedd228e7d3bc8a69d9d462a96164357f1008"
  else
    url "https://pkg.hackinggate.com/archives/term-server/0.22.2/term-server-0.22.2-darwin-x86_64.tar.gz"
    sha256 "be840c252f3c67ba6567704e819c9d80a5e3cc32972a00d12a051a26207aff4d"
  end

  depends_on :macos

  def install
    bin.install "term-server"
    libexec.install "install-service.sh", "term-server-user.plist", "term-server.plist"
  end

  def caveats
    <<~EOS
      term-server runs as a machine under launchd. Once, as root, create the
      front's account (_term), the directories and each mapped account's
      agent, mapping your identity to this account:
        sudo #{opt_libexec}/install-service.sh --binary #{opt_bin}/term-server --identity you@example.com
      Then start the front, which runs as _term. Started as _term, the
      install stays yours, so brew upgrade and brew uninstall work without sudo:
        sudo brew services start --sudo-service-user=_term term-server
      Homebrew's own line below works too: the front drops to its account
      itself, but Homebrew then makes the install root's, and upgrading or
      uninstalling it needs sudo.
      The front's settings (allowed hosts, Access, service mode) are
        /Library/Application Support/TermPlane/term.env
      and the logs are in /Library/Logs/TermPlane.
    EOS
  end

  service do
    run [
      opt_bin/"term-server",
      "serve",
      "--capacity-file",
      "/Library/Application Support/TermPlane/capacity.toml",
      "--env-file",
      "/Library/Application Support/TermPlane/term.env",
    ]
    environment_variables HOME:                       "/Library/Application Support/TermPlane/state",
                          TERMPLANE_USERS_FILE:       "/Library/Application Support/TermPlane/users.toml",
                          TERMPLANE_AGENT_SOCKET_DIR: "/Library/Application Support/TermPlane/run/users",
                          TERMPLANE_AGENT_LOCK_DIR:   "/Library/Application Support/TermPlane/run/agents",
                          TERMPLANE_FRONT_SOCKET:     "/Library/Application Support/TermPlane/run/front/front.sock"
    working_dir "/Library/Application Support/TermPlane/state"
    log_path "/Library/Logs/TermPlane/term-server.log"
    error_log_path "/Library/Logs/TermPlane/term-server.log"
    keep_alive true
    require_root true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/term-server --version")
  end
end
