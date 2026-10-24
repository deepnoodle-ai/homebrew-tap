class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.4.0/mobius-darwin-arm64"
      sha256 "1e8a211d72e65435a67ad478df501e277c56e2d3eb8b0be0569d9961488e29c0"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.4.0/mobius-darwin-amd64"
      sha256 "4feb4bb4f50feae8ff49b5d17a7dae4b04514f862396ca7108d1142359ddbe36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.4.0/mobius-linux-arm64"
      sha256 "fa75fc30dbd30c322ca7bc50cba3888f28b26d37a708087ce46937870c3ba27f"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.4.0/mobius-linux-amd64"
      sha256 "450d357a720bad163d3d2a43bd31d8c88aa75f8511a98bccd852c5cd798ee20d"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
