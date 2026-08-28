class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.33.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.33.0/nvoken_0.33.0_darwin_arm64.tar.gz"
      sha256 "1f9718a48ea922f8944c0b267ba9cf174b8e0b762a52d74e456964062c7c1d0c"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.33.0/nvoken_0.33.0_darwin_amd64.tar.gz"
      sha256 "bb0b4b5eaef028111a07e8166d0696321ccd9dc643534d5beedcfcdaf790e6bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.33.0/nvoken_0.33.0_linux_arm64.tar.gz"
      sha256 "acaca4678ee49eb16ef895cce76ce34a9147069136acf5183b4bd6fff7151ddf"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.33.0/nvoken_0.33.0_linux_amd64.tar.gz"
      sha256 "9b594731a114ac99cd00425cb62b028c67629f4c79b1dac688251637c078b6e7"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
