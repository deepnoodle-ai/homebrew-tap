class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.25.0/nvoken_0.25.0_darwin_arm64.tar.gz"
      sha256 "59fd9f0217424ab7b7c429ced6edf946f268b73d2d3298408d7f645717555c8e"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.25.0/nvoken_0.25.0_darwin_amd64.tar.gz"
      sha256 "de0a8ff6dba342fbb1a3fd9905c57828f031afcad44f859eb23e7718032164c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.25.0/nvoken_0.25.0_linux_arm64.tar.gz"
      sha256 "6e4299bcad9ec091d1e2c1e7b68c0624194011f29b2835bc6652cf3b65f0b5f3"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.25.0/nvoken_0.25.0_linux_amd64.tar.gz"
      sha256 "e5df4d8b40b42644d8c5fd7a9880780d847d8f907ca153d2dbe6c7947e2f8ea6"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
