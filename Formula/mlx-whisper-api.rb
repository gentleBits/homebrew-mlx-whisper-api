# typed: false
# frozen_string_literal: true

# Homebrew formula for MLX Whisper API
# REST API for audio-to-text transcription using MLX Whisper on Apple Silicon
#
# Install with:
#   brew tap gentleBits/mlx-whisper-api
#   brew install mlx-whisper-api
#
class MlxWhisperApi < Formula
  include Language::Python::Virtualenv

  desc "REST API for audio-to-text transcription using MLX Whisper on Apple Silicon"
  homepage "https://github.com/gentleBits/mlx-whisper-api"
  url "https://github.com/gentleBits/mlx-whisper-api/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9c668509f777a9018963f5c84e5d446977fc8c70b3023152d1c812f09185a705"
  license "MIT"
  head "https://github.com/gentleBits/mlx-whisper-api.git", branch: "main"

  # MLX requires Apple Silicon
  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.12"

  # Core dependencies
  resource "mlx" do
    url "https://files.pythonhosted.org/packages/a2/6d/d35fc9e4081dee8aac6e37c2ce1af5306dd07540e9301a17d3ff181d12f6/mlx-0.21.0.tar.gz"
    sha256 "4be8f4a22c1853a1de1f5b59e33c024d5e21af59603948c51cc67c46e04e5a4d"
  end

  resource "mlx-whisper" do
    url "https://files.pythonhosted.org/packages/2f/d9/05c95f6ed8e1073b57b6bb89ce63e40c9e67ce4d0058b5e2d456e58f97cd/mlx_whisper-0.4.2.tar.gz"
    sha256 "d99ff7e11e2f43f4a4c6febe38e34e9f059dba0f62fd79c8fc46dccfc8f7ddee"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/47/1b/1d565e0f6e156f12b9bdedd1f2818bd9fc9e3409be916c6316060348c7a8/numpy-2.2.2.tar.gz"
    sha256 "ed6906f61834d687738d25988ae117683705636936cc605be0bb208b23df4d8f"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/a2/f5/3f921e59f189e513adb9aef826e2841672d50a399fead4e69afdeb808ff4/fastapi-0.115.7.tar.gz"
    sha256 "0f106da6c01d88a6786b3248fb3404179a2907fc98a3a12d652ccfe46e0f6dc7"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/4b/4d/938bd85e5bf2edeec766267a5015ad969730bb91e31b44021dfe8b22df6c/uvicorn-0.34.0.tar.gz"
    sha256 "404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/ff/fb/2984a686808b89a6781526129a4b51266f678b2d2b97ab2d325e56116df8/starlette-0.45.3.tar.gz"
    sha256 "2cbcba2a75806f8a41c722141486f37c28e30a0921c5f6fe4346cb0dcee1302f"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/6a/c7/ca334c2ef6f2e046b1f983cf09c7960c32ecf3b5e059d8c655388765f108/pydantic-2.10.5.tar.gz"
    sha256 "278b38dbbaec562011d659ee05f63346951b3a248a6f3642e1bc68894ea2b4ff"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/fc/01/f3e5ac5e7c25833db5eb555f7b7ab24cd6f8c322d3a3ad2d67a952dc0abc/pydantic_core-2.27.2.tar.gz"
    sha256 "eb026e5a4c1fee05726072337ff51d1efb6f59090b7da90d30ea58625b1ffb39"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/30/0f/06ee20a0e4d2f71b8b0fc46a39af3f4cfb0c376d6bef8b577cde5de4c1ee/python_multipart-0.0.20.tar.gz"
    sha256 "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9571"
  end

  resource "huggingface-hub" do
    url "https://files.pythonhosted.org/packages/93/27/1fb384a841e9661c808a3e4fc2dee9ef99996e1f3a9b9706f4eb4ab3fc03/huggingface_hub-0.27.1.tar.gz"
    sha256 "c004463ca870283909d715d20f066ebd6434799f3b7c9c8a710ade7effd87c20"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03/h11-0.14.0.tar.gz"
    sha256 "8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d"
  end

  resource "httptools" do
    url "https://files.pythonhosted.org/packages/a7/9a/ce5e1f7e131522e6d3426e8e7a490b3a01f39a6696602e1c4f33f9e94277/httptools-0.6.4.tar.gz"
    sha256 "4e93eee4f0f8ff98299efdb35b8a4703a7a2d326498b5bd37bb36ef81377864f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/a3/73/199a98fc2dae33535d6b8e8e6ec01f8c1d76c9adb096c6b7d64823038cde/anyio-4.8.0.tar.gz"
    sha256 "1d9fe889df5212298c0c0723fa20479d1b94883a2df44f529e519fecdc43def9"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a/certifi-2024.12.14.tar.gz"
    sha256 "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357/charset_normalizer-3.4.1.tar.gz"
    sha256 "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/aa/63/e53da845320b757bf29ef6a9062f5c669f00f0e84e453c1de065e08cfeb1/urllib3-2.3.0.tar.gz"
    sha256 "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896uj/requests/releases/2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/9d/db/3ef5bb276dae65d283f291ec6c65e2cd6b1f1898b2b8633f6028e68fd2a4/filelock-3.16.1.tar.gz"
    sha256 "c249fbfcd5db47e5e2d6d62198e565475ee65e4831e2561c8e313fa7eb961435"
  end

  resource "fsspec" do
    url "https://files.pythonhosted.org/packages/de/86/5486b0188d08aa643e127774a99bac51ffa6cf343e3deb0583956dca5b22/fsspec-2024.12.0.tar.gz"
    sha256 "670700c977ed2fb51e0f9f1c40343a2426ad92b28da8837482fbde3da2f82f31"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959b7f74571d160e2d0f7f7a5"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/d0/63/68dbb6eb2de9cb10ee4c9c14a0148804425e13c4fb20d61cce69f53106da/packaging-24.2.tar.gz"
    sha256 "c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f"
  end

  resource "uvloop" do
    url "https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6/uvloop-0.21.0.tar.gz"
    sha256 "3bf12b0fda68447806a7ad847bfa591613177275f35b6724b1ee573faa3704e3"
  end

  resource "watchfiles" do
    url "https://files.pythonhosted.org/packages/f5/26/c705fc77d0a9ecdb9b66f1e2976d95b81df3cae518967431e7dbf9b5e219/watchfiles-1.0.4.tar.gz"
    sha256 "6ba473efd11062d73e4f00c2b730255f9c1bdd73cd5f9fe5b5da8dbd4a717205"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/94/54/8359678c726243d19fae38ca14a334e740782336c9f19700858c4eb64a1e/websockets-14.2.tar.gz"
    sha256 "5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      MLX Whisper API has been installed!

      To start the server:
        mlx-whisper-api

      To start on a custom port:
        mlx-whisper-api --port 8080

      To enable development mode with auto-reload:
        mlx-whisper-api --reload

      For all options:
        mlx-whisper-api --help

      API documentation will be available at:
        http://localhost:8000/docs

      Note: The first transcription may take longer as the Whisper model
      needs to be downloaded from HuggingFace Hub.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mlx-whisper-api --version")
  end
end
