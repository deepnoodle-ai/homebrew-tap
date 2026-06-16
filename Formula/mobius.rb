class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.25/mobius-darwin-arm64"
      sha256 "c8ab4bb76f1c6623f66726f622ddacec3a7763072b828d716dca92e99c2f1447"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.25/mobius-darwin-amd64"
      sha256 "f5c8c341f668e428f0e0b786670f0da77127a7a7953da90f2d96b242f0b754a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.25/mobius-linux-arm64"
      sha256 "6754ad2ab3360f3f885548cfdcb22920294eeba903b04148b3d095738d2219a5"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.25/mobius-linux-amd64"
      sha256 "069376d9952f4bf1699977c27417d0df3e2a7f54b4263dbdd7cd793af384d55b"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.25", shell_output("#{bin}/mobius --version 2>&1")
  end
end
