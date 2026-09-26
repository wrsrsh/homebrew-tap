# Waris's Homebrew tap

## tns

[tns](https://github.com/wrsrsh/tns) is a predictive terminal for a remote
fish shell: it paints fish's full redraw (autosuggestion, colours) for each
keystroke before the round trip, over ssh or mosh.

```sh
brew install wrsrsh/tap/tns
tns HOST            # or: tns --mosh HOST
```

The remote host needs fish; for `--mosh` also mosh, see the
[mosh setup notes](https://github.com/wrsrsh/tns#setting-up-mosh).
The formula builds from the checksum-verified release tarball.

## arelay

[arelay](https://github.com/wrsrsh/arelay) lets Claude Code and Codex delegate to
each other's installed CLI, using existing logins and native tools.

```sh
brew install wrsrsh/tap/arelay && arelay install
```

Choose a direction to connect and start at login, then restart your clients.
Your existing CLI authentication and providers stay in place. For unattended
installation, use `arelay install --no-interactive`.
See the [project README](https://github.com/wrsrsh/arelay#readme) for usage and advanced setup.

Before removal:

```sh
arelay unsetup both
arelay service uninstall
brew uninstall arelay
```

The formula downloads checksum-verified release artifacts from `wrsrsh/arelay`.
