class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.35.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.35.0/nvoken_0.35.0_darwin_arm64.tar.gz"
      sha256 "dd79c84e1635ae0d959096de6a1506700b6e305edfc1e24af19fdd16271649d3"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.35.0/nvoken_0.35.0_darwin_amd64.tar.gz"
      sha256 "09b126f16b2f05e6cddaaeb374ff3106415f1b42b4a4b6a20b9d329f4f0267f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.35.0/nvoken_0.35.0_linux_arm64.tar.gz"
      sha256 "94193bce64f5ce65d76c75f1eafa4574a2ed63e508f4ede5f3a968c059bb899d"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.35.0/nvoken_0.35.0_linux_amd64.tar.gz"
      sha256 "73560af47598beb64188d84d36c7f3bf592bad2ac3300f72cac805e075a255cf"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
