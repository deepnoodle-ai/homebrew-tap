class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.11.0/nvoken_0.11.0_darwin_arm64.tar.gz"
      sha256 "1850f1a58a8de770f7214490b39b6fe9711db2ab61bb05d7a20fae81ee58700d"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.11.0/nvoken_0.11.0_darwin_amd64.tar.gz"
      sha256 "06adcc116251de11e8988676e801b10c14fb5047888ecb02d4c19376e1f71b1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.11.0/nvoken_0.11.0_linux_arm64.tar.gz"
      sha256 "d55eaad0b8972e71b2aef68afc531230ffc1f4147c1c6a98d7892bdcfe940761"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.11.0/nvoken_0.11.0_linux_amd64.tar.gz"
      sha256 "1d020cf5feca7bfa79c8e1fd9e66296a6e2f1a84877ac747ef16f82f197513c1"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
