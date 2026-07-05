class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.37"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.37/mobius-darwin-arm64"
      sha256 "8b010e12916f18de86a07fbd86132cb38e41cc7866400a7af0ce1cb9b832aec8"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.37/mobius-darwin-amd64"
      sha256 "9712a16d973244770ee2f934d4b5b0de814e6d77f6c59d32bf59d4de7f29cb8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.37/mobius-linux-arm64"
      sha256 "ba7ee91fdef9ae374dd3051b86cd01d76fbe4aeeea43eaed713f26cf16681db1"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.37/mobius-linux-amd64"
      sha256 "e8f5b4a6b41e4eef702070983745344b92a14b83761bbe5ea685f7cb16cb1d7e"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.37", shell_output("#{bin}/mobius --version 2>&1")
  end
end
