class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.18.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.18.0/nvoken_0.18.0_darwin_arm64.tar.gz"
      sha256 "ff03a8ce401b2917f5f6ca0314c6834a45060cd75221a5a63c70b7304ec92550"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.18.0/nvoken_0.18.0_darwin_amd64.tar.gz"
      sha256 "38c596c70374db61514a26fc31057cb75a1e6b84b454af242367039364800177"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.18.0/nvoken_0.18.0_linux_arm64.tar.gz"
      sha256 "d0a40d2a02482c52ef8e9ef1ef3633009bfb09d4155caa01807572e42674d3c1"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.18.0/nvoken_0.18.0_linux_amd64.tar.gz"
      sha256 "a864d9cded3734a8f9657e37478953bb293be720bfcab72d0a2df9f5e8876850"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
