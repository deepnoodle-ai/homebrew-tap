class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.30.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.30.0/nvoken_0.30.0_darwin_arm64.tar.gz"
      sha256 "923ac2c7c7d4770ee1d930e25fc7cf3cd26e62f0ea7934e612a3d9214928f338"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.30.0/nvoken_0.30.0_darwin_amd64.tar.gz"
      sha256 "42f7aa6303f09217ad88736d150f30211f5c162e3fb424ec9e726fe4ed873fd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.30.0/nvoken_0.30.0_linux_arm64.tar.gz"
      sha256 "13018c3efdef6e579a2cc0f67919c5d1c52fcba13643f5c3a6fe6f460ab78d28"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.30.0/nvoken_0.30.0_linux_amd64.tar.gz"
      sha256 "cf8c083c5b71e311ab3c7f38aa93ed9c598c007e3feedb4ecab13625adbdff5f"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
