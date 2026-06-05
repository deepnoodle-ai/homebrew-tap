class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.22"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.22/mobius-darwin-arm64"
      sha256 "578a2f50859a472ad4f78d348a9afc1e6ea2c6b05f6f6cd04f04b04e19cc4dcb"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.22/mobius-darwin-amd64"
      sha256 "b0ce3a9c6c05fdecf47d8cbc6722868bc73287f8d5eb3926ffe7e49785522bf1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.22/mobius-linux-arm64"
      sha256 "8ca820183e9e0490aaf1426f153a89eda115331b83e1dc600678257789cd4a9c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.22/mobius-linux-amd64"
      sha256 "3551eb8814ef21525a91f980f2e74855b80906c7163a3450995dbfd404e696e6"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.22", shell_output("#{bin}/mobius --version 2>&1")
  end
end
