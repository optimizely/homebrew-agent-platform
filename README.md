# homebrew-opal

Homebrew tap for [Opal Desktop](https://github.com/newscred/opal-app).

This repo is temporarily private until publishing is set up. Once public,
installing will be:

```
brew tap optimizely/opal
brew install --cask opal
```

## Updating the cask

`Casks/opal.rb` currently points at a placeholder version/sha256. Once
newscred/opal-app's release + DMG-mirror workflows have published a signed
DMG to dl.opal.optimizely.com, update `version` and `sha256` (from that
release's `checksums.txt`) to match.
