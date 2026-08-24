class Nvoken < Formula
  desc "Command-line client for the nvoken durable agent runtime"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.28.0/nvoken_0.28.0_darwin_arm64.tar.gz"
      sha256 "f8dff5196ba9b3bdf82990ad89b1e0eb2728a7626276cbfc33c35c7ed40604f3"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.28.0/nvoken_0.28.0_darwin_amd64.tar.gz"
      sha256 "2d7a326314adf747e170dff75bace7177145cd20202eefa0277bedec0da2029d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.28.0/nvoken_0.28.0_linux_arm64.tar.gz"
      sha256 "76f2bbce01208f64f33d101381eadef47b8e3d79bd720cbef93e7d723e883a65"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.28.0/nvoken_0.28.0_linux_amd64.tar.gz"
      sha256 "c47cac01ea50635056dce18cec2f778a896722aa156e996be7f52ab20ac90ade"
    end
  end

  def install
    bin.install "nvoken"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nvoken --version 2>&1")
  end
end
