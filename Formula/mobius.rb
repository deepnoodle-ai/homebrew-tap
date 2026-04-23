class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.6/mobius-darwin-arm64"
      sha256 "ce46b1363c4ccb4c62a2682fcae6de739c58df66f6f713bfd07557fe99813bc4"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.6/mobius-darwin-amd64"
      sha256 "e25f0910403dd5357159c61ab9e27d2c6ba98d3bd85ee403d2b54b7e1a15cc15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.6/mobius-linux-arm64"
      sha256 "1f0920587a036fac205f666c6041b30b1bfd57ac3f7000bf10dec8d8a6577792"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.6/mobius-linux-amd64"
      sha256 "cc532b95928187232ca8c0de29a03531f24542214d5b9d70ac0eedfe6e4d8999"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.6", shell_output("#{bin}/mobius --version 2>&1")
  end
end
