class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.24.0/nvoken_0.24.0_darwin_arm64.tar.gz"
      sha256 "ebaeefa9cb4f5202fc998016ff1acb3b65568fe6ff3c342f78a6daeba9be99ef"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.24.0/nvoken_0.24.0_darwin_amd64.tar.gz"
      sha256 "537a5541649530012d92d94d85cada4e88ddebd0c92097144a2a2a90aba51ed8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.24.0/nvoken_0.24.0_linux_arm64.tar.gz"
      sha256 "60f7928a3a865da36532c8f28b4849c2b3bbed6fb2584ab172f7bbfd3b309e24"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.24.0/nvoken_0.24.0_linux_amd64.tar.gz"
      sha256 "768c246148abb9aef52900fd3012de13ff627139e0e3c1b4d2d9afaf1271b02f"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
