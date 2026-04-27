class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.10/mobius-darwin-arm64"
      sha256 "b33000f84b450119ab0e94b3ed541e5b9f720a03d276aaf947f6565aa1f55958"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.10/mobius-darwin-amd64"
      sha256 "f5e21a77772551eab9cfc38736e4b83e93a771e9f02634d7af8a61672b96b666"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.10/mobius-linux-arm64"
      sha256 "97b04764ac670062fb94770048f6501be01a068197e924bdee41fbdc513506b0"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.10/mobius-linux-amd64"
      sha256 "6f988c0edc9f62d3ad66b27bda0172104964f7210824ba93d478df2d5a88a8e2"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.10", shell_output("#{bin}/mobius --version 2>&1")
  end
end
