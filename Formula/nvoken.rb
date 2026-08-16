class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.19.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.19.0/nvoken_0.19.0_darwin_arm64.tar.gz"
      sha256 "9a109e9572029d9d24441d1a619daeccef858afb62a5777ceb9ae1019cf605d3"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.19.0/nvoken_0.19.0_darwin_amd64.tar.gz"
      sha256 "c3fa03778c5fe9c396d0ce3d8a56bd71a308bd01c0727b26fe77c961c1c74022"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.19.0/nvoken_0.19.0_linux_arm64.tar.gz"
      sha256 "5c024227f7059f979cdd1133398afba4a55945758f4c50a38f7577a665750095"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.19.0/nvoken_0.19.0_linux_amd64.tar.gz"
      sha256 "d8ce58ec9b01cab0c8ca102fc3eb75ac565edbaf016bab785f2dda45d94bc65b"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
