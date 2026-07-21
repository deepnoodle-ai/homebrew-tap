class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.57"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.57/mobius-darwin-arm64"
      sha256 "13bd11274121a61845f9384f5a7c9d3ecd4c3a1b909a8d1208adc3f2c47041eb"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.57/mobius-darwin-amd64"
      sha256 "da29c977139de0290c78cae551243bdcf7987330b5e60b1d0c2913c431a23c7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.57/mobius-linux-arm64"
      sha256 "b664a13c5a6332f254508d1d641ab917eda6ac0ce3aa59422edc33067e2e85db"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.57/mobius-linux-amd64"
      sha256 "eabcea5177d9424cace6d0b82795b1680d758e9208af045f57580c82f961b0a6"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.57", shell_output("#{bin}/mobius --version 2>&1")
  end
end
