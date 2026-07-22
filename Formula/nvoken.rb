class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.1.1/nvoken_0.1.1_darwin_arm64.tar.gz"
      sha256 "b266050592a1d670b2c0e49b9887105c98a8a94a361a40c1cb784e2439c44ea2"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.1.1/nvoken_0.1.1_darwin_amd64.tar.gz"
      sha256 "a60a06df4e779006763f6692a706bf86e9a729cbc42406f26d790c2c1b34e10b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.1.1/nvoken_0.1.1_linux_arm64.tar.gz"
      sha256 "1352778512bdecbf24575fe42b7be3e7882c708269f445fae2d4164aad0a68c2"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.1.1/nvoken_0.1.1_linux_amd64.tar.gz"
      sha256 "a336c7431f52db54a30a9d451f8d7867aba789a88135eb6ab5bef9923b7a9d42"
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
