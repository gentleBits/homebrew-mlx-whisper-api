# typed: false
# frozen_string_literal: true

# Homebrew formula for MLX Whisper API
class MlxWhisperApi < Formula
  desc "REST API for audio-to-text transcription using MLX Whisper on Apple Silicon"
  homepage "https://github.com/gentleBits/mlx-whisper-api"
  url "https://github.com/gentleBits/mlx-whisper-api/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9821d5a13d18fea77b1fed94b71eba9809037c46c3cf967419a9e326a7407503"
  license "MIT"
  head "https://github.com/gentleBits/mlx-whisper-api.git", branch: "main"

  # MLX requires Apple Silicon
  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.12"

  def install
    # Copy source to libexec for post_install to use
    # post_install bypasses Homebrew's dylib relocation which fails on
    # Rust-built Python extensions (pydantic-core, watchfiles, httptools)
    (libexec/"src").install Dir["*"]

    # Create bin script that will invoke the package after post_install
    (bin/"mlx-whisper-api").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python" -m app "$@"
    EOS
  end

  def post_install
    # Create virtualenv in post_install to bypass Homebrew's dylib relocation
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv_python = libexec/"bin/python"

    # Create virtualenv with pip
    system python, "-m", "venv", libexec

    # Install dependencies using python -m pip (more reliable than pip script)
    system venv_python, "-m", "pip", "install", "--upgrade", "pip"
    system venv_python, "-m", "pip", "install",
           "mlx-whisper==0.4.2",
           "fastapi==0.115.7",
           "uvicorn[standard]==0.34.0",
           "python-multipart==0.0.20",
           "huggingface-hub==0.27.1"

    # Install the package itself from the copied source
    system venv_python, "-m", "pip", "install", libexec/"src"
  end

  def caveats
    <<~EOS
      MLX Whisper API has been installed!

      To start the server:
        mlx-whisper-api

      To start on a custom port:
        mlx-whisper-api --port 8080

      For all options:
        mlx-whisper-api --help

      API documentation will be available at:
        http://localhost:1738/docs

      Note: The first transcription may take longer as the Whisper model
      needs to be downloaded from HuggingFace Hub.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mlx-whisper-api --version")
  end
end
