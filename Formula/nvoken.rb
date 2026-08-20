class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.23.0/nvoken_0.23.0_darwin_arm64.tar.gz"
      sha256 "48b31ef683350dc8ec0abc1d5110f6b743a066655e90d2a421e260a013ad9052"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.23.0/nvoken_0.23.0_darwin_amd64.tar.gz"
      sha256 "f9c860a8de9135d06b2d1ca69aaf440fac5837cfdec77da165bae13b585deda3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.23.0/nvoken_0.23.0_linux_arm64.tar.gz"
      sha256 "3c5faac73671ce70aa67282fff76a86b8959a7fc642d018c851b6f793299acfe"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.23.0/nvoken_0.23.0_linux_amd64.tar.gz"
      sha256 "984235b8d133fba7dff8d126465fdddd6169afde06c8ab553bbb09635771c0f1"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
