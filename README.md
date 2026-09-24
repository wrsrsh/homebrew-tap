# Waris's Homebrew tap

## arelay

[arelay](https://github.com/wrsrsh/arelay) routes OpenAI subagents from Claude
Code and Claude subagents from Codex, while the client keeps control of tools.

```sh
brew install wrsrsh/tap/arelay && arelay install
```

`arelay install` starts and enables the background login service. Configure API
credentials and opt clients in with `arelay setup claude` or `arelay setup codex`.
See the [project README](https://github.com/wrsrsh/arelay#readme) for compatibility
trade-offs and setup instructions.

Before removal:

```sh
arelay unsetup both
arelay service uninstall
brew uninstall arelay
```

The formula downloads checksum-verified release artifacts from `wrsrsh/arelay`.
