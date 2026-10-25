class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.0/mobius-darwin-arm64"
      sha256 "860079e538678ae51dd8448a4566a0e74822454662b0463f9e9832eb69fbf6d9"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.0/mobius-darwin-amd64"
      sha256 "a52dbd648f4f1c2d2bb61730b63eb2f7c0c0803892d8cd596f23861dd9d24317"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.0/mobius-linux-arm64"
      sha256 "3cdf4375ac0a46259d68c0e7dd8c4688313bcd7e4f4dc076c1fa9429e37ec7c7"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.0/mobius-linux-amd64"
      sha256 "0f322af19469b874a227577c996cf0062c16df4b724a7f04992f38385c459557"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
