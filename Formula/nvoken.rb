class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.17.0/nvoken_0.17.0_darwin_arm64.tar.gz"
      sha256 "d3e3a4b80977d6a9ada26bfe9dbb4656de03cfff49d5a94a361f6fcba065bb4e"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.17.0/nvoken_0.17.0_darwin_amd64.tar.gz"
      sha256 "0cbd9f362e35c258467cf46b2a2682fdb8e2ee0b2b2611e05cefe615a44a9c7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.17.0/nvoken_0.17.0_linux_arm64.tar.gz"
      sha256 "016385e217a5cbdfa0dd2a405399d25980469f40b2e89b600493f1daae32bba4"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.17.0/nvoken_0.17.0_linux_amd64.tar.gz"
      sha256 "5c8090f7730f368c550cd028d00dd942e48be28b8b25776dd741b3e7f18f40d8"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
