class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.1.0/mobius-darwin-arm64"
      sha256 "cf49215d725fa039051fd274f3fc859b24f3f5134d37f9af803bb2d4541a9cb6"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.1.0/mobius-darwin-amd64"
      sha256 "b266673f82c31b3389df64909df519e01afc7836ecfd913d67d963ebc47c3706"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.1.0/mobius-linux-arm64"
      sha256 "8c6b64cbc42fed65b5554295339c351474faeb3e5f6247566031c9caffe848dc"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.1.0/mobius-linux-amd64"
      sha256 "1b3fd712fa6570bdcf37383e55f0e580ae9c077ea085bb83168f35eece090827"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
