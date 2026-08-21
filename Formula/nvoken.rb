class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.27.0/nvoken_0.27.0_darwin_arm64.tar.gz"
      sha256 "822f7f3fb2e3e2e0ef05a5456e2f19497a87ae2fdbe09317c844214ab962c677"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.27.0/nvoken_0.27.0_darwin_amd64.tar.gz"
      sha256 "949f537132c99663920fe3176daeb6da812cb130efa65f8ef887c84beec58ef7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.27.0/nvoken_0.27.0_linux_arm64.tar.gz"
      sha256 "98905d41823e364827339f544e55d72b343b97ea1f13becb4587b783d6de0ea6"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.27.0/nvoken_0.27.0_linux_amd64.tar.gz"
      sha256 "ce5718b9fbe9068e1d48eeb4260426f916c628f961ff64eaf7d244ffb48b3705"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
