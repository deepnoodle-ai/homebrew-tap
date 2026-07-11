class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.42"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.42/mobius-darwin-arm64"
      sha256 "87ab9d3cfb819b97246a5d25e1b3a2bd7e5895a1c1e59dad89c1e2c97ad84b4b"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.42/mobius-darwin-amd64"
      sha256 "0014116b13f275b3387dfacabd9b868a206b2ae9166e3c441735b915b5bd7727"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.42/mobius-linux-arm64"
      sha256 "f631b9e65a2f9a2b5a7c6bd793578f72375d5c16eaec9651d15f8431f1d89f65"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.42/mobius-linux-amd64"
      sha256 "6277bbe1e4371366567e616f7cbf30e11a0ef933e141ff3b5e9d8aee05f0d24d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.42", shell_output("#{bin}/mobius --version 2>&1")
  end
end
