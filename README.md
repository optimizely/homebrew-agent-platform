# homebrew-opal

Homebrew tap for [Opal Desktop](https://opal.optimizely.com) — Optimizely's AI
assistant, packaged for macOS.

```bash
brew tap optimizely/opal
brew install --cask opal-desktop
```

Upgrades then arrive with everything else:

```bash
brew upgrade --cask opal-desktop
```

## Contents

| Path | Role |
|---|---|
| `Casks/opal-desktop.rb` | Tracks the current release |
| `Casks/opal-desktop@<version>.rb` | Pin or roll back to a specific version |

Versioned casks exist because every release stays on the CDN. Without them
that history is unreachable through brew, and someone hitting a regression
has no way back short of a manual `.dmg` download.

```bash
brew install --cask optimizely/opal/opal-desktop@1.2.3
```

## How updates get here

**Do not hand-edit `version` or `sha256`.** The `brew` job in
[`opal-desktop-publish.yml`](https://github.com/newscred/opal-app/blob/main/.github/workflows/opal-desktop-publish.yml)
rewrites both and pushes here whenever a production release is published. A
hand-edit races that job and will be overwritten; worse, a hand-typed sha256
that is wrong breaks `brew install` for everyone until someone notices.

The DMG itself is served from `dl.opal.optimizely.com`, not from GitHub —
`newscred/opal-app` is private, so release assets are not anonymously
fetchable. See
[`docs/tech-spec/desktop/package-manager-distribution.md`](https://github.com/newscred/opal-app/blob/main/docs/tech-spec/desktop/package-manager-distribution.md).

## Why this tap exists

Official `homebrew-cask` has a notability bar that a product distributed from
a private repository cannot meet. An org-owned tap is the standard answer —
1Password, Docker and Datadog all ship this way — and it mirrors the
self-hosted APT repository Opal already uses on Debian/Ubuntu.

## Why the cask is `opal-desktop`, not `opal`

`opal` is already a formula in homebrew-core (a Ruby-to-JavaScript
transpiler). Casks and formulae are separate namespaces, so `--cask opal`
would have resolved here — but `brew install opal` would silently install the
transpiler instead. `opal-desktop` collides with nothing, works with or
without `--cask`, and matches the Debian package and the executable name.
