class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.7.0/nvoken_0.7.0_darwin_arm64.tar.gz"
      sha256 "08a17982f96493e68a1b8d39090d71d1bcb1aa84d1b33f8f2b3a6f7ee684051e"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.7.0/nvoken_0.7.0_darwin_amd64.tar.gz"
      sha256 "34fbf8b265581bd9c7703cf9586b4157ec747c733c91c577740445b5e07080d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.7.0/nvoken_0.7.0_linux_arm64.tar.gz"
      sha256 "6d3dc01e5fe958f73493ee3198c8991746073a4d3a543354e7e1e5aa575f961c"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.7.0/nvoken_0.7.0_linux_amd64.tar.gz"
      sha256 "5bd40e0b6da8a19f4c7b0ab2b82ceb7f51baf367ede93dd2d7f266b5f2d49459"
    end
  end

  def install
    bin.install "nvoken"
    bin.install "nvokend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
    assert_equal "#{version}\n", shell_output("#{bin}/nvokend --version 2>&1")
  end
end
