class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://mobiusops.com/"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.10.0/mobius-darwin-arm64"
      sha256 "d898755bba583ffc811d4942d6366475cb23a20e5877781394ee55429d69d81b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.10.0/mobius-darwin-amd64"
      sha256 "2292b4d99dbc0dcf4b88fe3214754a53b1394a2360ebd7cc62b5699e9f86c629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.10.0/mobius-linux-arm64"
      sha256 "0791986a9cca372ae515e2f230903998c1aabca79c000722d821e69540f88192"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.10.0/mobius-linux-amd64"
      sha256 "b7188f9c849adb72942b0f674ec92499e451a714ae5d58c628509edd29290d45"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
