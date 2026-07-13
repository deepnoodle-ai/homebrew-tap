class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.44"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.44/mobius-darwin-arm64"
      sha256 "8bdd77aed20a7fdc5e97f814cba98f61ca62ab0ec396ccde97b3a0242d53ae8e"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.44/mobius-darwin-amd64"
      sha256 "82859d55118cf71322841837f503a764d446bf22fc6f3430e925f17a92bde253"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.44/mobius-linux-arm64"
      sha256 "3cf0d203e03d25a43915e35f0ccf5c134d7ec83f0b644a9ebb23598411d16a49"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.44/mobius-linux-amd64"
      sha256 "8655a73bec37d7594b85ab704322967634654e4b24280efb08ad42e70a2ad6f8"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.44", shell_output("#{bin}/mobius --version 2>&1")
  end
end
