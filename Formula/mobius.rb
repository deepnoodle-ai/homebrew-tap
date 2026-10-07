class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.3/mobius-darwin-arm64"
      sha256 "fd63f9236c9957b8880efcedb1ee6cc5a95ec276886007910c2152193824cf96"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.3/mobius-darwin-amd64"
      sha256 "c428212250a0998aa702750c72193c43c771b96fc0e9efecefcff8b47f9827d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.3/mobius-linux-arm64"
      sha256 "dfc98922cb9f0a6916383c6547431146fc09d75344b487901f0cd8605fe31e3a"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.3/mobius-linux-amd64"
      sha256 "10be83f9a720f92573ae6927b086c070b4cc46165d528348a79d9fa7302d5533"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.2.3", shell_output("#{bin}/mobius --version 2>&1")
  end
end
