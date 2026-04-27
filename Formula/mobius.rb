class Mobius < Formula
  desc "CLI for the Mobius workflow orchestration platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.11/mobius-darwin-arm64"
      sha256 "770bf7efe99755c17be23d9424ec24a12cb0c2e260849a74baa85b3a5e72045e"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.11/mobius-darwin-amd64"
      sha256 "35859cadab40a5a54d760309dd0c1522a9c1bacccee9a62a448a40d9e868d068"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.11/mobius-linux-arm64"
      sha256 "2d59d6091ab0c40451cfb10ef1ade8218224f48d6d9e5c4f6cc18444dc95c05f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.11/mobius-linux-amd64"
      sha256 "0d16403ec683a67d4d589a3a8a6f77e01e3741d5b240e5bd2964ef2c11d5b662"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.11", shell_output("#{bin}/mobius --version 2>&1")
  end
end
