class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.3/mobius-darwin-arm64"
      sha256 "96f0dd280d6bfab12e46a3786b6752e2d5afa867cc5f0a889d8d6606f6adcb9b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.3/mobius-darwin-amd64"
      sha256 "93ba6f31f7956d9805ff47298a3786f9fd115e7a492222a52e910a5b6de8f888"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.3/mobius-linux-arm64"
      sha256 "a142ce5b8f88b24dcbb13e94e0ba78b5e88a243e3f3df2955a9e0a20b5ef8969"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.3/mobius-linux-amd64"
      sha256 "3a20ac42f4c82fbbfc4266cf6bfed021cad69a206284864f92ef5eb33bd9d3e1"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.3", shell_output("#{bin}/mobius --version 2>&1")
  end
end
