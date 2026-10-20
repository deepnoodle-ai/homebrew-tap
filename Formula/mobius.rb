class Mobius < Formula
  desc "CLI for the Mobius agent automation platform"
  homepage "https://www.mobiusops.ai/"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.3.0/mobius-darwin-arm64"
      sha256 "77e75a3604642f02f832223f525dd599c9b93c4327097e546d0177de17426403"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.3.0/mobius-darwin-amd64"
      sha256 "259f76c4390182d4e6a3a8588cdf7a5e63abc129386715fc7806792dd4d76028"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.3.0/mobius-linux-arm64"
      sha256 "174333484f8cd9cf0aa2c9889d69e2f8309aaedb4ea1e4cd8333db3a070f9dbe"
    else
      url "https://github.com/deepnoodle-ai/mobius/releases/download/v0.3.0/mobius-linux-amd64"
      sha256 "9f1df93ae62e9ec6c0d97e9ce12de81373069dd816b7ba33366b6f57edc47185"
    end
  end

  def install
    binary = Dir["mobius-*"].first || "mobius"
    bin.install binary => "mobius"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/mobius --version 2>&1")
  end
end
