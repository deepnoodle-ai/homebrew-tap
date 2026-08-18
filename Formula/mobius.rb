class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.61"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.61/mobius-darwin-arm64"
      sha256 "beebb2a21de65b67fddc94973c0820257582299516ac42f0716d7fa851a43e6f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.61/mobius-darwin-amd64"
      sha256 "21427b82d5d9641634384d23cf64fecd329b1ce6e514a5af2cff7c24c6dcbc09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.61/mobius-linux-arm64"
      sha256 "872de56ee50a1b64de2ddeb5fe951854cb09e5f3242d87196db32c03294301dd"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.61/mobius-linux-amd64"
      sha256 "95633967548f62a26739aa6852bcf7d924edd0648ead35ce927d8286b957bed2"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.61", shell_output("#{bin}/mobius --version 2>&1")
  end
end
