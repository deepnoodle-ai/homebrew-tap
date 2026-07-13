class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.49"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.49/mobius-darwin-arm64"
      sha256 "a7a95cb86a8df7cd71f9fecf48ca5f92f972f528259d7d5e41ee8fbd3a67c611"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.49/mobius-darwin-amd64"
      sha256 "1dce98827fc8406bd7776b2e31202f6dbb6b2ac96a89d12199f663771bb03bbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.49/mobius-linux-arm64"
      sha256 "21defaabc108d41b48d0ff212e6fd321d80d87d2e9eae4369d8fd6a7c6bfcc20"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.49/mobius-linux-amd64"
      sha256 "d640456539d7c03266aa0052da007bd83decc3888199aa1b25e7e0191b7faa32"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.49", shell_output("#{bin}/mobius --version 2>&1")
  end
end
