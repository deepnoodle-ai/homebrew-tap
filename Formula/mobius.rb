class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.52"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.52/mobius-darwin-arm64"
      sha256 "b9ba357d1ae227accd64c87c76bfbaca9061021decc85cda5af44f066a48fdf1"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.52/mobius-darwin-amd64"
      sha256 "7233d1c992ebbdd1f2f40b8940d1dd44b22a08db13977a7744bbaeb804bd5b5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.52/mobius-linux-arm64"
      sha256 "ca6935433ac731541a788d0bb903c2c76555190767d532312c589d2242d0d024"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.52/mobius-linux-amd64"
      sha256 "95dcf20355389fac835a02c028c5e046037860f636762338c718fe632a93aa66"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.52", shell_output("#{bin}/mobius --version 2>&1")
  end
end
