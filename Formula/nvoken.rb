class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.20.0/nvoken_0.20.0_darwin_arm64.tar.gz"
      sha256 "1c1aeabf450e73c244684e7c093607811607d85e3e2d3fc4b38f88e63fb7aeb9"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.20.0/nvoken_0.20.0_darwin_amd64.tar.gz"
      sha256 "2525b40a790294f2c5e66a20c62d5e79a9806125e0cb4be890e7ecbea3305028"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.20.0/nvoken_0.20.0_linux_arm64.tar.gz"
      sha256 "b98e497de60d553d61c09fd46cb415bd18aefa018a9b3aa9288293f25fe94420"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.20.0/nvoken_0.20.0_linux_amd64.tar.gz"
      sha256 "dff10812967aede18e8e7255e469a64cc2058a61736e363c73f4f69d2651825f"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
