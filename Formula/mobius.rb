class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.51"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.51/mobius-darwin-arm64"
      sha256 "6dc3b9bc6035d3c7e344819ef2b8585f0a5cc1cda958597a8191c6618fac108c"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.51/mobius-darwin-amd64"
      sha256 "4e880bc066c07e62f6539d215f517f4bc84d8a5f1d3b6463ce2c958e8b8fb327"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.51/mobius-linux-arm64"
      sha256 "7e753cc113e5c1e05869bc38badcafccbe7956c36b80c0981551ae448a858913"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.51/mobius-linux-amd64"
      sha256 "bbc15198c4638467ed99760030f0cfe633a6481bb344ebff9bfa563a2c754e2d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.51", shell_output("#{bin}/mobius --version 2>&1")
  end
end
