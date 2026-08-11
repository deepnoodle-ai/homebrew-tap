class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.13.0/nvoken_0.13.0_darwin_arm64.tar.gz"
      sha256 "1895dd6cb8393db837adbadedf9cf261309eb54e87fa9edb7e3ef3c8e794a005"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.13.0/nvoken_0.13.0_darwin_amd64.tar.gz"
      sha256 "6ee77798cd1f8756cc63cd628b85407cd7fc4048014242bbd9db253669887778"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.13.0/nvoken_0.13.0_linux_arm64.tar.gz"
      sha256 "c38fa6f747ca58891254417a4bb09626dd6d2b8e4283a49b13856d270312a25b"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.13.0/nvoken_0.13.0_linux_amd64.tar.gz"
      sha256 "72d6d33dfed4f4e1f7c926a1c1732714ed5a4cb13510af55e7fad6f365700a49"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
