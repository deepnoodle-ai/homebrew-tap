class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.33"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.33/mobius-darwin-arm64"
      sha256 "2a0e1a76cc34bd589227d0422bc5ce1070ed31282d3b44642dd25c9f3fd7b171"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.33/mobius-darwin-amd64"
      sha256 "68b9fd9d5316f19f3cd35a93aba8cf008d123a441899abcac02b30fad689336c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.33/mobius-linux-arm64"
      sha256 "ef78ccf8874949742f10630c74ec223784d2b7889a7f4b2c643dd5b490b6fca2"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.33/mobius-linux-amd64"
      sha256 "6c5df6cd76da6409cb86e033871c35ae0930c75ee0a3fb1e9bbff083adc05790"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.33", shell_output("#{bin}/mobius --version 2>&1")
  end
end
