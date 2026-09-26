# Waris's Homebrew tap

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
