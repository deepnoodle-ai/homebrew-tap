class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.0.39"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.39/mobius-darwin-arm64"
      sha256 "8ed52b73f2b9973e66386345b64f1f7b53f4868cbb71b8d2b5629e30c90d3a52"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.39/mobius-darwin-amd64"
      sha256 "66ba607a8d7622eb9278ad206b5762fb21a8d1b40742895ec647ee38735c2df3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.39/mobius-linux-arm64"
      sha256 "fa7421c77dcc8f500431b60818d53a1fcc947c8c83ee1578bb191bb28b3fd134"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.0.39/mobius-linux-amd64"
      sha256 "c1717fa9884431bbda9b1327a494402914e0af97b9f789335cc30c01801f1192"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.0.39", shell_output("#{bin}/mobius --version 2>&1")
  end
end
