class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.5.0/nvoken_0.5.0_darwin_arm64.tar.gz"
      sha256 "5cdd139622aa46a678b8d3ad5297fcafee0e45881c7c28f61907a3ceded4dd68"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.5.0/nvoken_0.5.0_darwin_amd64.tar.gz"
      sha256 "4521243b3ca27f22ea10d7cdac771c4145989f47857eb9fcaf737610329a6c56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.5.0/nvoken_0.5.0_linux_arm64.tar.gz"
      sha256 "639083d1db4b7ad29e637ca2da19e0bbc4ee319c0a4afae8370aea1f41f8a08f"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.5.0/nvoken_0.5.0_linux_amd64.tar.gz"
      sha256 "963ca5951f07cceab92218512bd7b963ab5bcda7148340c7b51e2426075c97ce"
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
