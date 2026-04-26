class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.9/mobius-darwin-arm64"
      sha256 "5a8698edc8ff28d3fc5061df9f773516067ddfd855c8852adb41b4ac153e1606"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.9/mobius-darwin-amd64"
      sha256 "986388a26924f64443c3cf2f1fb230e862e52422ee037ce4a4b58c993266be33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.9/mobius-linux-arm64"
      sha256 "d0f9639e1cd97952ef9c20b1b8e1c43a92a51d9959d1cd88d9584df76acec58a"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.9/mobius-linux-amd64"
      sha256 "e39ed6e678107c559276eda938fa041fefbe45522f2a9bdfd6797be3bbdc93b2"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.9", shell_output("#{bin}/mobius --version 2>&1")
  end
end
