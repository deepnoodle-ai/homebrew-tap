class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.29.0/nvoken_0.29.0_darwin_arm64.tar.gz"
      sha256 "295ccf706d51ceb94ca7521cc59a43f7cc7a79485f5c59300574e0add89fb3e5"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.29.0/nvoken_0.29.0_darwin_amd64.tar.gz"
      sha256 "1e1f9868a21e8f3fbe561aaf3d22f4600868a85f863f8f1b95b3d68abce4db6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.29.0/nvoken_0.29.0_linux_arm64.tar.gz"
      sha256 "92f5fd0f383b6ed130f6ba10b97690212e757e9b3f65471b3f3c623476fe5adc"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.29.0/nvoken_0.29.0_linux_amd64.tar.gz"
      sha256 "23c26668abb8033c149f357cec39465614ff51c97262084744ea8493aae149f3"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
