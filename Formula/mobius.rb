class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.0/mobius-darwin-arm64"
      sha256 "628c19b73e65ba56db409779de089b94a05053564010c0f8793f818c06bc6622"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.0/mobius-darwin-amd64"
      sha256 "ae64fa298a9c09484c2134744a41b332bbaf47099d0408c6680fa0af166259e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.0/mobius-linux-arm64"
      sha256 "e9ea85ea52ea996512f768a43663ac3b97e83b06af031a0864e9f02a5c7b10ed"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.2.0/mobius-linux-amd64"
      sha256 "1a8998dbf538304d5790ffb8e89f8db78afe7135e37ffb5c67ea186efc8dd6e6"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
