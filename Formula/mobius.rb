class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.26"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.26/mobius-darwin-arm64"
      sha256 "e2f9cf4b8968bef8c3163556ab1f2783c955316e5c49301b0eb0e04914bf7c15"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.26/mobius-darwin-amd64"
      sha256 "855b2833bb7ff6568c8e6824cf286471a36bd9e22bf3ad52c093f1c9d079d2bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.26/mobius-linux-arm64"
      sha256 "98cf9cae2543c861f0ca37a24988038f4f9accfd5e99773f705f4190a6889e3a"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.26/mobius-linux-amd64"
      sha256 "811bfffb2eb2880baf83e5a8483aea9119bea5047bddcaf3143a6ed065da1b14"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.26", shell_output("#{bin}/mobius --version 2>&1")
  end
end
