class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.2/mobius-darwin-arm64"
      sha256 "00deac621ae89d4aa33f7b7054fe86875bab09f327953f5d5ae8e8761f475785"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.2/mobius-darwin-amd64"
      sha256 "b7f5c7e081c8c5e9039e3ffbea3a28e01d6ab9ff055b6fd1236e27262fe8da85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.2/mobius-linux-arm64"
      sha256 "dd21f6d20ddca83a4e7838ae962275c57c5574ae336a06b9a0b650ea4cd7f34c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.2/mobius-linux-amd64"
      sha256 "6bb0468349d9a035ef3c8a49c88b4b1cfbb303e2708997f716c64ac03d67c599"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/mobius --version 2>&1")
  end
end
