class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.34.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.34.0/nvoken_0.34.0_darwin_arm64.tar.gz"
      sha256 "cbf9d0db495484e55d7e0df81505b7449159eeb6eb90597f07964bff3cc2c05e"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.34.0/nvoken_0.34.0_darwin_amd64.tar.gz"
      sha256 "83ac1a29635cebf13699cc53b2aeefd2638f5deebe08198b424dcc86be316b71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.34.0/nvoken_0.34.0_linux_arm64.tar.gz"
      sha256 "f14ef53ae7150173be11ed18be7bfe874fb6cdc301e851f0c7aaceeb55a153f2"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.34.0/nvoken_0.34.0_linux_amd64.tar.gz"
      sha256 "4f0b02cc1e6b5343a07e6a923dfa08b5497abae0ac6a9cac9bc72d6c1d548eaa"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
