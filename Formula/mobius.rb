class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.19/mobius-darwin-arm64"
      sha256 "1cfa9113c5e3a6260f06dd32dbb883cadc3443b38d9318b240e0c2acb8454f84"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.19/mobius-darwin-amd64"
      sha256 "b14a8955e9a89092fb015a06358de9e965a6244f38fa4a8569ce61a1e00320b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.19/mobius-linux-arm64"
      sha256 "cf556277f547ebd6acef528cf6a01de36b0538e3d8706aa00d76d2b6a3b44e4e"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.19/mobius-linux-amd64"
      sha256 "900d709df250f52a38f98b9feb12be9edda80585b3f164729d2509931438793b"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.19", shell_output("#{bin}/mobius --version 2>&1")
  end
end
