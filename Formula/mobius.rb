class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.1/mobius-darwin-arm64"
      sha256 "d6d9cfef7125444565f4cb72224e1bde8bf49a1a75bb447f3773270db08121f2"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.1/mobius-darwin-amd64"
      sha256 "017c857bd21deefc6b42319f490a6be894a214f84e6464968eeb91a64c8fc5f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.1/mobius-linux-arm64"
      sha256 "d61726e23e547278fb07c9f7f245cdf101b3a6eb2a9e71d9fbcb5e2ccdd1b721"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.1/mobius-linux-amd64"
      sha256 "c2f6c15eb23c32a9ae8d7fc4696b2aa324ed27e257954c7f65f518fd47198443"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/mobius --version 2>&1")
  end
end
