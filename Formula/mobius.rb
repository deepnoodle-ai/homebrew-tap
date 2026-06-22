class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.28"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.28/mobius-darwin-arm64"
      sha256 "2f0690785e6ab7129ea53cea3023ff744d1dc0fc281d8126cd7a67163f351dee"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.28/mobius-darwin-amd64"
      sha256 "56b64df5a5ddd6ca22e6c443a79d323d577aa7ba073ccebe3b00696877b40913"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.28/mobius-linux-arm64"
      sha256 "b3acf1d2ea2ab0eba959d549bc7714a81d28e3f7e8807d53d60570a125e627a7"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.28/mobius-linux-amd64"
      sha256 "6bac6a7a9e0f80b6c8911f1602f6a26ff88823c0a4602442c9568c24d2c7b461"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.28", shell_output("#{bin}/mobius --version 2>&1")
  end
end
