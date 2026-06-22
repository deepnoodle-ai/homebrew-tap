class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.27"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.27/mobius-darwin-arm64"
      sha256 "2e95aaf33196ed21bff3e0c9b10a8bf4f4d959fdaa2d7fb32d9c1a8b2e0bf8fb"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.27/mobius-darwin-amd64"
      sha256 "03102569784dabac290f401201880585a6753b38a526d236fceeaf03ddda11bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.27/mobius-linux-arm64"
      sha256 "0ac3fd9203bac166b64068b16863bca63a2214b59a9ee765c0b67f1f69fe7b5a"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.27/mobius-linux-amd64"
      sha256 "ce41490b0d4a99573ea99cdc9fbd3bfbbb60567fff92a18894302547c6d568c9"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.27", shell_output("#{bin}/mobius --version 2>&1")
  end
end
