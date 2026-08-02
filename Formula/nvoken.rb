class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.6.0/nvoken_0.6.0_darwin_arm64.tar.gz"
      sha256 "e69801640e4ffa5a85ea108d1e99e17ca49f5c6009a0fbe492ea0ea91b0834c5"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.6.0/nvoken_0.6.0_darwin_amd64.tar.gz"
      sha256 "f57e1cff9519517ec87e0d2121fda7a7544bfcc95c37977428a8c1361a31305f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.6.0/nvoken_0.6.0_linux_arm64.tar.gz"
      sha256 "73a4a0e9fbbbddaedcfc1f2959623a7353356195befaace315a0f49312288559"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.6.0/nvoken_0.6.0_linux_amd64.tar.gz"
      sha256 "8111370d2ecd08e9d7ba64f0a9f73e835706a92cf7f971bf858b0e6538a8c5ff"
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
