class Noodlespy < Formula
  desc "Online user research for AI agents"
  homepage "https://noodlespy.com"
  version "0.0.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.noodlespy.com/noodlespy/0.0.1/noodlespy-darwin-arm64"
      sha256 "91a23721db99a6b1c52c74f953a9c46e2c199cde661abee1b87e1030ecf6ea2e"
    else
      url "https://dl.noodlespy.com/noodlespy/0.0.1/noodlespy-darwin-amd64"
      sha256 "7c7893c52e803f8e0417a4f853448fd28c579499ed3ff40834abe6a6011efeb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.noodlespy.com/noodlespy/0.0.1/noodlespy-linux-arm64"
      sha256 "3f6dc10579eb60fbf28630df1de29b03a00018d1831232fc6edf138bb7eb3681"
    else
      url "https://dl.noodlespy.com/noodlespy/0.0.1/noodlespy-linux-amd64"
      sha256 "fe6f1a834d5f3bb7dfd874967a319f8e6c142c5efdc2a599c3b24bedea6fe81b"
    end
  end

  def install
    binary = Dir["noodlespy-*"].first || "noodlespy"
    bin.install binary => "noodlespy"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/noodlespy --version 2>&1")
  end
end
