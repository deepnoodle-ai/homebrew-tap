class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.34"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.34/mobius-darwin-arm64"
      sha256 "4c7ed98ba2d58d30e17144e14df17b85ed31224c27bbb877cf252e6e14b4e53f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.34/mobius-darwin-amd64"
      sha256 "bdb98518990f15effef7e7b27d9584993ca320d8e990a37f9daeca07868651f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.34/mobius-linux-arm64"
      sha256 "d4659493d75df272f1ff77969c90f6bc859f963187e4f09cad062ab286d576ec"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.34/mobius-linux-amd64"
      sha256 "ec3b9d83cb138d34a017df771d62809122ca3708ab88e0a0d2b5960de1b4568f"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.34", shell_output("#{bin}/mobius --version 2>&1")
  end
end
