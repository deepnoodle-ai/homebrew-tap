class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.22.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.22.0/nvoken_0.22.0_darwin_arm64.tar.gz"
      sha256 "df754037357463044fb542827945eed4e50a14107b0fd189490c853c5ad89cb3"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.22.0/nvoken_0.22.0_darwin_amd64.tar.gz"
      sha256 "2e84506204d22328f9028804a6d54b9cdd59565490a36e7202ae86628ebcc52d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.22.0/nvoken_0.22.0_linux_arm64.tar.gz"
      sha256 "062c64e2b99573d171f4a47c1280b662225b5a3ed0f24a44063bbb835d7ca7ca"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.22.0/nvoken_0.22.0_linux_amd64.tar.gz"
      sha256 "0eb41d0978d974fad34234033215bf4151735cd1c678521a42b17ebbd7c2e88b"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
