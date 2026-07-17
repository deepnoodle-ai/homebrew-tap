class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.53"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.53/mobius-darwin-arm64"
      sha256 "4d5f6271b46f78af9e234112dae8bd2dc03274125bce564ad0174286f58598ff"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.53/mobius-darwin-amd64"
      sha256 "a65bd15785b475da99501d0151f95ea062507948657493f082c088f456a82012"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.53/mobius-linux-arm64"
      sha256 "48268b993a9afd1c99f4484a681e3f72dc992e3c0af7dc107cc7dc295f3efa5b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.53/mobius-linux-amd64"
      sha256 "7701ba081614106490ced9a9ba91c684d5c3e6515d9a2510e848982154bccebc"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.53", shell_output("#{bin}/mobius --version 2>&1")
  end
end
