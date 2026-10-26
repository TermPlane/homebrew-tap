# homebrew-tap

Homebrew formulae for term-cli, the `term` terminal client, on macOS and Linux.

```sh
brew install termplane/tap/term-cli
term --version
```

Upgrades come with `brew upgrade`.

## What the formula installs

`Formula/term-cli.rb` is generated from each term-cli release and replaced
whole by the next one; it is not edited by hand. It downloads the release's
archive for the machine's OS and CPU (macOS on Apple silicon or Intel, Linux
on aarch64 or x86_64) from
`https://pkg.hackinggate.com/archives/term-cli/<version>/`, checks it against
the SHA-256 the release published, and installs `term` with its licence
notices. Each archive also has a minisign signature beside it (`.minisig`).

The binary is ad-hoc signed, not notarized. It is installed as a formula, not
a cask, because Homebrew quarantines a cask's download for Gatekeeper and not
a formula's.

On Linux the formula takes effect from the first release with Linux archives
(after 0.25.1, which is macOS-only); the binary needs glibc 2.36 or later
(Debian 12, Ubuntu 23.04 and later). The apt, dnf, zypper and pacman
repository at https://pkg.hackinggate.com installs the same client.
