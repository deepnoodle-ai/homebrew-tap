class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.7/mobius-darwin-arm64"
      sha256 "783afd5c744e2eb551b5442971d9e7d6fd0b9a7e2e56479a7db40bfa2accf7b4"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.7/mobius-darwin-amd64"
      sha256 "1f4f7f923fc69ee7f0292c227ffce113941cee942079e5132f1597ab419f313e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.7/mobius-linux-arm64"
      sha256 "89060b1f22288dd48783d79af45ce7b850870390d02e6e0b2a178b878ddee176"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.7/mobius-linux-amd64"
      sha256 "dadba3da8df0f3237ddae4d43af9a8b66d0231aefc26627bfc5c2bfebb6afd31"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.7", shell_output("#{bin}/mobius --version 2>&1")
  end
end
