class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.55"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.55/mobius-darwin-arm64"
      sha256 "1393288274bca7bdade015b228c384ac3118a32ebc1a70f065b9c8982ca4f13f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.55/mobius-darwin-amd64"
      sha256 "f225179275780ed51101a1abae54b8b9e95030d938f6b9e01a0f971ac91927b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.55/mobius-linux-arm64"
      sha256 "280c691652bd5f013eebf94c5cbd2cc1230cec8ffb8c27c7631b44819557dcbe"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.55/mobius-linux-amd64"
      sha256 "e87119d979a49b8a1f5a94dc3c98a15f91fae09c2b0613abb6b32877af9765c9"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.55", shell_output("#{bin}/mobius --version 2>&1")
  end
end
