class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://mobiusops.com/"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.9.0/mobius-darwin-arm64"
      sha256 "896ce6ab04601d11dbf00e3b1eb80aab4724c0298ed91e05d842b83bc7e839df"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.9.0/mobius-darwin-amd64"
      sha256 "6450e68fa7650047b54dc93abb98b1f8c9cefa47ddc19f45c6370df91e5b546f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.9.0/mobius-linux-arm64"
      sha256 "3a15a4507f9a1c7be4807a152192340603f91d1d2b449b38ef8e652112c1c184"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.9.0/mobius-linux-amd64"
      sha256 "f3693ae05852873a9c3623e7db72b99507dc6bd647ecc828a7b4ba4971e52785"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
