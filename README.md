# homebrew-tap

Homebrew formulae for term-cli, the `term` terminal client, on macOS.

```sh
brew install termplane/tap/term-cli
term --version
```

Upgrades come with `brew upgrade`.

## What the formula installs

`Formula/term-cli.rb` is generated from each term-cli release and replaced
whole by the next one; it is not edited by hand. It downloads the release's
macOS archive for the Mac's CPU (Apple silicon or Intel) from
`https://pkg.hackinggate.com/archives/term-cli/<version>/`, checks it against
the SHA-256 the release published, and installs `term` with its licence
notices. Each archive also has a minisign signature beside it (`.minisig`).

The binary is ad-hoc signed, not notarized. It is installed as a formula, not
a cask, because Homebrew quarantines a cask's download for Gatekeeper and not
a formula's.

Linux users install term-cli from the apt, dnf, zypper or pacman repository at
https://pkg.hackinggate.com instead.
