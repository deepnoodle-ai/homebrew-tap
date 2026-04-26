class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.8/mobius-darwin-arm64"
      sha256 "69d978fba8e55b3fc100017337dcb08d126e6caab947767c6652184631ea9633"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.8/mobius-darwin-amd64"
      sha256 "190d1da1e7cd082b2adf3abf3d0856185c58145ebeeeae5306d3b4c2b2fba935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.8/mobius-linux-arm64"
      sha256 "7303d2fae893d40cc07a2340be0824140140a6deacc93a23ebc62e5d2efa4f06"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.8/mobius-linux-amd64"
      sha256 "8cfa31a2d2261051b8d494092607f3571b50e78ba0d00376c491d7eaa5bcd3d2"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.8", shell_output("#{bin}/mobius --version 2>&1")
  end
end
