class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.36"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.36/mobius-darwin-arm64"
      sha256 "a663c379d5c9a09388504dd0f9dd6765ffa95ded49a34cde8b5cf8992253c7e2"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.36/mobius-darwin-amd64"
      sha256 "a6b7b72e2c3a3dbc61629b0bcaa86393accf79decf7f37d7906b3878dac80a83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.36/mobius-linux-arm64"
      sha256 "12112c6c67c0f58ddfb2af501597092c5c87e44e7b658843e80f0760f60c5cad"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.36/mobius-linux-amd64"
      sha256 "5c18c7b0e0403fffa0336992d222b69a57d49cfb52e617d6bf8b9bad7009122d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.36", shell_output("#{bin}/mobius --version 2>&1")
  end
end
