class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.13/mobius-darwin-arm64"
      sha256 "1f5e0082640c6594049fc9fa49b6765dd30499b085d184f520aa6b6f9ce7ad96"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.13/mobius-darwin-amd64"
      sha256 "676aeaab3acdba5fdd1018da639b455cd01c67475b2eba5f7d2db8c9520442e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.13/mobius-linux-arm64"
      sha256 "f0de2835d0b7bd8a99fa48ed333ab80ec6f11b71e1e3b2f336dca015b400302d"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.13/mobius-linux-amd64"
      sha256 "6819a5f253f6d79a51ca007570f85a64d1f34fc394e63b1e8e046faccdcc384e"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.13", shell_output("#{bin}/mobius --version 2>&1")
  end
end
