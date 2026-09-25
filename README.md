# Waris's Homebrew tap

## arelay

[arelay](https://github.com/wrsrsh/arelay) lets Claude Code and Codex delegate to
each other's installed CLI, using existing logins and native tools.

```sh
brew install wrsrsh/tap/arelay && arelay install
```

`arelay install` opens the minimal setup: choose a direction, then connect.
Sign in through the original CLIs with `codex login` and `claude auth login`.
API keys and Azure are optional under `arelay setup --api`.
For scripts, use `arelay install --no-interactive`.
See the [project README](https://github.com/wrsrsh/arelay#readme) for compatibility
trade-offs and setup instructions.

Before removal:

```sh
arelay unsetup both
arelay service uninstall
brew uninstall arelay
```

The formula downloads checksum-verified release artifacts from `wrsrsh/arelay`.
