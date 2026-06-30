class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.30"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.30/mobius-darwin-arm64"
      sha256 "7f5e704a7b3dc635a4c867706b77b420cb481139d9701ea28b3b4fbe126cc964"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.30/mobius-darwin-amd64"
      sha256 "6392712185eaee80994e601583884c902ef4dec17bf582c82fa34b9e23fa2af8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.30/mobius-linux-arm64"
      sha256 "f7aea5f91a21c6e467e475b10685fb78a27cde536d02e206942e61887e9aa81d"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.30/mobius-linux-amd64"
      sha256 "537def9dd633578cf9777546dea4138367e389a61014efe60a14e0095b4f89a2"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.30", shell_output("#{bin}/mobius --version 2>&1")
  end
end
