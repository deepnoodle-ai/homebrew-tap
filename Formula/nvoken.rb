class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.2.0/nvoken_0.2.0_darwin_arm64.tar.gz"
      sha256 "fedb23d2ba91d3c1cb30f3281974a36354360515d2b46c06f81d48e7dd7432fb"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.2.0/nvoken_0.2.0_darwin_amd64.tar.gz"
      sha256 "2e3b56557b7f9fd7127044b89eead784cc0ca1c4f5e340fe9b1a8ce3547f2ac2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.2.0/nvoken_0.2.0_linux_arm64.tar.gz"
      sha256 "7d03a4e910d0bb79c9dd7c64166899bea6421f4564ad7d1a88e43ca2e05614c0"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.2.0/nvoken_0.2.0_linux_amd64.tar.gz"
      sha256 "cd8fc9e5433042e79d6eda4c36a92d9b02611bfe421259a387182cd0b087a064"
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
