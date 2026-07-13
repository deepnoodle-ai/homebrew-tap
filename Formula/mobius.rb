class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.48"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.48/mobius-darwin-arm64"
      sha256 "f03d1289cee5054d1956a843431c389cf2b055ea6670babbbd26fc7f08bc431e"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.48/mobius-darwin-amd64"
      sha256 "4469d6ed2441e3ea4fbefa2c670445ba7b0b7c2bb74eb7f5573a298e70a58fd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.48/mobius-linux-arm64"
      sha256 "61d2a3bceaef9ea440f12d055cee9c0efe0e5f73707e8020deddb566712ca860"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.48/mobius-linux-amd64"
      sha256 "331f5136862540c44d099b3e2dfabc121b9a3bc4b5ee30b8882378e38a5af96d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.48", shell_output("#{bin}/mobius --version 2>&1")
  end
end
