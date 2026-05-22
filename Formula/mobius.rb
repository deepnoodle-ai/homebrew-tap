class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.21/mobius-darwin-arm64"
      sha256 "dd9b52dfeb9f964c93bf3233a56acde0b5178f17ab773045fb43dfc634526234"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.21/mobius-darwin-amd64"
      sha256 "610b60fa0f637299bb500ac9546f4d9b851aa16ec504ff274ae00bb14bbc9ee0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.21/mobius-linux-arm64"
      sha256 "e7cd93e4e4bd0a54c3c9af30eef04a2b51913203dcfe98dba2c237bd79452ffb"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.21/mobius-linux-amd64"
      sha256 "140a27ddf03334160a941457f29ff0a1699b8c7eeb104f216842c2278fe775ce"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.21", shell_output("#{bin}/mobius --version 2>&1")
  end
end
