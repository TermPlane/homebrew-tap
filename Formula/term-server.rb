# Generated from term-server's release by scripts/channels.py; a release
# replaces it whole, so an edit here does not last.
class TermServer < Formula
  desc "Term's PTY and WebSocket backend"
  homepage "https://github.com/TermPlane/homebrew-tap"
  version "0.22.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://pkg.hackinggate.com/archives/term-server/0.22.0/term-server-0.22.0-darwin-aarch64.tar.gz"
    sha256 "d6f4e5736c96ee2d803160530fb5aa8dca4d8c8c81e76df83bb6681f382679d8"
  else
    url "https://pkg.hackinggate.com/archives/term-server/0.22.0/term-server-0.22.0-darwin-x86_64.tar.gz"
    sha256 "cd8125b185223136cdc1cc71242883a9bd2eda08c4051b2901ecb731c6e195da"
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
      Then start the front as _term, and give the same option to every
      restart:
        sudo brew services start --sudo-service-user=_term term-server
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
