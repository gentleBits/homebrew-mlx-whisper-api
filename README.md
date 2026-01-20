# Homebrew Tap for MLX Whisper API

This is a [Homebrew](https://brew.sh) tap for [MLX Whisper API](https://github.com/gentleBits/mlx-whisper-api) - a REST API for audio-to-text transcription using MLX-optimized Whisper models on Apple Silicon.

## Requirements

- macOS with Apple Silicon (M1/M2/M3/M4)
- [Homebrew](https://brew.sh) installed

## Installation

```bash
brew tap gentleBits/mlx-whisper-api
brew install mlx-whisper-api
```

## Usage

Start the server:
```bash
mlx-whisper-api
```

Start on a custom port:
```bash
mlx-whisper-api --port 8080
```

Enable development mode with auto-reload:
```bash
mlx-whisper-api --reload
```

View all options:
```bash
mlx-whisper-api --help
```

Once running, API documentation is available at: http://localhost:8000/docs

## Updating

```bash
brew update
brew upgrade mlx-whisper-api
```

## Uninstalling

```bash
brew uninstall mlx-whisper-api
brew untap gentleBits/mlx-whisper-api
```

## License

MIT
