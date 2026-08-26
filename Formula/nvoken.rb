class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.31.0/nvoken_0.31.0_darwin_arm64.tar.gz"
      sha256 "7907bbc8b885f144b4c7f08df84f9962dc66cbea4d924b4dfc9359e8162055e5"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.31.0/nvoken_0.31.0_darwin_amd64.tar.gz"
      sha256 "3f0776d02be04c66948e207d8c301aa8e76d9834631c8d9c456fbb1e6c4070da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.31.0/nvoken_0.31.0_linux_arm64.tar.gz"
      sha256 "347096e6fb488cff4f4231a2a3f1305de900ae282d9a2ccb0a9cc84b6fdbcc98"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.31.0/nvoken_0.31.0_linux_amd64.tar.gz"
      sha256 "e1efc879fd8b4a63060878a40c849d220f29208966d2cbf75ef02e820f281181"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
