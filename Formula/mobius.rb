class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://mobiusops.com/"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.1/mobius-darwin-arm64"
      sha256 "58d0519a826722f32a4a4bfa831975b0042e56255eb704437c0a5479333755a4"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.1/mobius-darwin-amd64"
      sha256 "1b7192ab28d018fe4c95c30d8dadbe4b1a4573a6a27eff933640c7d29551d96a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.1/mobius-linux-arm64"
      sha256 "4159ad2552ee8f9b269c351e774ad4286d1fb13239ad11dfc2046facaf0aafb9"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.1/mobius-linux-amd64"
      sha256 "eed887b2f30724c2c23e1f2afd9eda010bc3a503fa92f5d7bf5ddc143da09c3c"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.7.1", shell_output("#{bin}/mobius --version 2>&1")
  end
end
