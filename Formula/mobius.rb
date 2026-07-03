class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.35"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.35/mobius-darwin-arm64"
      sha256 "ba7c61ccf5707d4064898255de3eccbf7454bc34927cac49ae2ff58d632ee3b7"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.35/mobius-darwin-amd64"
      sha256 "2d7791c0df4d38d5e85d0abbdd38e619b707338b6bf8eb8ec532360ed1251c68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.35/mobius-linux-arm64"
      sha256 "3c443cacf1d73e757419b54352fd6af51099e24f08949a49dd384acd6b19cb43"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.35/mobius-linux-amd64"
      sha256 "e3d92b29f00ec2a07ec56cce34bac5bb4a7877a2c133ddca87da7892c578f95e"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.35", shell_output("#{bin}/mobius --version 2>&1")
  end
end
