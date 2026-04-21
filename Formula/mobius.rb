class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.4/mobius-darwin-arm64"
      sha256 "13eecb2ab1dec0f7d64342781c48635aa9bbf9286c9e4fda28babd074800c60b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.4/mobius-darwin-amd64"
      sha256 "e2709fdc720269ab156768c0eb49f7b74a6edc5229eb6b26dab87791dc36502b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.4/mobius-linux-arm64"
      sha256 "c62f46290533bf655609ef3f4d8db7aff0c59f4833698c180146accdd53fbd19"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.4/mobius-linux-amd64"
      sha256 "7eea28354c4e186428b71eaa4566c6e9efd00e4d6c53d6678c89032222df7913"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.4", shell_output("#{bin}/mobius --version 2>&1")
  end
end
