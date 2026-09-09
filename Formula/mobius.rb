class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.62"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.62/mobius-darwin-arm64"
      sha256 "0d9219a0bee314badc5267b32a59c659a489be36131f0ee50b090aa5a7c7a45b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.62/mobius-darwin-amd64"
      sha256 "b609d6d968393af9973b73ce7bc6942945114c873426837c0bf725a54e6cbb36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.62/mobius-linux-arm64"
      sha256 "c9d41ca4dac095be7c09db5a1231bad68a1a7ddb290a22da76abc2002c9e4f13"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.62/mobius-linux-amd64"
      sha256 "39c14254ae122968bddebca998b9b5f398aa0ab2a7dd504c135140a0bdfdacda"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.62", shell_output("#{bin}/mobius --version 2>&1")
  end
end
