class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.38"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.38/mobius-darwin-arm64"
      sha256 "2c07b2da3c17efc25f1b2f29a0b13cc58eb28f56c0c4292bc08021b240d453fd"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.38/mobius-darwin-amd64"
      sha256 "37b6b7d6eb2c469663f76176a1f4ebccf422f0a795009279969ac12491400f17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.38/mobius-linux-arm64"
      sha256 "24493f39ac6b3a5acef3f98a7c1cc0f62cd68765fc9d6ea59a12db376bcac1d0"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.38/mobius-linux-amd64"
      sha256 "65216b393b2b49d5feda2c0e148b6dd616cf783734070db114b4e343523ee8dc"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.38", shell_output("#{bin}/mobius --version 2>&1")
  end
end
