class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.24"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.24/mobius-darwin-arm64"
      sha256 "e1e2cca9be019e935230804f0539f929b896984d6ddda11da605a60d531fa6b3"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.24/mobius-darwin-amd64"
      sha256 "dbfc3fe53f7ad0cf55cc3afa1fff64d7fdb9c044f2b6f5a63eb9f9102030c8ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.24/mobius-linux-arm64"
      sha256 "533825a9c0162db64909c0712b63d5ae69625b61f703c73113f4b6167f63f6a0"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.24/mobius-linux-amd64"
      sha256 "ab3d3f690dcd04fc57d0945690244656d217832ce5e521b89453d17164549b77"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.24", shell_output("#{bin}/mobius --version 2>&1")
  end
end
