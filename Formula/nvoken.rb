class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.21.0/nvoken_0.21.0_darwin_arm64.tar.gz"
      sha256 "6d250f060ea00ed2a62374cc1294b0cdaef94690982e388847977743009cc85b"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.21.0/nvoken_0.21.0_darwin_amd64.tar.gz"
      sha256 "4d8c2adb4b0e22e7ddc3887e17bee0f827cc2ce75954fe15f67f1b95b0c028b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.21.0/nvoken_0.21.0_linux_arm64.tar.gz"
      sha256 "ea75b9cdb490806f4f190f828ce0e25629a06692ac6672be888d8f3bc328a422"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.21.0/nvoken_0.21.0_linux_amd64.tar.gz"
      sha256 "69dce68645952606a961ab9ef5b5f9ce8b4d083d880dfdd3c4cbd9fc72f96caa"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
