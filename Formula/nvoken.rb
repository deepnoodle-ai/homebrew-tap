class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.14.0/nvoken_0.14.0_darwin_arm64.tar.gz"
      sha256 "f447f01b58eaa61960435f945b50ca15b9adb96baa615b475239be4cfa57fafb"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.14.0/nvoken_0.14.0_darwin_amd64.tar.gz"
      sha256 "ee4c79aa942d552b4af098167a4b8cf7efd2706a9018d46ee7f5e7e5e300d6f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.14.0/nvoken_0.14.0_linux_arm64.tar.gz"
      sha256 "e1de14433b690b4a1c45fc7964af845be6c4f3743e9062917ed29a88d7655f52"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.14.0/nvoken_0.14.0_linux_amd64.tar.gz"
      sha256 "16fb8ec14ccc99bf43e543867776516b6b7daa927a1322901aaed7ff300b2a38"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
