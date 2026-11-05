class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.6.0/mobius-darwin-arm64"
      sha256 "a9e1cd227ac7dee3f803be3aa5d3b209794c4a4da74f1e4eefd47cef7f61c23b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.6.0/mobius-darwin-amd64"
      sha256 "51e274758b673afae7820a45801e437e43f082112d1d0c6bf7c93bb9e9ddcf23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.6.0/mobius-linux-arm64"
      sha256 "1211c44015a2f8927f7e19894e587f7f8970de5e0411ad8e32e39d5589850a46"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.6.0/mobius-linux-amd64"
      sha256 "eb0c462923459d508036b74b7f146ac1286893e768d06eaf4c0d28afe3a8414d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
