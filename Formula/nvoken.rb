class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.10.0/nvoken_0.10.0_darwin_arm64.tar.gz"
      sha256 "c37cfdb8252a50c99dbccf065b87ed93f22ea309ca5bbd8085654f73655099dd"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.10.0/nvoken_0.10.0_darwin_amd64.tar.gz"
      sha256 "deed48b38ea217ad4d616d582737ab6f7b6ac76a0872a00f23c0ad9ec6d14f1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.10.0/nvoken_0.10.0_linux_arm64.tar.gz"
      sha256 "299e6bf5a737b05d1202697568717c313b476afffa5ff74293106ffb7968dfe8"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.10.0/nvoken_0.10.0_linux_amd64.tar.gz"
      sha256 "edcf84859e3867eb7bae9e93575d1520b83de79d6200e251246e68c8b7a9f468"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
