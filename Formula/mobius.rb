class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.15/mobius-darwin-arm64"
      sha256 "3d7b6b6d5aa5aaa1bafa138712cbcbadd4c3f73c9b6d2676d8a60028ba9b23c0"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.15/mobius-darwin-amd64"
      sha256 "a29ed0760af616c0c093133968b69c5272795b5d9ef74628825356142f063c83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.15/mobius-linux-arm64"
      sha256 "dc2ee1e4783328242a2146bdb5efb2ab918ec80ef4e59a112781e20ca2a01f46"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.15/mobius-linux-amd64"
      sha256 "9cf2683427bdc003cc4965010f088468ff16c44bd3f80a62d80cdbccd21764c2"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.15", shell_output("#{bin}/mobius --version 2>&1")
  end
end
