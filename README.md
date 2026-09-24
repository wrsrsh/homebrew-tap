# Waris's Homebrew tap

## arelay

[arelay](https://github.com/wrsrsh/arelay) routes OpenAI subagents from Claude
Code and Claude subagents from Codex, while the client keeps control of tools.

```sh
brew install wrsrsh/tap/arelay && arelay install
```

`arelay install` opens the terminal setup wizard. Choose providers, model versions,
credentials, and routing, then confirm before saving or enabling the login service.
Run `arelay setup` to change it later. For scripts, use `arelay install --no-interactive`.
See the [project README](https://github.com/wrsrsh/arelay#readme) for compatibility
trade-offs and setup instructions.

Before removal:

```sh
arelay unsetup both
arelay service uninstall
brew uninstall arelay
```

The formula downloads checksum-verified release artifacts from `wrsrsh/arelay`.
