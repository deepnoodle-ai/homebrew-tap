class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.59"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.59/mobius-darwin-arm64"
      sha256 "873842d4a68dd0df7fa3f0c8289ab87d440fefe1a5e408419fc39ad397b83c9c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.59/mobius-darwin-amd64"
      sha256 "b63d0cd38fc66b62a5f5683633c6ad55932adac26efd34f60ff449c1b953c682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.59/mobius-linux-arm64"
      sha256 "ffd3c617677d63833d1ced1940f5ff1cd0099282bb470b79abb0b3ee9a6ea0a1"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.59/mobius-linux-amd64"
      sha256 "79e5af48e7b9f82b0b1cb0c04cd3b0b31e7139653d7611cbbf1fe96dd127fe3d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.59", shell_output("#{bin}/mobius --version 2>&1")
  end
end
