# Escyezi Tap

Community-maintained Homebrew formulae.

## Formulae

### DeepSeek Harness

[DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) is a
plugin-based agent harness developed by DeepSeek. This formula is maintained by
the tap owner and is not an official DeepSeek distribution.

```sh
brew install escyezi/tap/deepseek-harness
```

The installed command is `dsh`. It conflicts with Homebrew Core's unrelated
`dsh` formula because both provide that executable.

## How do I install these formulae?

`brew install escyezi/tap/<formula>`

Or `brew tap escyezi/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "escyezi/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
