class Nvoken < Formula
  desc "Durable agent runtime and client CLI"
  homepage "https://github.com/deepnoodle-ai/nvoken"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.9.0/nvoken_0.9.0_darwin_arm64.tar.gz"
      sha256 "f911fade178ce16e3e11e53332ab1dad28a4b0ed34f12d65457e74260a50e49b"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.9.0/nvoken_0.9.0_darwin_amd64.tar.gz"
      sha256 "f45b56cb21863c0670096032ab674749dcf1533a8e881173706ed2ab4849950e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.9.0/nvoken_0.9.0_linux_arm64.tar.gz"
      sha256 "9c6304b1a4973f2860e12d89ad6d9f85b3fad434234089246051f320902d3468"
    else
      url "https://github.com/deepnoodle-ai/nvoken/releases/download/v0.9.0/nvoken_0.9.0_linux_amd64.tar.gz"
      sha256 "972c50fd9442a9beda1090058639257afdcd5ca0794a98d402f7f1ccedbc5211"
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
