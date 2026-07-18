class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.56"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.56/mobius-darwin-arm64"
      sha256 "3cf47b14fbb7542b643255a3b61384bf7aead8d7124abfa61fa41ebfb34fa9eb"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.56/mobius-darwin-amd64"
      sha256 "2ac380d55dbe10800df62941bee03b5b968eea8312b6ab185f4c051f080151e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.56/mobius-linux-arm64"
      sha256 "5d50b26a0857fcf0d8e89ec92ae6b99ef98f92b8528106b07ea19a90b77ac04c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.56/mobius-linux-amd64"
      sha256 "7292d6d11cf580bb945d93623b25749c73019361fa91f79bc07e2cbadd56f03d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.56", shell_output("#{bin}/mobius --version 2>&1")
  end
end
