class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.31"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.31/mobius-darwin-arm64"
      sha256 "353581dd4464e23e2028a12d0ae09624f1d2ce0f5823f736620fb9405f50410e"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.31/mobius-darwin-amd64"
      sha256 "f9715b49db91e143323379da43c5e6ff1060104965f29a6eace68314f85be032"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.31/mobius-linux-arm64"
      sha256 "96f598e54a9c862dda289a61e5760636cb0f967bd3ff7ee77eeb11e79b1a6251"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.31/mobius-linux-amd64"
      sha256 "6bf9b4ab7d32371f7b98fb2ac95445d1a26df616a26b79e8ff03c1535ebc196e"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.31", shell_output("#{bin}/mobius --version 2>&1")
  end
end
