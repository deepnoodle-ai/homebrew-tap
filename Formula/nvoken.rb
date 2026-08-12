class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.15.0/nvoken_0.15.0_darwin_arm64.tar.gz"
      sha256 "9968feb3ee9a1948bc4962caaff0f4a041254fd4fef0864b40ba0021fc3f596f"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.15.0/nvoken_0.15.0_darwin_amd64.tar.gz"
      sha256 "7ae09a19026aaf5c005ed54b3c63a220fd864ba9dbd143d20125aeb78d328a02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.15.0/nvoken_0.15.0_linux_arm64.tar.gz"
      sha256 "581040eb84dcbd97ea28a986e029866eb1db5605994e3e3c7d5ce62c3ebce736"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.15.0/nvoken_0.15.0_linux_amd64.tar.gz"
      sha256 "fa271eebf39e7399df7c23e35900a62d939bb4767b240d9a45255c69a5ed4df1"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
