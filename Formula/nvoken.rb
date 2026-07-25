class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.3.0/nvoken_0.3.0_darwin_arm64.tar.gz"
      sha256 "766991e6452a0b932377a074a5a1d404c2882f0115e108152ba92ac5f825a0ad"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.3.0/nvoken_0.3.0_darwin_amd64.tar.gz"
      sha256 "c043f64aadb29ed80d1faec0e444f8767ae73545b7f5cf85eec29e122744d949"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.3.0/nvoken_0.3.0_linux_arm64.tar.gz"
      sha256 "4e7b789f7667588398450d7569f720b924d0f8498096c19ccf156ff47ac71945"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.3.0/nvoken_0.3.0_linux_amd64.tar.gz"
      sha256 "a0a40dd269c98803ad85e5a8bdb20fcd3f4a0f21a473cb00b71bbd779a610394"
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
