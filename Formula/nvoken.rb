class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.26.0/nvoken_0.26.0_darwin_arm64.tar.gz"
      sha256 "f7d20f6bcbd90a7e77ca0447a50e1a265c1f6440a0e06ec7ad7b6543994b84bd"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.26.0/nvoken_0.26.0_darwin_amd64.tar.gz"
      sha256 "afaa363f41a6c76e71f967c8818c9a767d5fb738f8b4f7a4473ed3a9317d77de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.26.0/nvoken_0.26.0_linux_arm64.tar.gz"
      sha256 "29b391382c98eb38841e0cdcb73651ad3821f03d6272922619deb876e295287e"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.26.0/nvoken_0.26.0_linux_amd64.tar.gz"
      sha256 "b852c2fb718f133a183ce172a814186a41eb5a4d5cf8bc8604c3e41a49234a40"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
