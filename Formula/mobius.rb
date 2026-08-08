class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.60"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.60/mobius-darwin-arm64"
      sha256 "0a24dd4b3ea1b708e7c6d2d7b90b82330b9d608108e4818c845e3f53835e5414"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.60/mobius-darwin-amd64"
      sha256 "f4f6d472e2ebc369adad5bfd132132bc21797329eb29be2d8ba5873dd78e72a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.60/mobius-linux-arm64"
      sha256 "ba5cfae9ee8b6b723d05afa4bf0cc9b5c08392903d4e8c283d91ae0b6581d279"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.60/mobius-linux-amd64"
      sha256 "a1d3990058841ae2ab681525aae7076898e8ab1c2a6542488ff30db047a4bffd"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.60", shell_output("#{bin}/mobius --version 2>&1")
  end
end
