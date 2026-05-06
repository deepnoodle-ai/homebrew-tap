class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.20"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.20/mobius-darwin-arm64"
      sha256 "03a3a0415ed05ed29380eca2b627e9252a48f61dfd5059ba6e97cc7655474e1a"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.20/mobius-darwin-amd64"
      sha256 "7553e5456f3841d8b03d3b8c62231608e5e27af4dbac792017f94a2dadc0fea5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.20/mobius-linux-arm64"
      sha256 "f22ca2e48a7b8994f67f37c7d3931a1b5b34b36ce4f8b811670325602e1d63d5"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.20/mobius-linux-amd64"
      sha256 "609112279d2ce189335b0abb7ddbba957b5b6c96efd43bd86bbc3307f9d966d9"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.20", shell_output("#{bin}/mobius --version 2>&1")
  end
end
