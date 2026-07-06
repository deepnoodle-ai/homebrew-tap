class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.40"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.40/mobius-darwin-arm64"
      sha256 "1a894617fa3521f2b531e6a9ab1d6c7b4eb4ba59080fbddbefb81e7fabc830ed"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.40/mobius-darwin-amd64"
      sha256 "fde5582efc48d78f1b2c886a41aac894628025299c05efffb25b387f7c2e3f8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.40/mobius-linux-arm64"
      sha256 "aaaf4e639d505c090a7856f2ae3ac522ef44fea3379bb9c8390fbf69980738e7"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.40/mobius-linux-amd64"
      sha256 "65ca22f1d5b27543087e3c71c813611eac3f5a870229ab71f30f60e9b7d6a409"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.40", shell_output("#{bin}/mobius --version 2>&1")
  end
end
