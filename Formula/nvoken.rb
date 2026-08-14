class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.16.0/nvoken_0.16.0_darwin_arm64.tar.gz"
      sha256 "daac11163cd40aee9ee9763cdc0d650bf2fe08f58825c90866247f6c092a0b71"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.16.0/nvoken_0.16.0_darwin_amd64.tar.gz"
      sha256 "8f50ea0a1f84b05b2ab7be04d2077bda1d8d02927bb365ae7bb3374def82da76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.16.0/nvoken_0.16.0_linux_arm64.tar.gz"
      sha256 "d4353592f3d076ff40a3267b01ba140c5319b99452c70126981a2df52f12d203"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.16.0/nvoken_0.16.0_linux_amd64.tar.gz"
      sha256 "1b09b20de061471c57fe38f816d8ddc39e4219d2d0f0e9734e2dadbf0fb938e4"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
