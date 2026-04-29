class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.16/mobius-darwin-arm64"
      sha256 "f927b1be14d840f9f11f81a3825f6e32cfd74d0c86cbb441c0b7f226fe6da2ea"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.16/mobius-darwin-amd64"
      sha256 "5e29a2d2d1299f072eab16fa807e124752f3027b05351b52b5160dca830cc881"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.16/mobius-linux-arm64"
      sha256 "058af05a81833c2c9dc0d5f91286e7e94e8983750e4c6c1f92d5a0f5d31a946d"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.16/mobius-linux-amd64"
      sha256 "04fd4be038ee57f5d1bb55c3988d47a4c56f6a5cb491c444aabe6caecd192bb7"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.16", shell_output("#{bin}/mobius --version 2>&1")
  end
end
