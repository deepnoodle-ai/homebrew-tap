class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.1/mobius-darwin-arm64"
      sha256 "7a3aaf1060c947f4c88992eeb90f2c419dd6fdc481b0f1c8a30568a4f392f54f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.1/mobius-darwin-amd64"
      sha256 "cc231a9d0a4b4e713965a9566ec6330ce621ebe4e63b0a55e0bd9c4905425e47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.1/mobius-linux-arm64"
      sha256 "03cc660b60054729e9002dee41eac0fd16b2b9f139f05eee9d4804975d27a7da"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.5.1/mobius-linux-amd64"
      sha256 "f980e777ba85b806638b15877d17f48be6d42e94a37c4693c0a35deef895a6a0"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/mobius --version 2>&1")
  end
end
