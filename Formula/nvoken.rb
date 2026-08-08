class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.8.0/nvoken_0.8.0_darwin_arm64.tar.gz"
      sha256 "72c4fc559007b022ecfbc1e62af666d237d3fcc740f663d92905f06c642fa18d"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.8.0/nvoken_0.8.0_darwin_amd64.tar.gz"
      sha256 "cf9ebc4079cc88d6e7039ddcc91303b00bd0d01d74e9a9b8fe8a6361675bc926"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.8.0/nvoken_0.8.0_linux_arm64.tar.gz"
      sha256 "593cd57f42972b49129cab5dae970deaf73b83b59bac30f3934b33ebb8eab342"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.8.0/nvoken_0.8.0_linux_amd64.tar.gz"
      sha256 "a9fa614ade2217cbd175b6d6459fcc648d9391494921074334f8aa9877e15b6f"
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
