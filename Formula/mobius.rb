class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.41"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.41/mobius-darwin-arm64"
      sha256 "115272177f67b68fb998a595c247e185f9fdddd029d5ca1ade499b2f0de4cc6b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.41/mobius-darwin-amd64"
      sha256 "c0971e981b73ec9a66e988bd7aca0bd8c6b223d962d8c636a0a4f1f26355f087"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.41/mobius-linux-arm64"
      sha256 "6c8d475687b6a1de6995a263d3350c1986ade42cbca4f3ed2ca1af79ee0199d5"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.41/mobius-linux-amd64"
      sha256 "6f146f56f95c0297f22d14139bb4c948350ce8de803d697294c95de28f433011"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.41", shell_output("#{bin}/mobius --version 2>&1")
  end
end
