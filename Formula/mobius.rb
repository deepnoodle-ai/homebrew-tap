class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.2/mobius-darwin-arm64"
      sha256 "9da8318e0513c79c1ab7452d15d31f4b09d093fd6a8ed7c98b5175307bd0d322"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.2/mobius-darwin-amd64"
      sha256 "6966be5408d8999bb594bd2a6c067c30cb37db42990b1f40a92eddd954cfe3e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.2/mobius-linux-arm64"
      sha256 "6af74658173457c549cb4928c9761729fe6fe2031ab566efe1cb95fcef21ca80"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.2/mobius-linux-amd64"
      sha256 "83439a2516dfd9c935c0464fde3355d25e7f847701249b11124704b849ca2aad"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.2", shell_output("#{bin}/mobius --version 2>&1")
  end
end
