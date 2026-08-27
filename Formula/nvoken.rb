class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.32.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.32.0/nvoken_0.32.0_darwin_arm64.tar.gz"
      sha256 "f52b01f8c4fd4bcc7afef6d264658a782c42df471045cc7a0b5cc1ccdfaf2918"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.32.0/nvoken_0.32.0_darwin_amd64.tar.gz"
      sha256 "bb6271a58762f5ec6ce665c9162d312a118d019d2fbbe423cab3afe52be2cf8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.32.0/nvoken_0.32.0_linux_arm64.tar.gz"
      sha256 "35c918062c76ca81911cdcecc54813884ae08e9d98975beaeb7a2577e307adc6"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.32.0/nvoken_0.32.0_linux_amd64.tar.gz"
      sha256 "7c759b14614c89e01284139d73728ec74ea04e5960aa112ecf8089dab85a9132"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
