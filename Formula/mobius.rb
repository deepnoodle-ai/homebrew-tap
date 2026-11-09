class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://mobiusops.com/"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.0/mobius-darwin-arm64"
      sha256 "06b41f8606a5a76864387b300c9bc9350349ddd6ea96bf49acefe469dbdeb1a5"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.0/mobius-darwin-amd64"
      sha256 "b3da5dad88091883086897829cee635f3fe15e05a7b8b4eec1e86c32da5bf1cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.0/mobius-linux-arm64"
      sha256 "36d83bc6db0d5d5f947aa1f0b2662ab5e69aa3b03821cd9f6affb83eabb5455c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.7.0/mobius-linux-amd64"
      sha256 "75548f8e5d347b6608125deb9eb743cb0a7f42de03c080491e4dc5e6789c98ed"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
